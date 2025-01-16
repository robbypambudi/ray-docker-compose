FROM rayproject/ray:${RAY_VERSION}
USER root

# Working directory
WORKDIR /app

# Run the entrypoint
ENTRYPOINT [ "/bin/bash", "./code/src/entrypoint.sh" ]

