# agent-config

Instructions and skills for coding agents — applied to every session, in every project.

This repo is a **Claude Code plugin marketplace** with one plugin, `core`. Installing
the plugin brings everything below into any repo without copying files into it.

## Layout

```
.claude-plugin/marketplace.json     Marketplace manifest (lists the plugins in this repo)
plugins/core/
  .claude-plugin/plugin.json        Plugin manifest (name, version)
  instructions/*.md                 Global instructions — your "global CLAUDE.md" (any number of files)
  hooks/hooks.json                  SessionStart hook that injects instructions/*.md
  hooks/inject-instructions.sh      Prints the instruction files, in filename order
  skills/<name>/SKILL.md            Shared skills (loaded on demand by their description)
  agents/<name>.md                  Shared subagents
  commands/<name>.md                Shared slash commands
```

### Where things go

| You want…                                  | Put it in                                              |
| ------------------------------------------ | ------------------------------------------------------ |
| A rule the agent always follows            | `plugins/core/instructions/*.md`                       |
| A procedure used only for certain tasks    | `plugins/core/skills/<name>/SKILL.md`                  |
| A specialised helper agent                 | `plugins/core/agents/<name>.md`                        |
| A `/command` you type yourself             | `plugins/core/commands/<name>.md`                      |

Keep `instructions/` short: it is loaded into every session. Anything long or
task-specific belongs in a skill, which costs only its one-line description until used.

Plugins can't ship a `CLAUDE.md`, so the SessionStart hook prints the instruction files
into the session context instead (on startup, `/clear` and after compaction).

## Installing

`scripts/install.sh` installs the plugin at **user scope** from a local checkout, so it
applies to every project on that machine. The plugin loads in place from the checkout,
so after a `git pull` the changes take effect at the next session start.

### Cloud sessions (claude.ai/code)

Cloud sessions don't read your local `~/.claude`, and they don't install plugins listed in a
repo's `.claude/settings.json`. Use the cloud environment's **setup script** instead
(environment menu in the session title bar → Edit → Setup script). It runs as root
before Claude Code starts, for every session in that environment, whatever the repo:

```bash
#!/bin/bash
# Global agent instructions and skills (elem-techniki/agent-config)
git clone --depth 1 https://github.com/elem-techniki/agent-config /opt/agent-config \
  && /opt/agent-config/scripts/install.sh \
  || echo "agent-config: install skipped" >&2
```

The `|| echo` keeps a failed clone from blocking the session. Check that it worked by
running `/context` in a new session: the "Global instructions" block should appear. The
setup result is cached with the environment for about 7 days. To pick up changes sooner,
edit the setup script (any change forces a re-run).

### Your machine

```bash
git clone https://github.com/elem-techniki/agent-config ~/agent-config
~/agent-config/scripts/install.sh
```

Or interactively: `/plugin marketplace add elem-techniki/agent-config`, then
`/plugin install core@elem-agent-config`.

### Whole organisation (alternative)

An org Owner can enable the plugin for everyone, cloud included, through server-managed
settings (claude.ai → Admin settings → Claude Code → Managed settings):

```json
{
  "extraKnownMarketplaces": {
    "elem-agent-config": {
      "source": { "source": "github", "repo": "elem-techniki/agent-config" },
      "autoUpdate": true
    }
  },
  "enabledPlugins": { "core@elem-agent-config": true }
}
```
