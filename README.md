# Docker Sandbox Kit

Standardised agentic development environment using Docker Sandboxes.

## Herdr at the heart

On startup you'll be dropped straight into `herdr`, the tool that manages your agentic workflow end-to-end.

Herdr gives you:

- **Workspaces** — isolated environments for each task or project
- **Git worktrees** — so you can work across multiple branches without switching contexts or stashing changes
- **Tabs and panes** — a terminal layout for running your agent alongside other shell sessions
- **Status overview** — a live view of what your agent is doing, so you always know its current state at a glance

In short, herdr is the control surface for the sandbox — it's the first thing you see, and the place you'll spend most of your time coordinating work between your agent and your own shell sessions.

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
| `herdr`               | Manages your coding agent alongside additional shell sessions.       |
| `skpr` (`skpr-agent`) | A trimmed-down version of the Skpr CLI for the agent to use.         |
| `opencode`            | Open source coding agent.                                            |

## Roadmap

* Default mcp server configuration
* Baked in skills
* Token saving projects/plugins
