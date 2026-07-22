FROM docker/sandbox-templates:claude-code

USER root

RUN apt update && \
    apt install -y extrepo && \
    extrepo enable mise && \
    apt update

RUN apt update && apt install -y vim curl htop mise

USER agent

RUN curl -fsSL https://opencode.ai/install | bash
RUN curl -fsSL https://herdr.dev/install.sh | sh

ADD --chown=agent:agent config.toml /home/agent/.config/herdr/config.toml
ADD --chown=agent:agent bashrc /home/agent/.bashrc

CMD ["herdr"]
