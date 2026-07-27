# Source the sandbox persistent environment file
if [ -f /etc/sandbox-persistent.sh ]; then
    . /etc/sandbox-persistent.sh
fi

# Export BASH_ENV for child non-interactive shells
export BASH_ENV=/etc/sandbox-persistent.sh

export PS1="\[\e[1;32m\][\D{%H:%M:%S}]\[\e[0m\] \[\e[1;34m\]\W\[\e[0m\] \$ "

export CLAUDE_CODE_NO_FLICKER=1

# herdr-plus (and other user tools) install here.
export PATH="$HOME/.local/bin:$PATH"

# On the first shell herdr opens, replace its default workspace with the
# "Default" template (a Claude tab + a bash Terminal tab). herdr sets HERDR_ENV=1 and
# HERDR_SOCKET_PATH inside every pane, so herdr-plus can talk to the running
# server from here. A marker file makes this run once per session — critical,
# since the template's own panes source this file too.
if [ "${HERDR_ENV:-}" = "1" ] && command -v herdr-plus >/dev/null 2>&1; then
    _sbx_marker="${XDG_RUNTIME_DIR:-/tmp}/herdr-sbx-layout.done"
    if [ ! -e "$_sbx_marker" ]; then
        : >"$_sbx_marker"

        # Root the workspace at the dir herdr opened here (the mount).
        export SBX_PROJECT_DIR="$PWD"

        # Remember the workspace herdr dropped us in so we can close it once the
        # Default workspace (a fresh, focused one) is built.
        _sbx_default_ws="$(herdr-plus ping 2>/dev/null | sed -n 's/.*workspace=\([^ ]*\).*/\1/p' | head -n1)"

        HERDR_PLUGIN_CONFIG_DIR="$HOME/.config/herdr-plus" herdr-plus open Default >/dev/null 2>&1 || true

        if [ -n "$_sbx_default_ws" ]; then
            # Detached + SIGHUP-proof: closing this workspace tears down the pane
            # this shell runs in, but by now focus is on the Default workspace.
            nohup bash -c "sleep 1; herdr workspace close '$_sbx_default_ws' >/dev/null 2>&1" >/dev/null 2>&1 &
            disown 2>/dev/null || true
        fi
        unset _sbx_default_ws
    fi
    unset _sbx_marker
fi
