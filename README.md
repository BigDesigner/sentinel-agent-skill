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

### 1. As a Native Antigravity Skill (`/sentinel`)
If you are using Google Antigravity, you can trigger this entire prompt with a simple slash command:

1. Clone this repository:
   ```bash
   git clone https://github.com/BigDesigner/sentinel-agent-memory-bank.git
   ```
2. Symlink or copy the `skills/sentinel` folder into your global customization root:
   * **Windows:** `C:\Users\<Your-Username>\.gemini\config\skills\sentinel`
   * **Linux/macOS:** `~/.gemini/config/skills/sentinel`
3. In any Antigravity workspace chat, type **`/sentinel`** to bootstrap or sync the memory bank!

### 2. In Cursor or Windsurf (Global System Rules)
To make your agent behave like a Sentinel-equipped assistant in Cursor or Windsurf:

1. Copy the full content of [templates/sentinel-directive.md](file:///templates/sentinel-directive.md).
2. Paste it into your IDE's system rules settings:
   * **Cursor:** `Settings -> Rules for AI`
   * **Windsurf:** Cascade settings file.
3. Your agent will now automatically search for and maintain your `.memory-bank` structure across every project you open.

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
