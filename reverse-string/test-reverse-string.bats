#!/usr/bin/env bats
load ../bats-extra

@test 'an empty string' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\String{""}'
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output '””'
}

@test 'a word' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\String{robot}'
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output 'tobor'
}

@test 'a capitalised word' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\String{Ramen}'
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output 'nemaR'
}

@test 'a sentence with punctuation' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="\providecommand\String{I'm hungry!}"
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "!yrgnuh m’I"
}

@test 'a palindrome' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\String{racecar}'
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output 'racecar'
}

@test 'an even-sized word' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\String{drawer}'
    run ../run-exercise.sh 'reverse-string' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output 'reward'
}
