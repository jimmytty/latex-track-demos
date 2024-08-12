#!/bin/bash

declare -r exercise="$1"
declare -r tmpdir="$2"
declare -r input="$3"

commands="\input{$exercise.tex}"

if [[ ! -z "$input" ]]; then
    commands="$input $commands"
fi

## Check Syntax
if pdflatex -halt-on-error -draftmode "$commands" | grep -m1 -q '!'
then
    echo 'Syntax Error'
    echo "Check $exercise.log for details."
    exit 1
else
    rm "$exercise.log"
fi
[[ -f "$exercise.aux" ]] && rm "$exercise.aux"

## Produce PDF
pdflatex -output-directory="$tmpdir" "$commands" 1>/dev/null

if [[ ! -f "$tmpdir/$exercise.pdf" ]]; then
    echo 'Error'
    exit 1
fi

## Convert to text
pdftotext -eol unix -enc UTF-8 -layout -nopgbrk "$tmpdir/$exercise.pdf" -
