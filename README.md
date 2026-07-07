# 🛡️ Sentinel Agent Memory Bank

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Claude_Code_|_Cursor_|_Windsurf_|_Antigravity-blueviolet?style=for-the-badge" alt="Platforms Supported">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License">
  <img src="https://img.shields.io/badge/Ecosystems-Universal_/_All-orange?style=for-the-badge" alt="Ecosystems Supported">
  <img src="https://img.shields.io/badge/PRs-Welcome-brightgreen?style=for-the-badge" alt="PRs Welcome">
</p>

---

## 🌟 Overview

**Sentinel** is a universal system prompt, workspace customization directive, and context management framework designed for autonomous AI coding agents (such as **Claude Code**, **Cursor Composer**, **Windsurf Cascade**, and **Google Antigravity**).

It establishes a structured, self-healing **Project Memory Bank** in any repository, ensuring that AI agents remain coherent, secure, and aligned with your historical engineering decisions—regardless of the programming language or project layout.

> [!IMPORTANT]
> **Why Sentinel?**
> - **Memory Bank Coherence:** Prevents AI "amnesia" between chats by reading and updating standard context files.
> - **Zero Code Damage:** Imposes strict guardrails prohibiting the AI from editing source code during analysis.
> - **Ecosystem Adaptation:** Auto-detects target stacks (WordPress, Flutter, C++, Rust, Next.js, Android, etc.) and adjusts testing/validation commands dynamically.
> - **Secure & Modern Default:** Forces the AI to use modern/stable dependency versions and apply security functions (like `esc_url()`) from line one.

---

## 🗺️ System Architecture

Sentinel organizes your repository's meta-context into four primary operational directories. None of these folders touch your application's source code.

```
📁 [Your Repository]
├── 📁 .memory-bank/        # Core context, session states, and historical logs
│   ├── active-session.json # Runtime state of the active session
│   ├── system-coherence.md # Automated verification checklist
│   ├── migration-map.md    # Tracks old files archived or reorganized
│   ├── adr/                # Architecture Decision Records (ADRs)
│   └── changelog/          # Change logs and verified worklogs
├── 📁 .specs/              # Project technical specifications
│   ├── bootstrap.md        # Setup, installation, and build commands
│   ├── boundary-conditions.md # Technical limitations and safety budgets
│   ├── constitution.md     # Code quality and development standards
│   └── security-standards.md # Security mitigations and dependency policies
├── 📁 .agents/             # AI agent runtime customizations
│   ├── AGENTS.md           # Project-scoped AI behavior and rules (No Fluff)
│   └── runtime-manifest.json # Runtime configuration and permission boundaries
└── 📁 .tasks/              # Active task management
    ├── pipeline.md         # Active and future roadmap backlog
    └── handoff.md          # Multi-agent/session transition logs
```

For more details on directories, see [docs/architecture.md](file:///docs/architecture.md).

---

## 🔄 The 7-Step Lifecycle

Sentinel executes in a highly controlled, step-by-step cycle:

```mermaid
graph TD
    A[Step 1: Discovery] -->|Verify Env/Stack| B{Approval Gate}
    B -->|Approved| C[Step 2: Reorganize Directory]
    B -->|Rejected/Abort| Exit([End Session])
    C -->|Optional| D[Step 2.5: Code Restructuring]
    D --> E[Step 3: Write Specs & Memory]
    E --> F[Step 4: Archive Old Docs]
    F --> G[Step 5: Recommend Validation]
    G --> H[Step 6: Git Safe Proposal]
    H --> I[Step 7: Final Report]
```

Read more about how these phases run in [docs/workflow.md](file:///docs/workflow.md).

---

## 🚀 Installation & Usage

### 🟢 Zero Setup — Let Your Agent Install It (For Beginners)

You don't need to understand what a "skill folder" or a "terminal" is. Just copy the text below for your AI agent and paste it into a new chat. The agent will handle the entire setup.

**For Claude Code:**
> Install sentinel skills: run `git clone --depth 1 https://github.com/BigDesigner/sentinel-agent-skill.git ~/.claude/skills/sentinel-agent-skill` then tell me what slash commands are now available.

**For Google Antigravity (Windows):**
> Install sentinel skills: run `git clone --depth 1 https://github.com/BigDesigner/sentinel-agent-skill.git "$env:USERPROFILE\.gemini\config\skills\sentinel-agent-skill"` then tell me what slash commands are now available.

**For Cursor or Windsurf:**
> Since Cursor and Windsurf do not currently support native skill execution, open the `templates/sentinel-directive.md` file from this repo, copy all of its text, and paste it into your IDE's global rules (e.g., Settings → Rules for AI). Then simply type `/sentinel` in a new chat to begin.

---

### 🛠️ Advanced / Manual Installation

For power users who prefer to install the skills manually into their respective agent config directories:

| Platform | Install Path |
|---|---|
| **Claude Code** | `~/.claude/skills/sentinel-agent-skill/` |
| **Antigravity (Windows)** | `%USERPROFILE%\.gemini\config\skills\sentinel-agent-skill\` |
| **Antigravity (Mac/Linux)** | `~/.gemini/config/skills/sentinel-agent-skill/` |
| **Cursor** | `~/.cursor/skills/sentinel-agent-skill/` |
| **Windsurf** | `~/.windsurf/skills/sentinel-agent-skill/` |
| **OpenAI Codex** | `~/.codex/skills/sentinel-agent-skill/` |

**Manual Install Command (Example for Mac/Linux Antigravity):**
```bash
git clone https://github.com/BigDesigner/sentinel-agent-skill.git ~/.gemini/config/skills/sentinel-agent-skill
```

---

### ⚡ Available Skills

Once installed, you can trigger specific workflows using the following commands:

| Command | Purpose |
|---|---|
| **`/sentinel`** | Full 7-step bootstrap (Analyzes codebase, reorganizes folders, writes specs). |
| **`/sentinel-mb`** | Initializes or syncs only the `.memory-bank/` structure and active session state. |
| **`/sentinel-scan`** | Scans all `*.md` / `*.txt` files in the repo and outputs a categorized inventory. |
| **`/sentinel-audit`** | Runs a report-only security audit against `.specs/security-standards.md`. |
| **`/sentinel-handoff`** | Updates `handoff.md` and `active-session.json` to transition to a new session. |

---

### 3. As a One-Time Bootstrapper
If you just want to organize a messy, flat project:
1. Copy the contents of [templates/sentinel-directive.md](file:///templates/sentinel-directive.md).
2. Paste it directly into your chat with Claude Code, ChatGPT, or Gemini.
3. Type *"Boot/Migrate this project"* and watch it scan, organize, and prepare validation/security specifications.

---

## 💬 AI Communication Standards (No Fluff)

Sentinel configures your workspace to enforce clean, direct agent interactions via `.agents/AGENTS.md`. When initialized, agents are bound by the following communication constraints:

*   **No Fluff:** The agent completely omits introductory greetings, congratulations, and politeness filler.
*   **Direct Focus:** Focuses immediately on production-ready code, clean commands, and raw audits.
*   **Error Acknowledgment:** When correcting an error, the agent will never apologize. It acknowledges the error and outputs the corrected replacement immediately.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](file:///LICENSE) file for details.

---

<p align="center">
  Made with 🛡️ for autonomous AI agents. Contributions and issues are welcome!
</p>
