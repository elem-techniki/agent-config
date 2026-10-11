#!/usr/bin/env bash
# Installs the `core` plugin from this checkout at user scope, so it applies to
# every project on this machine. Safe to re-run (refreshes to the checkout's state).
# Used by the cloud environment setup script; works locally too.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

claude plugin marketplace add "$root" >/dev/null 2>&1 \
  || claude plugin marketplace update elem-agent-config
claude plugin install core@elem-agent-config --scope user
