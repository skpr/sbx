FROM docker/sandbox-templates:claude-code-docker

USER root

RUN apt update && \
    apt install -y extrepo && \
    extrepo enable mise && \
    apt update

RUN apt update && apt install -y \
    curl \
    htop \
    jq \
    make \
    mise \
    rsync \
    vim \
    yq

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
