#!/usr/bin/env bats
load ../bats-extra

@test 'no name given' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=''
    expected='One for you, one for me.'
    run ../run-exercise.sh 'two-fer' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'a name given' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\PersonName{Alice}'
    expected='One for Alice, one for me.'
    run ../run-exercise.sh 'two-fer' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'another name given' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\PersonName{Bob}'
    expected='One for Bob, one for me.'
    run ../run-exercise.sh 'two-fer' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}
