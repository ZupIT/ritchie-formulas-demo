#!/bin/sh

runFormula() {
    if [ "$TEMA" == "Pilares Cultura Zup (medium)" ]; then
      filename="pilares-cultura"
    fi
    if [ "$TEMA" == "Tecnologias (easy)" ]; then
      filename="tecnologias"
    fi
    if [ "$TEMA" == "Produtos Zup (easy)" ]; then
      filename="produtos-zup"
    fi
    if [ "$TEMA" == "Habilidades Zupper (hard)" ]; then
      filename="habilidades"
    fi
    if [ "$TEMA" == "Benfícios Zup (medium)" ]; then
      filename="beneficios"
    fi

    clear
    display
    main
}
##These are the stick figures to be displayed if the user does a wrong guess
function wrong1 {
    echo
    echo "        🙂             "
    echo
    echo
    echo
    echo
    echo
    echo
}
function wrong2 {
    echo
    echo "        🤨            "
    echo "         |            "
    echo
    echo
    echo
    echo
    echo
}
function wrong3 {
    echo
    echo "        😐            "
    echo "         |\           "
    echo
    echo
    echo
    echo
    echo
}
function wrong4 {
    echo
    echo "        😒            "
    echo "        /|\           "
    echo
    echo
    echo
    echo
    echo
}
function wrong5 {
    echo
    echo "        😬            "
    echo "        /|\           "
    echo "        /             "
    echo
    echo
    echo
    echo
}
function wrong6 {
    echo
    echo "        😲            "
    echo "        /|\           "
    echo "        / \           "
    echo
    echo
    echo
    echo
}
function wrong7 {
    echo
    echo "         __________   "
    echo "         |        |   "
    echo "        😫        |   "
    echo "        /|\       |   "
    echo "        / \       |   "
    echo "    ______________|___"
    echo
}

function display {
    DATA[0]=" # # #     #   # # # # #   # # # # #   #       #   #   # # # # # "
    DATA[1]=" #     #   #       #       #           #       #   #   #         "
    DATA[2]=" #     #   #       #       #           #       #   #   #         "
    DATA[3]=" #####     #       #       #           # # # # #   #   # # #     "
    DATA[4]=" #    #    #       #       #           #       #   #   #         "
    DATA[5]=" #     #   #       #       #           #       #   #   #         "
    DATA[6]=" #     #   #       #       # # # # #   #       #   #   # # # # # "
    DATA[7]="                                                                 "
    DATA[8]="                                                       by  ZupIT"
    echo


    # virtual coordinate system is X*Y ${#DATA} * 8
    ## This is to put the title in the centre

    REAL_OFFSET_X=$(($((`tput cols` - 56)) / 2))
    REAL_OFFSET_Y=$(($((`tput lines` - 6)) / 2))

    draw_char() {
        V_COORD_X=$1
        V_COORD_Y=$2

        tput cup $((REAL_OFFSET_Y + V_COORD_Y)) $((REAL_OFFSET_X + V_COORD_X))

        printf %c ${DATA[V_COORD_Y]:V_COORD_X:1}
    }

    trap 'exit 1' INT TERM

    tput civis
    clear
    tempp=8
    while :; do
        tempp=`expr $tempp - 8`
        for ((c=1; c <= 7; c++)); do
            tput setaf $c
            for ((x=0; x<${#DATA[0]}; x++)); do
                for ((y=0; y<=9; y++)); do
                    draw_char $x $y
                done
            done
        done
        sleep 1
        clear
        break
    done
}


function main() {
    ##The function used to read the word list
    readarray a < "formula"/$filename

    randind=`expr $RANDOM % ${#a[@]}`

    word=${a[$randind]}

    guess=()

    guesslist=()
    guin=0

    word=`echo $word | tr -dc '[:alnum:] \n\r' | tr '[:upper:]' '[:lower:]'`
    len=${#word}

    for ((i=0;i<$len;i++)); do
        guess[$i]="_"
    done

    mov=()

    for ((i=0;i<$len;i++)); do
        mov[$i]=${word:$i:1}
        # echo -n "${mov[$i]} "
    done

    for ((j=0;j<$len;j++)); do
        if [[ ${mov[$j]} == " " ]]; then
            guess[$j]=" "
        fi
    done

    ## Display the initial setup
    wrong=0
    limit=7

    while [[ $wrong -lt $limit ]]; do
        echo "Hangman Ritchie - Tema: " $TEMA
        case $wrong in
            0)echo " "
            ;;
            1)wrong1
            ;;
            2)wrong2
            ;;
            3)wrong3
            ;;
            4)wrong4
            ;;
            5)wrong5
            ;;
            6)wrong6
            ;;
        esac

        if [[ wrong -eq 0 ]]; then
            for i in {1..7}
            do
                echo
            done
        fi

        notover=0
        for ((j=0;j<$len;j++)); do
            if [[ ${guess[$j]} == "_" ]]; then
                notover=1
            fi
        done

        echo "🔠 Letras digitadas:" ${guesslist[@]}
        echo "🔴 Número de erros:" $wrong "/" $limit
        for ((k=0;k<$len;k++)); do
            echo -n "${guess[$k]} "
        done
        echo
        echo

        if [[ notover -eq 1 ]]; then
            echo -n "📝 Digite uma letra: "
            read -n 1 -e letter
            letter=$(echo $letter | tr [A-Z] [a-z])
            guesslist[$guin]=$letter
            guin=`expr $guin + 1`
        fi

        f=0;
        for ((i=0;i<$len;i++)); do
            if [[ ${mov[$i]} == $letter ]]; then
                guess[$i]=$letter
                f=1
            fi
        done
        if [[ f -eq 0 ]]; then
            wrong=`expr $wrong + 1`
        fi

        if [[ notover -eq 0 ]]; then
            echo
            echo "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
            echo "🏆    👏👏👏👏    Você ganhou, parabéns! 😁😆        👏👏👏👏   🏆"
            echo "🏆 Aproveite e compartilhe seu conhecimento com outros zupper   🏆"
            echo "🏆 🌍 https://sites.google.com/zup.com.br/zup                   🏆"
            echo "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
            echo
            play_again
        fi
        clear
    done

    wrong7
    echo "🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳"
    echo "                     Você perdeu.! 😠😭                         "
    echo "Mas não desanime, acesse a Zup Net e conheça tudo sobre a Zup.  "
    echo "🌍 https://sites.google.com/zup.com.br/zup                      "
    echo "                    A palavra era: $word                       "
    echo "🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳🔳"
    play_again
}

function play_again() {
    echo
    echo -n "Gostaria de jogar novamente ? (y/n) "
    read -n 1 choice
    case $choice in
        [yY]) clear
              main
        ;;
    esac
    clear
    echo "Obrigado por jogar e testar o Ritchie"
    echo 🌍 https://ritchiecli.io
    echo 🌍 https://sites.google.com/zup.com.br/zup
    echo 
    echo "Jogo adaptado do https://github.com/akshayub/Hangman-Bash"
    echo
    tput cnorm
    exit
}
