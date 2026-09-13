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
ARG KIRO_URL_BASE="https://desktop-release.q.us-east-1.amazonaws.com/latest"

RUN case "$TARGETARCH" in \
      amd64) ASSET=kirocli-x86_64-linux.zip ;; \
      arm64) ASSET=kirocli-aarch64-linux-musl.zip ;; \
      *) echo "unsupported arch: $TARGETARCH" >&2; exit 1 ;; \
    esac && \
    curl -fsSL "${KIRO_URL_BASE}/${ASSET}" -o /tmp/k.zip && \
    unzip -q /tmp/k.zip -d /tmp && \
    find /tmp/kirocli -maxdepth 2 -type f -perm -u+x ! -name '*.sh' \
      -exec install -m 0755 {} /usr/local/bin/ \; && \
    rm -rf /tmp/k.zip /tmp/kirocli && \
    kiro-cli --version

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
