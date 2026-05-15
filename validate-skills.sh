#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="skills"
issues=0

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Missing skills/ directory"
  exit 1
fi

for dir in "$SKILLS_DIR"/*/; do
  [ -d "$dir" ] || continue
  skill="$(basename "$dir")"
  file="$dir/SKILL.md"

  if [ ! -f "$file" ]; then
    echo "FAIL $skill: missing SKILL.md"
    issues=$((issues + 1))
    continue
  fi

  if ! head -n 1 "$file" | grep -qx -- '---'; then
    echo "FAIL $skill: SKILL.md must start with YAML frontmatter"
    issues=$((issues + 1))
  fi

  name="$(awk '/^---$/{n++; next} n==1 && /^name:/{sub(/^name:[[:space:]]*/, ""); print; exit}' "$file" | tr -d '"')"
  desc="$(awk '/^---$/{n++; next} n==1 && /^description:/{sub(/^description:[[:space:]]*/, ""); print; exit}' "$file")"

  if [ "$name" != "$skill" ]; then
    echo "FAIL $skill: frontmatter name '$name' must match directory"
    issues=$((issues + 1))
  fi

  if ! printf '%s' "$skill" | grep -Eq '^[a-z0-9]([a-z0-9-]{0,62}[a-z0-9])?$'; then
    echo "FAIL $skill: invalid skill name"
    issues=$((issues + 1))
  fi

  if [ -z "$desc" ]; then
    echo "FAIL $skill: missing description"
    issues=$((issues + 1))
  elif [ "${#desc}" -gt 1024 ]; then
    echo "FAIL $skill: description too long"
    issues=$((issues + 1))
  fi

  lines="$(wc -l < "$file" | tr -d ' ')"
  if [ "$lines" -gt 500 ]; then
    echo "WARN $skill: SKILL.md is $lines lines; consider moving details to references/"
  fi

done

if [ "$issues" -gt 0 ]; then
  echo "Skill validation failed: $issues issue(s)"
  exit 1
fi

echo "Skill validation passed"
