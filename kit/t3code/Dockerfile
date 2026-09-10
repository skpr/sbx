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

USER agent

# Ensure we are running the latest Claude Code.
RUN claude update

ENTRYPOINT [ "bash", "-c" ]
CMD [ "t3", "serve", "--host", "0.0.0.0", "--port", "3773" ]
