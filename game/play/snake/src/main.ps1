#requires -version 2

#
# Formula Ritchie
# Author : Fabiano Chiaretto Fernandes
#

#
# Powershell Snake Game
# Author : Kurt Jaegers
#

#
# Draws the snake to the screen, including cleaning up the last segment of the tail
#
function DrawTheSnake
{

    # Erase the tail segment that is disappearing
    $rui.cursorposition = $tail[0]
    write-host -foregroundcolor white -backgroundcolor black -NoNewline " "

    # Shift all of the tail segments down one
    for ($i=0; $i -lt ($tailLength - 1); $i++)
    {
        $tail[$i].x = $tail[$i+1].x
        $tail[$i].y = $tail[$i+1].y
    }

    # Set the last segment of the tail to the current position
    $tail[-1].x = $coord.x
    $tail[-1].y = $coord.y

    # Draw all segments of the snake
    for ($i=0; $i -lt $tailLength; $i++)
    {
        $rui.cursorposition = $tail[$i]
        write-host -foregroundcolor white -backgroundcolor white -NoNewline " "
    }

}


#
# Generate a random location for the apple, making sure it isnt inside the snake
#
function MoveTheApple
{
    $ok = $true;
    do
    {
        $script:apple.x = get-random -min 2 -max ($rui.WindowSize.width - 2)
        $script:apple.y = get-random -min 2 -max ($rui.WindowSize.height - 2)
        $ok=$true
        for ($i=0; $i -lt $tailLength; $i++)
        {
            if (($tail[$i].x -eq $apple.x) -and ($tail[$i].y -eq $apple.y))
            {
                $ok=$false;
            }
        }
    } While (!$ok)
}

#
# Draw the apple to the screen
#
function DrawTheApple
{
    $rui.CursorPosition = $apple
    write-host -foregroundcolor red -backgroundcolor black "@"
}

#
# Check to see if the snake hits the apple
#
function CheckAppleHit
{
    # if the x/y of the head matches the x/y of the apple, we hit the apple
    if (($tail[-1].x -eq $apple.x) -and ($tail[-1].y -eq $apple.y))
    {
        # relocate the apple
        MoveTheApple

        $score += 500

        # Add to the snake's length
        $points=5
        for ($x=0; $x -lt $points; $x++) {
            $script:tailLength++
            $script:tail += new-object System.Management.Automation.Host.Coordinates
            $script:tail[-1].x = $coord.x
            $script:tail[-1].y = $coord.y
        }
    }
}

#
# Check to see if the snake's head hits the walls of the screen
#
function CheckWallHits
{
    if (($coord.x -eq 0) -or ($coord.y -eq 0) -or ($coord.x -eq $host.ui.rawui.windowsize.width-1) -or ($coord.y -eq $host.ui.rawui.windowsize.height-1))
    {
        cls
        write-host -foregroundcolor red "You lost! Score was $score"
        exit
    }
}


#
# Draw a fence around the edges of the screen
#
function DrawScreenBorders
{
    $cur = new-object System.Management.Automation.Host.Coordinates
    $cur.x=0
    $cur.y=0

    for ($x=0; $x -lt $host.ui.rawui.windowsize.width; $x++)
    {
        $cur.x=$x
        $cur.y=0
        $host.ui.rawui.cursorposition = $cur
        write-host -foregroundcolor black -backgroundcolor white -nonewline "#"

        $cur.y=$host.ui.rawui.windowsize.height-1
        $host.ui.rawui.cursorposition = $cur
        write-host -foregroundcolor black -backgroundcolor white -nonewline "#"

    }

    for ($y=0; $y -lt $host.ui.rawui.windowsize.height-1; $y++)
    {
        $cur.y=$y
        $cur.x=0
        $host.ui.rawui.cursorposition = $cur
        write-host -foregroundcolor black -backgroundcolor white -nonewline "#"

        $cur.x=$host.ui.rawui.windowsize.width-1
        $host.ui.rawui.cursorposition = $cur
        write-host -foregroundcolor black -backgroundcolor white -nonewline "#"

    }
}

function CheckSnakeBodyHits
{
    for ($i=0; $i -lt $tailLength -1; $i++)
    {
        if (($tail[$i].x -eq $coord.x) -and ($tail[$i].y -eq $coord.y))
        {
            cls
            write-host -foregroundcolor red "You lost! Score was $score"
            exit
        }
    }
}

# ---------------------------------
# ---------------------------------
# Main script block starts here
# ---------------------------------
# ---------------------------------

if ($host.name -ne "ConsoleHost")
{
    write-host "This script should only be run in a ConsoleHost window (outside of the ISE)"
    exit
    $done=$true
}

# Grab UI objects and set some colors
$ui=(get-host).ui
$rui=$ui.rawui
$rui.BackgroundColor="Black"
$rui.ForegroundColor="Red"
cls

# write out lines to make sure the buffer is big enough to cover the screen
for ($i=0; $i -lt $rui.screensize.height; $i++)
{
    write-host ""
}
$coord = $rui.CursorPosition
$save = $coord
try {
    $cs = $rui.cursorsize
    $rui.cursorsize=0
} Catch {
}
$score = 0

$done = $false

$before = 0
$after  = 15
$dir = 0

$coord.X = $rui.screensize.width/2
$coord.y = $rui.screensize.height/2

$coord.x = 80
$coord.Y = 15
$apple = new-object System.Management.Automation.Host.Coordinates
DrawScreenBorders;
MoveTheApple;

$tail = @()
$tailLength = 10

for ($i=0; $i -lt $tailLength; $i++)
{
    $tail += new-object System.Management.Automation.Host.Coordinates
    $tail[$i].x = $coord.x
    $tail[$i].y = $coord.y
}

while (!$done)
{

    if ($rui.KeyAvailable)
    {
        $key = $rui.ReadKey()
        if ($key.virtualkeycode -eq -27)
        {
            $done=$true
        }
        if ($key.keydown)
        {
            # Left
            if ($key.virtualkeycode -eq 37)
            {
                $dir=0
            }
            # Up
            if ($key.virtualkeycode -eq 38)
            {
                $dir=1
            }
            # Right
            if ($key.virtualkeycode -eq 39)
            {
                $dir=2
            }
            # Down
            if ($key.virtualkeycode -eq 40)
            {
                $dir=3
            }
        }
    }

    if ($dir -eq 0)
    {
        $coord.x--;
    }

    if ($dir -eq 1)
    {
        $coord.y--;
    }

    if ($dir -eq 2)
    {
        $coord.x++;
    }

    if ($dir -eq 3)
    {
        $coord.y++;
    }

    DrawTheApple;
    DrawTheSnake;
    CheckWallHits;
    CheckSnakeBodyHits;
    CheckAppleHit;

    start-sleep -mil 50

    $score += $tailLength;

}

try {
    $rui.cursorsize=$cs
} Catch {
}
