
FROM rayproject/ray:2.40.0-py310-cpu

USER root

# Working directory
WORKDIR /app

# Run the entrypoint
ENTRYPOINT [ "/bin/bash", "./code/src/entrypoint.sh" ]

