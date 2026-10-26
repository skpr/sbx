FROM docker/sandbox-templates:claude-code-docker

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends extrepo && \
    extrepo enable mise && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential curl htop jq make mise rsync unzip vim yq wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g @edspencer/paddock@latest

USER agent

ENV HOME=/home/agent
ENV PATH="/home/agent/.local/bin:${PATH}"

# Keep Paddock state in the agent's home rather than the workspace mount.
ENV PADDOCK_DATA_DIR=/home/agent/.paddock

# Paddock refuses a non-loopback bind without auth. This kit is for local dev and
# the sandbox is only reachable through ports published with "sbx ports".
ENV PADDOCK_DANGEROUSLY_ALLOW_OPEN=1

# Ensure we are running the latest Claude Code.
RUN claude update
