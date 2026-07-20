FROM docker/sandbox-templates:claude-code

USER root

# lazydocker
RUN curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh \
    | DIR=/usr/local/bin bash

# btop
RUN apt-get update && apt-get install -y --no-install-recommends btop && \
    rm -rf /var/lib/apt/lists/*

USER agent

RUN curl -fsSL https://herdr.dev/install.sh | sh

ADD --chown=agent:agent config.toml /home/agent/.config/herdr/config.toml
ADD --chown=agent:agent bashrc /home/agent/.bashrc

CMD ["herdr"]
