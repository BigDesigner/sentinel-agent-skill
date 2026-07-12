#!/bin/bash
# Sentinel Skills Installer for Claude Code (macOS/Linux)

CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🛡️ Installing Sentinel Skills into Claude Code..."

# Create claude skills directory if it doesn't exist
mkdir -p "$CLAUDE_SKILLS_DIR"

# Copy or symlink each skill directory
for skill_path in "$REPO_DIR"/skills/sentinel-*; do
    if [ -d "$skill_path" ]; then
        skill_name=$(basename "$skill_path")
        echo "  -> Linking $skill_name..."
        rm -rf "$CLAUDE_SKILLS_DIR/$skill_name"
        ln -sf "$skill_path" "$CLAUDE_SKILLS_DIR/$skill_name"
    fi
done

# Also link the main sentinel bootstrap skill
if [ -d "$REPO_DIR/skills/sentinel" ]; then
    echo "  -> Linking sentinel..."
    rm -rf "$CLAUDE_SKILLS_DIR/sentinel"
    ln -sf "$REPO_DIR/skills/sentinel" "$CLAUDE_SKILLS_DIR/sentinel"
fi

echo "✅ Sentinel skills successfully linked! Restart Claude Code and verify commands: /sentinel, /sentinel-mb, etc."
