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
