#!/usr/bin/env bash
# SessionStart hook: prints every instructions/*.md file (in filename order).
# Claude Code adds a SessionStart hook's stdout to the session context, so these
# files act like a global CLAUDE.md that follows you into every project.
set -euo pipefail

dir="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}/instructions"

echo "# Global instructions (from agent-config)"
echo "These apply to every project. A project's own CLAUDE.md wins where the two conflict."
for f in "$dir"/*.md; do
  [ -e "$f" ] || continue
  echo
  cat "$f"
done
