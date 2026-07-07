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
This framework is distributed globally. Under NO circumstances are you allowed to hardcode non-English strings, fallback messages, variable names, or filenames directly into `SKILL.md` or any repository file. Even if the user is communicating with you in a non-English language and provides localized examples in the chat, you MUST mentally translate them to English before writing them to the codebase. Interactive dynamic responses should be handled in English inside the code, and translated to the user's preferred language only at runtime.
