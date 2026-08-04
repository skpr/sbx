# Docker Sandbox Kit

Standardised agentic development environment using Docker Sandboxes.

## How to use

**1. Install Docker Sandboxes**

```
https://docs.docker.com/ai/sandboxes/get-started
```

**2. Run your first sandbox**

While in a project directory run the following command:

```bash
$ sbx run skpr --kit "git+https://github.com/skpr/sbx.git"
```

**3. Start the Docker Sandbox TUI to review environments**

```
$ sbx
```

## Tools

| Tool                  | Purpose                                                              |
|-----------------------|-----------------------------------------------------------------------|
| `skpr` (`skpr-agent`) | A trimmed-down version of the Skpr CLI for the agent to use.         |
| `opencode`            | Open source coding agent.                                            |

## Roadmap

* Default mcp server configuration
* Baked in skills
* Token saving projects/plugins
