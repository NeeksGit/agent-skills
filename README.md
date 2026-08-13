# claude-skills

My agent skills, kept in one repo and symlinked into `~/.claude/skills` on every
machine I work on. Works with Claude Code, and with any agent that reads
`~/.agents/skills`.

## Install

```bash
git clone https://github.com/NeeksGit/claude-skills.git
cd claude-skills
./install.sh
```

That symlinks every directory in `skills/` into `~/.claude/skills` (and into
`~/.agents/skills` if that directory exists). Run `./install.sh --dry-run` first
if you want to see what it will touch - it replaces any real directory of the
same name.

Because the installed skills are symlinks, editing
`~/.claude/skills/grilling/SKILL.md` edits this repo. Commit and push to sync
the change everywhere.

## Staying in sync

```bash
git pull      # on the other machine; symlinks pick up the change immediately
```

New skills added to `skills/` need one `./install.sh` re-run to get linked.

## What's here

### Grilling

A relentless interview that stress-tests a plan before you build it.

| Skill | Invoke |
|---|---|
| `grilling` | automatic, or `/grilling` |
| `grill-me` | `/grill-me` - grilling, no docs written |
| `grill-with-docs` | `/grill-with-docs` - grilling that writes ADRs and a glossary as it goes |

`grill-with-docs` pulls in `domain-modeling`; `grilling` reaches for `prototype`
when a question is better answered by throwaway code than by more talking.

### Engineering

| Skill | What it does |
|---|---|
| `domain-modeling` | Builds `CONTEXT.md` and ADRs - ubiquitous language for the project |
| `tdd` | Red-green-refactor, plus what makes a test worth keeping |
| `codebase-design` | Deep-module vocabulary: interfaces, seams, depth, leverage |
| `prototype` | Throwaway code that answers one design question |

### Writing

| Skill | What it does |
|---|---|
| `hemingway` | Two-pass editor: strip AI tells, then cut every word that isn't working |
| `writing-for-agents` | How to write skills, `AGENTS.md`, `CLAUDE.md` |
| `writing-fragments` | Explore - mine raw material, no structure yet |
| `writing-shape` | Exploit - shape the pile into an article, paragraph by paragraph |
| `writing-beats` | Exploit - assemble the pile into a journey of beats |

### Conversation

| Skill | What it does |
|---|---|
| `handoff` | Compacts the conversation into a doc another agent can pick up |
| `wait-what` | That last message didn't land - re-pitch it |

## Updating the vendored skills

Most of these come from [mattpocock/skills](https://github.com/mattpocock/skills)
(MIT - see [NOTICE](./NOTICE)). They are vendored, not submoduled, so upstream
fixes are a manual pull:

```bash
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp-skills
# copy the ones you track over skills/<name>, drop each skill's agents/ dir,
# then update the commit sha in skills/UPSTREAM
git diff    # review before committing - you may have local edits worth keeping
```

If you'd rather have all of Matt's skills and automatic updates instead of this
curated subset, use his plugin: `claude plugins install mattpocock-skills`.

## License

MIT. See [LICENSE](./LICENSE) and [NOTICE](./NOTICE).
