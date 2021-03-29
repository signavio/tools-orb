# Runs prior to every test
setup() {
    # Load our script file.
    export TOOL_NAME=hadolint
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "1: Test hadolint Install' {
    export BIN_PATH="/tmp/bin"
    export TOOL_VERSION="1.18.0"
    Validate
    result=$(Install)
    echo $result
    [[ "$result" =~ '1.18.0' ]]
}
