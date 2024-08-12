#!/bin/bash

declare -r exercise="$1"
declare -r tmpdir="$2"

## Check Syntax
if pdflatex -halt-on-error -draftmode "$exercise.tex" | grep -m1 -q '!'; then
    echo 'Syntax Error'
    echo "Check $exercise.log for details."
    exit 1
else
    rm "$exercise.log"
fi
[[ -f "$exercise.aux" ]] && rm "$exercise.aux"

## Produce PDF
pdflatex -output-directory="$tmpdir" "$exercise.tex" 1>/dev/null

## Convert to text
pdftotext -eol unix -enc UTF-8 -layout -nopgbrk "$tmpdir/$exercise.pdf" -
