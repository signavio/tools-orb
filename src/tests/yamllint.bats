TOOL_NAME="yamllint"
TOOL_VERSION="1.26.3"
BIN_PATH="/tmp/bin"

setup() {
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "3: Test ${TOOL_NAME} Install' {
    run Install
    echo $lines
    run ${TOOL_NAME} --version
    echo $lines
    [ $status = 0 ]
    [[ "$lines" =~ "${TOOL_VERSION}" ]]
}
