# Commands

Easily add and author [Reusable Commands](https://circleci.com/docs/2.0/reusing-config/#authoring-reusable-commands) to the `src/commands` directory.

Each _YAML_ file within this directory will be treated as an orb command, with a name which matches its filename.

View the included _[install-hadolint.yml](./install-hadolint.yml)_ example.

```yaml
description: >
  installing hadolint
parameters:
  version:
    type: string
    default: "1.18.0"
    description: "hadolint version"
  bin-path:
    type: string
    default: "~/bin"
    description: "bin path where to install tool"
steps:
  - run:
      environment:
        BIN_PATH: <<parameters.bin-path>>
        TOOL_VERSION: <<parameters.version>>
      name: Install Hadolint
      command: <<include(scripts/install-hadolint.sh)>>
```

## See:
 - [Orb Author Intro](https://circleci.com/docs/2.0/orb-author-intro/#section=configuration)
 - [How to author commands](https://circleci.com/docs/2.0/reusing-config/#authoring-reusable-commands)
