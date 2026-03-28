#!/bin/bash
# Sync shared Claude Code config files to all Runcycles repos.
#
# Usage: ./scripts/sync-claude-config.sh [--dry-run]
#
# This script copies shared-config/session-start-global-deny.sh to the
# .claude/ directory of every sibling repo. Run from the .github repo root.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SHARED_DIR="$REPO_ROOT/shared-config"
PARENT_DIR="$(dirname "$REPO_ROOT")"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

REPOS=(
  cycles-server
  cycles-server-admin
  cycles-spring-boot-starter
  cycles-client-python
  cycles-client-typescript
  cycles-openai-agents
  cycles-mcp-server
  cycles-openclaw-budget-guard
  cycles-agent-action-authority-demo
  cycles-runaway-demo
  cycles-protocol
  docs
)

SYNCED=0
SKIPPED=0
UPTODATE=0

for repo in "${REPOS[@]}"; do
  target_dir="$PARENT_DIR/$repo/.claude"

  if [[ ! -d "$PARENT_DIR/$repo" ]]; then
    echo "SKIP $repo — not cloned at $PARENT_DIR/$repo"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  if [[ ! -d "$target_dir" ]]; then
    echo "SKIP $repo — no .claude/ directory"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  src="$SHARED_DIR/session-start-global-deny.sh"
  dst="$target_dir/session-start-global-deny.sh"

  if diff -q "$src" "$dst" >/dev/null 2>&1; then
    echo "OK   $repo — already up to date"
    UPTODATE=$((UPTODATE + 1))
  else
    if $DRY_RUN; then
      echo "DIFF $repo — would update session-start-global-deny.sh"
    else
      cp "$src" "$dst"
      echo "SYNC $repo — updated session-start-global-deny.sh"
    fi
    SYNCED=$((SYNCED + 1))
  fi
done

echo ""
echo "Done. Synced: $SYNCED, Up to date: $UPTODATE, Skipped: $SKIPPED"
if $DRY_RUN; then
  echo "(dry run — no files were modified)"
fi
