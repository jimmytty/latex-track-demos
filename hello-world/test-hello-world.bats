#!/usr/bin/env bats
load bats-extra

@test 'Say Hi!' {
    expected='Hello, World!'
    run ./run-exercise.sh 'hello-world' "$BATS_RUN_TMPDIR"
    assert_success
    assert_output "$expected"
}
