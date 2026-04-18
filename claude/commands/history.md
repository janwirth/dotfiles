Please read my global conversation history from ~/.claude/history.jsonl and present it in an easy-to-scan format.

For each conversation, show:
- Entry number
- Date/time (human readable format: "Nov 10, 2025 15:48")
- Project name (just the folder name, not full path)
- First 60-80 characters of the conversation topic
- Session ID (if available)

IMPORTANT: Format as a plain text table with properly padded columns (NOT markdown tables).

Focus on the most recent 10 conversations in the first table. If there are more, show another 5-7 in an "Additional Recent Conversations" table.

At the end, include:
---
Tip: Resume any conversation by running:
- claude --resume <session-id>
- claude --resume (to see an interactive list of recent sessions)
