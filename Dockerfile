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

ENV CLAUDE_CODE_NO_FLICKER=1

CMD [ "claude" ]
