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

RUN wget https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli.deb && \
    dpkg -i kiro-cli.deb && \
    apt-get install -f && \
    rm -f kiro-cli.deb

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
