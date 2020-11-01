#!/bin/bash

# shellcheck source=/dev/null
. "$(dirname "$0")"/unix/formula/formula.sh --source-only
#In sh for receive inputs of CLI use: $SAMPLE_TEXT, $SAMPLE_LIST and $SAMPLE_BOOL for this example
$NUMBER_ONE
$NUMBER_TWO
$OPERATION

runFormula
