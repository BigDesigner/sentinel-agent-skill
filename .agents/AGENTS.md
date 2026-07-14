# Sentinel Agent Skill - Project Directives

This document contains project-scoped rules for AI agents working on the `sentinel-agent-skill` repository itself.

## 1. Meta-Memory Constraint
Do NOT generate a full `.memory-bank/` directory for this specific project. Since this repository is the *generator* of the Memory Bank framework, adding a full memory bank here creates confusing recursion. All agent memory and project rules for this repo are kept exclusively within this `.agents/AGENTS.md` file.

## 2. Directory Naming Sync (CRITICAL)
When updating any `SKILL.md` file or the core `sentinel-directive.md`, you MUST ensure directory names match exactly. 
The canonical directory structure is:
- `.memory-bank/changelog/` (SINGULAR)
- `.memory-bank/audits/` (PLURAL)
- `.memory-bank/adr/`
- `.memory-bank/bugs/`
NEVER use `changelogs/` or `audit-reports/`.

## 3. Language Auto-Detection Boundary
As fixed in previous sessions, the agent MUST NOT auto-detect the user's preferred language based on install commands pasted into the chat. The core directive specifically forbids this to ensure international users aren't locked into English just because they copied an English install script.

## 4. Handoff Context Boundary
When updating the `sentinel-handoff` skill, remember that the handoff summary must ONLY include actual codebase modifications. It must completely exclude global IDE setups, out-of-scope chat context (like global plugin installations), or casual conversation.

## 5. Modifications and Versioning
Any updates to the core directive or skills must be pushed to `origin/main` so they can be distributed to users via `git pull`. Use atomic, conventional commits (e.g., `fix(mb): ...`, `feat(audit): ...`).

## 6. Global IDE Compatibility (Cross-IDE Strictness)
This repository is a global AI agent framework. Whenever you create or modify a skill, you MUST explicitly account for the architectural and file-system differences between major AI IDEs (Antigravity, Cursor, Windsurf, Claude Code). Never write vague or guessing pathing instructions. You must define deterministic, platform-agnostic, and cross-IDE fallback logic for any file manipulation or artifact reading.

## 7. Auto-Sync Sentinel Directive Template (CRITICAL)
Whenever you modify `skills/sentinel/SKILL.md`, you MUST automatically synchronize those changes to `templates/sentinel-directive.md` without asking the user for permission. `templates/sentinel-directive.md` acts as the raw fallback template for IDEs that do not support native skill execution (like Cursor or Windsurf). Do not let these two files drift apart.

## 8. Absolute English-Only Codebase (Zero Tolerance)
This framework is distributed globally. Under NO circumstances are you allowed to hardcode non-English strings, fallback messages, variable names, or filenames directly into `SKILL.md` or any repository file. Even if the user is communicating with you in a non-English language and provides localized examples in the chat, you MUST mentally translate them to English before writing them to the codebase. 

However, **all interactive chat responses, direct explanations, and generated Markdown reports shown to the user (such as `walkthrough.md` or audit summaries) MUST be written in the user's preferred language (e.g., Spanish, French, German, Turkish, etc.) at runtime**, while the actual codebase files (like Python test scripts or config keys) remain in English. Always check `active-session.json` to verify the `preferred_language`. If `active-session.json` is missing or the language is unconfirmed, inspect the conversation history to detect the user's language (e.g. Turkish) and respond in that language.

## 9. Auto-Sync Custom Rules Template
Whenever you modify this `.agents/AGENTS.md` file, you MUST automatically evaluate and synchronize those changes to `templates/custom-rules-template.md` without asking the user for permission. `templates/custom-rules-template.md` acts as the raw fallback template for custom IDE rules. Do not let these two core rule sets drift apart.

## 10. Destructive Skill Safety (disable-model-invocation)
Any skill that can destroy state, delete files, or mutate session records (currently `sentinel-rescue`, `sentinel-prune`, and `sentinel-handoff`) MUST declare `disable-model-invocation: true` in its SKILL.md frontmatter. This ensures Claude Code never auto-triggers these skills via description matching — they can only be invoked explicitly by the user typing the slash command. IDEs that do not recognize this field ignore it safely, so the flag is cross-IDE harmless. Apply this rule to every future skill that performs deletion, git resets, or state mutation.

## 11. Git Commit Anonymity Rule
- **CRITICAL GIT PROHIBITION**: Never append, inject, or suggest any "Co-Authored-By" trailers, metadata, or attribution lines (e.g., "Co-Authored-By: Claude...") in git commit messages, code blocks, or automated git scripts. All git commit messages must remain completely anonymous or strictly limited to the user's explicit content.

## 12. Trigger-Rich Skill Description Standard (CRITICAL)
Every skill's frontmatter description MUST follow the trigger-rich formula (400-700 characters in English using folded YAML scalar `>-` format) documenting: (1) what it does, (2) what project files it reads/requires, (3) what outputs it writes, and (4) a set of "Use when..." natural language trigger phrases. Destructive or state-mutating skills (`rescue`, `prune`, `handoff`, `coauth`) MUST use a deterrent tone and explicitly state: "Only run when the user explicitly invokes the command. Do not auto-trigger." in their description to prevent auto-invocation across all IDE platforms.

