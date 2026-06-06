#!/usr/bin/env bash
#
# install.sh — install portable Agent Skills from this repo into any harness.
#
# Skills live under skills/<category>/<skill>/ for organization. Harnesses scan a
# flat skills directory, so this script links/copies each skill folder DIRECTLY
# into the target dir (the category layer is stripped) — keeping it spec-compliant.
#
# Usage:
#   ./install.sh --harness claude                 # install ALL skills for a known harness
#   ./install.sh --harness codex --copy           # copy instead of symlink
#   ./install.sh --dir ~/some/skills              # install into an explicit directory
#   ./install.sh --harness claude spending-analysis budget-builder
#                                                 # install only the named skills
#   ./install.sh --list                           # list skills found in this repo
#
# Default is symlink (edits in the repo propagate live). Use --copy for a snapshot.
# Harness paths are best-known defaults and can change between versions — verify in
# docs/harness-support.md, or just pass --dir <path>.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$REPO_DIR/skills"

MODE="symlink"
TARGET_DIR=""
HARNESS=""
declare -a WANT=()

die() { echo "error: $*" >&2; exit 1; }

harness_dir() {
  case "$1" in
    claude)  echo "$HOME/.claude/skills" ;;          # confirmed
    codex)   echo "$HOME/.codex/skills" ;;           # common default — verify
    gemini)  echo "$HOME/.gemini/skills" ;;          # common default — verify
    goose)   echo "$HOME/.config/goose/skills" ;;    # common default — verify
    openclaw) echo "$HOME/.openclaw/skills" ;;       # common default — verify
    *) return 1 ;;
  esac
}

list_skills() {
  find "$SKILLS_ROOT" -mindepth 2 -maxdepth 2 -type d -exec test -f '{}/SKILL.md' ';' -print \
    | sed "s#$SKILLS_ROOT/##" | sort
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --harness) HARNESS="${2:-}"; shift 2 ;;
    --dir)     TARGET_DIR="${2:-}"; shift 2 ;;
    --copy)    MODE="copy"; shift ;;
    --symlink) MODE="symlink"; shift ;;
    --list)    list_skills; exit 0 ;;
    -h|--help) sed -n '2,22p' "$0"; exit 0 ;;
    --*)       die "unknown flag: $1" ;;
    *)         WANT+=("$1"); shift ;;
  esac
done

[[ -d "$SKILLS_ROOT" ]] || die "no skills/ directory found at $SKILLS_ROOT"

if [[ -z "$TARGET_DIR" ]]; then
  [[ -n "$HARNESS" ]] || die "specify --harness <name> or --dir <path> (see --help)"
  TARGET_DIR="$(harness_dir "$HARNESS")" || die "unknown harness '$HARNESS' — use --dir <path> instead"
fi

mkdir -p "$TARGET_DIR"
echo "→ target: $TARGET_DIR  (mode: $MODE)"

installed=0
while IFS= read -r rel; do
  name="$(basename "$rel")"
  if [[ ${#WANT[@]} -gt 0 ]]; then
    match=0; for w in "${WANT[@]}"; do [[ "$w" == "$name" ]] && match=1; done
    [[ $match -eq 1 ]] || continue
  fi
  src="$SKILLS_ROOT/$rel"
  dst="$TARGET_DIR/$name"
  rm -rf "$dst"
  if [[ "$MODE" == "copy" ]]; then cp -R "$src" "$dst"; else ln -s "$src" "$dst"; fi
  echo "  ✓ $name"
  installed=$((installed+1))
done < <(list_skills)

[[ $installed -gt 0 ]] || die "no matching skills installed"
echo "done — $installed skill(s) installed into $TARGET_DIR"
