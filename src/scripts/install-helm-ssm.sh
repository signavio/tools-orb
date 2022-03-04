DEFAULT_HELM_PLUGIN_DIR: "/home/argocd/.local/share/helm/plugins"
HELM_SECRETS_VERSION= "v3.10.0"
TOOL_VERSION= "3.1.9"
TOOL_NAME="helm ssm"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then

    helm plugin install https://github.com/jkroepke/helm-secrets --version ${HELM_SECRETS_VERSION} \
    && mkdir "$DEFAULT_HELM_PLUGIN_DIR/helm-ssm" \
    && curl -sL "https://github.com/codacy/helm-ssm/releases/download/${HELM_SSM_VERSION}/helm-ssm-linux.tgz" | tar xz -C "$DEFAULT_HELM_PLUGIN_DIR/helm-ssm"
    "${DEFAULT_HELM_PLUGIN_DIR}//helm-ssm" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
