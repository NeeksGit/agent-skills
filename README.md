# agent-skills

My agent skills, in one repo, symlinked into `~/.claude/skills` on every machine
I work on. Built for Claude Code; works with any agent that reads
`~/.agents/skills`.

## Install

```bash
git clone https://github.com/NeeksGit/agent-skills.git
cd agent-skills
./install.sh
```

Symlinks every directory in `skills/` into `~/.claude/skills`, and into
`~/.agents/skills` if it exists. It replaces any real directory of the same
name, so run `./install.sh --dry-run` first to see what it touches.

The installed skills are symlinks, so editing
`~/.claude/skills/grilling/SKILL.md` edits this repo. Commit and push to sync.

## Staying in sync

```bash
git pull      # symlinks pick up the change immediately
```

A new skill in `skills/` needs one `./install.sh` re-run to get linked.

## Skills

### Grilling

An interview that stress-tests a plan before you build it.

| Skill | Invoke |
|---|---|
| `grilling` | automatic, or `/grilling` |
| `grill-me` | `/grill-me` - grilling, no docs written |
| `grill-with-docs` | `/grill-with-docs` - grilling that writes ADRs and a glossary as it goes |

`grill-with-docs` pulls in `domain-modeling`. `grilling` reaches for `prototype`
when throwaway code answers a question faster than more talking.

### Engineering

| Skill | What it does |
|---|---|
| `domain-modeling` | Writes `CONTEXT.md` and ADRs - the project's ubiquitous language |
| `tdd` | Red-green-refactor, plus what makes a test worth keeping |
| `codebase-design` | Deep-module vocabulary: interfaces, seams, depth, leverage |
| `prototype` | Throwaway code that answers one design question |

### Writing

| Skill | What it does |
|---|---|
| `hemingway` | Two passes: strip AI tells, then cut what isn't working |
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

Thirteen of these come from [mattpocock/skills](https://github.com/mattpocock/skills)
(MIT - see [NOTICE](./NOTICE)). They are vendored, not submoduled, so upstream
fixes are a manual pull:

```bash
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp-skills
# copy the ones you track over skills/<name>, drop each skill's agents/ dir,
# then update the commit sha in skills/UPSTREAM
git diff    # review first - you may have local edits worth keeping
```

For all of Matt's skills with automatic updates, use his plugin instead:
`claude plugins install mattpocock-skills`.

## License

MIT. See [LICENSE](./LICENSE) and [NOTICE](./NOTICE).
