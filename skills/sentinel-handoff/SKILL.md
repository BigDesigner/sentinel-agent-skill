---
name: sentinel-handoff
description: Updates the session state and handoff document for transitioning between work sessions.
triggers:
  - /sentinel-handoff
---

# `sentinel-handoff` Skill

## Overview
This skill is designed to be run at the end of a work session. It quickly captures the current state, updates the session ID, and records what was accomplished so the next agent can seamlessly resume work.

## Execution Steps

1. **Update `active-session.json`**
   - Read `.memory-bank/active-session.json`.
   - Generate a new `session_id` (UUID v4).
   - Update `last_active` to the current ISO-8601 timestamp.
   - Save the file.

2. **Update `handoff.md`**
   - Read `.tasks/handoff.md`.
   - Record the current Git branch and the last commit hash/message.
   - Summarize the key actions completed in the current session based on recent changes or chat context.
   - Note any open issues or immediate next steps for the incoming agent.
   - Append this new entry to the top of the handoff history.

3. **Output Summary**
   - Provide a brief summary of the handoff state to the user, confirming that the session has been successfully packaged.
