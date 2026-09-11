FROM docker/sandbox-templates:claude-code-docker

USER root

RUN apt update && \
    apt install -y extrepo && \
    extrepo enable mise && \
    apt update

RUN apt update && apt install -y \
    bash \
    build-essential \
    curl \
    htop \
    jq \
    make \
    mise \
    rsync \
    vim \
    yq \
    wget

RUN curl -fsSL https://herdr.dev/install.sh | sh
RUN curl -fsSL https://cli.kiro.dev/install | bash

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
