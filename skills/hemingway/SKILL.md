---
name: hemingway
description: Two-pass writing editor. First pass detects AI tells (generic phrasing, stock openers, AI-scent vocabulary, correlative constructions, corporate buzzwords). Second pass cuts ruthlessly - every adjective, adverb, qualifier, and unnecessary word. Use when drafts feel bloated, AI-flavored, or slow. Invoke with /hemingway [text].
---

# Hemingway + AI Tell Detector

Two-pass editor. Run both passes on any submitted text.

---

## Pass 1: AI Tell Detection

Scan for AI writing patterns in document order. Output a sequential checklist only - no rewrites, no categories, no scores.

### Detection Categories

**Openers to flag:**
- "In today's fast-paced world" / "In the ever-evolving landscape of [X]" / "In the realm of [X]"
- "In a world where..." / "In an era where..." / "With the rise of..."
- "Let's dive in" / "Let's break it down" / "Let's delve into"
- "At its core, [X] is [Y]" / "It is important/worth noting that [X]"
- "Join us as we..." / "As [trend] continues to..."

**AI-scent vocabulary to flag:**
- delve/delved/delving (most notorious AI tell)
- tapestry, reimagined, deep dive, leverage, utilize, harness, unlock, unleash, empower
- navigate (the complexities/landscape), pivotal, crucial, vital, noteworthy
- groundbreaking, cutting-edge, revolutionary, transformative
- explore the intricacies of, robust, nuanced, multifaceted, seamless, comprehensive, meticulous
- vibrant, intricate, bespoke, foster, underscore, illuminate, endeavor, embark, elevate, amplify
- optimize, spearhead, revolutionize
- just (as emphasis), actually (as emphasis)
- utilize -> use, plethora/myriad -> many, commence -> start, facilitate -> help
- optimal -> best, prior to -> before, subsequently -> then, whilst/amongst -> while/among

**Stock templates to flag:**
- "When it comes to [X], [claim]" / "The [adjective] world of [X]"
- "Plays a vital/significant/crucial role" / "Serves as a testament to [X]"
- "Has emerged as a..." / "Now more than ever..." / "One thing is clear..."
- "Moving forward..." / "The bottom line is..." / "At the end of the day..."

**Exhausted metaphors to flag:**
- "A tapestry of..." / "A treasure trove of..." / "A double-edged sword"
- "Tip of the iceberg" / "Cornerstone of..." / "Navigating uncharted waters"
- "Embark on a journey" / "A beacon of hope/light" / "A catalyst for change"
- "Blueprint for success" / "Symphony/mosaic/melting pot of..."

**Sentence structure issues to flag:**
- "not X but Y" / "not just X, but also Y" / "it's not about X, it's about Y" (correlative constructions)
- moreover, furthermore, additionally, consequently, thus, hence, therefore as paragraph starters
- notably, significantly, essentially, ultimately, indeed, subsequently
- "Studies show that..." / "Experts agree that..." / "Research indicates..." (no citation)

**Bad writing patterns to flag:**
- Three short punchy declarative sentences in a row with same structure
- "No X. No Y. Just Z." formula
- Excessive fragments strung together
- Dramatic reveal buildup to obvious conclusions
- Vague emotional/mental state claims ("The clarity I was afraid of losing...")

**Formatting symmetry to flag:**
- Every bullet starts with bold label + colon
- Uniform sentence length (15-25 words, minimal variation)
- Overuse of rule of threes in consecutive sentences

**Tonal markers to flag:**
- "It's important to note that..." / "Generally speaking..." / "It can be argued that..."
- "In most instances..." / "To some extent..." / "It depends on..."
- "Absolutely!" / "Certainly!" / "Great question!" / "That's a fantastic point!" (response openers)
- "Both sides present valid points..." / excessive "however" for balance

**Corporate buzzwords to flag:**
- synergy, paradigm shift, scalability, holistic approach, pivot, agile, best practices
- pain points, value proposition, stakeholders, deliverables, actionable insights, key takeaways
- move the needle, low-hanging fruit, circle back, touch base, end-to-end
- win-win, game changer, mission-critical, data-driven, future-proof, disruptive

**Conclusion patterns to flag:**
- "In conclusion..." / "In summary..." / "To summarize..."
- Long conclusions that repeat earlier content

### Context-Sensitive Exceptions

Not every match is an AI tell:
- "Leverage" is standard in finance/business
- Academic writing may use formal transitions intentionally
- Temporal "just": "I just arrived" (time) vs. "It's just amazing" (filler)
- Contradictory "actually": "Actually, that's wrong" (legit) vs. "It's actually quite good" (filler)

### Pass 1 Output Format

```
AI TELL CHECKLIST:
(In document order)

[ ] Line 1-2: "In today's digital landscape"
  -> Replace with specific claim or concrete fact

[ ] Line 5: "leverage cutting-edge solutions"
  -> "use modern solutions" or specify what they do

[ ] Line 9-10: "not just efficiency, but also innovation"
  -> State directly: "innovation and efficiency" or specify both

[ ] Line 12: "It's worth noting that"
  -> Delete entirely, start with actual point
```

---

## Pass 2: Hemingway Cut

Strip writing to the bone after AI tells are addressed. Hunt every word that doesn't earn its place.

### What Gets Cut

| Target | Why It Dies |
|--------|-------------|
| Adverbs | The verb should do the work. |
| Adjectives | Most weaken the noun. One precise noun beats a decorated one. |
| Qualifiers | "Very," "really," "quite," "somewhat" - all cowardice. |
| Redundancies | "Completely finished," "past history" - say it once. |
| Throat-clearing | "It's important to note that" - just say it. |
| Passive voice | Make subjects act. |
| Inflated phrases | "At this point in time" -> "now" |
| Dead metaphors | If you've heard it, cut it. |

### The Hemingway Test

For every word:
1. Does this word change the meaning?
2. If I cut it, would the reader miss it?
3. Is there a shorter way to say this?

If all three answers are no, the word dies.

### Pass 2 Output Format

```
## The Cut

**Original:** [X] words
**New:** [Y] words
**Killed:** [Z] ([percentage]%)

---

### The Trimmed Version

[Rewritten text with all cuts applied]

---

### What Died and Why

| Cut | Reason |
|-----|--------|
| "[phrase]" -> "[replacement]" | [Brief reason] |

---

### The Darlings

[Good phrases that still had to go - the ones that hurt to cut]
```

---

## Principles

- Shorter is almost always better
- Nouns and verbs, not adjectives and adverbs
- One idea per sentence
- No word is sacred - especially the ones you love
- Clarity over style
- Take a stance - don't both-sides every claim
- Name sources or delete the claim
- Start with fact, date, scene, or proper noun - not a frame

## The Iceberg

Only one-eighth above water. What you leave out strengthens what remains. Trust the reader to fill gaps.
