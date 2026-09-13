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
    unzip \
    wget

RUN curl -fsSL https://herdr.dev/install.sh | sh

ARG TARGETARCH
RUN case "$TARGETARCH" in \
      amd64) ASSET=kirocli-x86_64-linux.zip ;; \
      arm64) ASSET=kirocli-aarch64-linux-musl.zip ;; \
    esac && \
    curl -fsSL "https://desktop-release.q.us-east-1.amazonaws.com/latest/${ASSET}" -o /tmp/k.zip && \
    unzip -q /tmp/k.zip -d /tmp && bash /tmp/kirocli/install.sh --no-confirm && rm -rf /tmp/k.zip /tmp/kirocli

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
