#!/bin/bash
# Sync shared Claude Code config files to all Runcycles repos.
#
# Usage: ./scripts/sync-claude-config.sh [--dry-run]
#
# Copies the shared-config/ scripts to the .claude/ directory of every
# sibling repo:
#   - session-start-global-deny.sh   (synced to every repo in REPOS)
#   - session-start-maven-proxy.sh   (synced only to Java repos in JAVA_REPOS)
#
# Run from the .github repo root.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SHARED_DIR="$REPO_ROOT/shared-config"
PARENT_DIR="$(dirname "$REPO_ROOT")"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

# Repos that receive the global-deny hook (all Claude-enabled Cycles repos).
REPOS=(
  cycles-server
  cycles-server-admin
  cycles-spring-boot-starter
  cycles-spring-ai-starter
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

# Java repos that additionally receive the maven-proxy hook.
JAVA_REPOS=(
  cycles-server
  cycles-server-admin
  cycles-spring-boot-starter
  cycles-spring-ai-starter
)

SYNCED=0
SKIPPED=0
UPTODATE=0

# sync_one <repo> <filename>
# Copies $SHARED_DIR/<filename> into $PARENT_DIR/<repo>/.claude/<filename> if
# the destination is missing or differs. Honors DRY_RUN.
sync_one() {
  local repo="$1"
  local filename="$2"
  local target_dir="$PARENT_DIR/$repo/.claude"

  if [[ ! -d "$PARENT_DIR/$repo" ]]; then
    echo "SKIP $repo/$filename — not cloned at $PARENT_DIR/$repo"
    SKIPPED=$((SKIPPED + 1))
    return
  fi

  if [[ ! -d "$target_dir" ]]; then
    echo "SKIP $repo/$filename — no .claude/ directory"
    SKIPPED=$((SKIPPED + 1))
    return
  fi

  local src="$SHARED_DIR/$filename"
  local dst="$target_dir/$filename"

  if diff -q "$src" "$dst" >/dev/null 2>&1; then
    echo "OK   $repo/$filename — already up to date"
    UPTODATE=$((UPTODATE + 1))
  else
    if $DRY_RUN; then
      echo "DIFF $repo/$filename — would update"
    else
      cp "$src" "$dst"
      echo "SYNC $repo/$filename — updated"
    fi
    SYNCED=$((SYNCED + 1))
  fi
}

for repo in "${REPOS[@]}"; do
  sync_one "$repo" session-start-global-deny.sh
done

for repo in "${JAVA_REPOS[@]}"; do
  sync_one "$repo" session-start-maven-proxy.sh
done

echo ""
echo "Done. Synced: $SYNCED, Up to date: $UPTODATE, Skipped: $SKIPPED"
if $DRY_RUN; then
  echo "(dry run — no files were modified)"
fi
