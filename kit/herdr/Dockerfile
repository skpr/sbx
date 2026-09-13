FROM docker/sandbox-templates:claude-code-docker

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends extrepo && \
    extrepo enable mise && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential curl htop jq make mise rsync unzip vim yq wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER agent

ENV HOME=/home/agent
ENV PATH="/home/agent/.local/bin:${PATH}"

RUN curl -fsSL https://herdr.dev/install.sh | sh && herdr --version

ADD --chown=agent:agent config.toml /home/agent/.config/herdr/config.toml

# Ensure we are running the latest Claude Code.
RUN claude update
