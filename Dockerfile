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

COPY --from=ghcr.io/skpr/cli:v1.8.1 /usr/local/bin/skpr-agent /usr/local/bin/skpr

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update

RUN curl -fsSL https://herdr.dev/install.sh | sh
RUN curl -fsSL https://raw.githubusercontent.com/cloudmanic/herdr-plus/main/install.sh | VERSION=v0.1.20 sh

ADD --chown=agent:agent config.toml /home/agent/.config/herdr/config.toml
ADD --chown=agent:agent bashrc /home/agent/.bashrc
ADD --chown=agent:agent projects/default.toml /home/agent/.config/herdr-plus/projects/default.toml

CMD ["herdr"]
