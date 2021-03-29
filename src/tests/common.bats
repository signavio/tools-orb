setup() {
    # Load our script file.
    source ./src/scripts/install-hadolint.sh
}

@test '1: Test required argument BIN_PATH' {
    export TOOL_VERSION="1.18.0"
    run Validate
    [ "$status" -eq 1 ]
    [[ "${lines[0]}" =~ 'required variable BIN_PATH not found' ]]
}

@test '2: Test required argument TOOL_VERSION' {
    export BIN_PATH="/tmp/bin"
    run Validate
    [ "$status" -eq 1 ]
    [[ "${lines[0]}" =~ 'required variable TOOL_VERSION not found' ]]
}
