#!/usr/bin/env bash
set -euo pipefail

# Symlinks every skill in this repo into the local agent skill directories.
# Because they are symlinks, editing a skill in ~/.claude/skills edits this
# repo's working tree - commit and push to sync the change to other machines.
#
#   ./install.sh              # install into ~/.claude/skills (and ~/.agents/skills if present)
#   ./install.sh --dry-run    # show what would happen, change nothing

REPO="$(cd "$(dirname "$0")" && pwd)"
DRY_RUN=false
[ "${1:-}" = "--dry-run" ] && DRY_RUN=true

DESTS=("$HOME/.claude/skills")
[ -d "$HOME/.agents" ] && DESTS+=("$HOME/.agents/skills")

for DEST in "${DESTS[@]}"; do
  if [ -L "$DEST" ]; then
    echo "error: $DEST is itself a symlink; remove it and re-run" >&2
    exit 1
  fi

  $DRY_RUN || mkdir -p "$DEST"

  for src in "$REPO"/skills/*/; do
    src="${src%/}"
    name="$(basename "$src")"
    target="$DEST/$name"

    # An existing real directory is a copy of an older install - it would
    # shadow the repo, so replace it. A stale symlink is replaced silently.
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      if $DRY_RUN; then
        echo "would REPLACE real dir $target"
      else
        rm -rf "$target"
      fi
    fi

    if $DRY_RUN; then
      echo "would link $name -> $src ($DEST)"
    else
      ln -sfn "$src" "$target"
      echo "linked $name -> $src ($DEST)"
    fi
  done
done
