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
    yq

RUN npm install -g t3@latest

# Label Claude requests as T3 Code instead of sdk-cli/sdk-ts, which drain the
# 5-hour usage window faster. Remove once this lands upstream.
# https://github.com/pingdotgg/t3code/pull/25597
ENV CLAUDE_CODE_ENTRYPOINT=t3-code

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update
