
FROM rayproject/ray:2.40.0-py310-gpu

USER root

# Working directory
WORKDIR /app


# Run the entrypoint
ENTRYPOINT [ "/bin/bash", "./code/src/entrypoint.sh" ]

