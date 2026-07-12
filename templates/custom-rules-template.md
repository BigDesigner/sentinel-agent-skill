# Project-Scoped Rules & Behavioral Constraints

This file outlines the communication styling, workflow preferences, and stack-specific behaviors expected from all AI agents operating within this repository. 

---

## 💬 Communication Style Rules

- **No Fluff:** Completely omit introduction sentences, greetings, politeness templates, and conversational filler (e.g., "Certainly! I can help with that," "Hope this helps").
- **Direct Focus:** Address the task immediately. Provide production-ready code, clean command lines, and structured analysis reports.
- **Error Handling:** When an error occurs or is corrected, do not apologize (e.g., "I'm sorry," "My apologies"). Acknowledge the issue directly, and present the corrected code, command, or file edit.
- **Response Language:** Even though codebase files must remain strictly in English, all interactive chat responses, explanations, and generated Markdown reports shown to the user (such as `walkthrough.md` or audit summaries) MUST be written in the user's preferred language (e.g., Turkish if the user communicates in Turkish) at runtime. Always check `active-session.json` to verify the `preferred_language`.

---

## 🛠️ Stack-Specific Agent Behaviors

- **Validation Checks:** Before proposing a git commit, always suggest or run syntax verification appropriate for the stack:
  - PHP: `php -l <file>`
  - Node/TypeScript: `pnpm run typecheck` or `npm run lint`
  - Flutter: `flutter analyze`
  - Rust: `cargo check`
- **Dependency Guardrails:** Never introduce outdated or deprecated libraries. Always inspect the lockfile/manifest to verify dependency alignment.
- **Security Sanitization:** Follow rules in `.specs/boundary-conditions.md` explicitly. Ensure output variables, templates, and queries are appropriately escaped or bound.

---

## 💾 Operational Rules

- **No Automatic Commits:** Always output proposed git modifications and proposed commit messages, and wait for explicit human confirmation.
- **Clean Architecture Boundaries:** Keep directories decoupled according to the repository's convention. Avoid throwing files directly into the root unless it is an established ecosystem rule (e.g. main plugin file in WordPress).
