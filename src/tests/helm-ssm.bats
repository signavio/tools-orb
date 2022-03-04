TOOL_NAME="helm-ssm"
TOOL_VERSION="v3.5.3"
INSTALL-SSM-PLUGIN=true
SSM-PLUGIN-VERSION="3.1.9"

setup() {
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "2: Test ${TOOL_NAME} Install' {
    run Install
    echo $lines
    [[ "$lines" =~ "${TOOL_VERSION}" ]]
    run ${BIN_PATH}/${TOOL_NAME} --version
    echo $lines
    [ $status = 0 ]
}
