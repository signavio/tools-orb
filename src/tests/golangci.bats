# Runs prior to every test
setup() {
    # Load our script file.
    export TOOL_NAME=golangci
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "1: Test golangci Install' {
    export BIN_PATH="/tmp/bin"
    export TOOL_VERSION="1.27.0"
    Validate
    run Install
    [[ "$lines" =~ '1.27.0' ]]
}
