#!/usr/bin/env bats
load ../bats-extra

@test 'Missed target' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-9}\providecommand\Y{9}'
    expected='Points: 0.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'On the outer circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0}\providecommand\Y{10}'
    expected='Points: 1.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'On the middle circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-5}\providecommand\Y{0}'
    expected='Points: 5.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'On the inner circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0}\providecommand\Y{-1}'
    expected='Points: 10.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Exactly on center' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0}\providecommand\Y{0}'
    expected='Points: 10.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Near the center' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-0.1}\providecommand\Y{-0.1}'
    expected='Points: 10.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just within the inner circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0.7}\providecommand\Y{0.7}'
    expected='Points: 10.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just outside the inner circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0.8}\providecommand\Y{-0.8}'
    expected='Points: 5.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just within the middle circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-3.5}\providecommand\Y{3.5}'
    expected='Points: 5.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just outside the middle circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-3.6}\providecommand\Y{-3.6}'
    expected='Points: 1.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just within the outer circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{-7.0}\providecommand\Y{7.0}'
    expected='Points: 1.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Just outside the outer circle' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{7.1}\providecommand\Y{-7.1}'
    expected='Points: 0.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}

@test 'Asymmetric position between the inner and middle circles' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='\providecommand\X{0.5}\providecommand\Y{-4}'
    expected='Points: 5.'
    run ../run-exercise.sh 'darts' "$BATS_RUN_TMPDIR" "$input"
    assert_success
    assert_output "$expected"
}
