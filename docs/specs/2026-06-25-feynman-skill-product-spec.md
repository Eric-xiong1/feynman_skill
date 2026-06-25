# Feynman Skill Product Spec

## Goal

Create a clean, standalone `feynman` agent skill that turns confusing academic, technical and conceptual material into clear Simplified Chinese explanations using the Feynman technique.

## Product Positioning

The skill is the GitHub-facing product. The existing app is source material, not the thing to publish. The public project should feel installable, readable and easy to spread.

Core promise:

```text
把论文、教材和技术黑话翻译成人话。
```

## User Experience Principles

- Start from zero choices. If the user pastes a confusing passage, explain it immediately.
- Auto-trigger only when the user provides material or a concept and signals confusion, simplification, Feynman-style learning, structure mapping or self-test intent.
- Treat natural language as the interface. Users can say “讲给5岁听”, “用做菜比喻”, “再深一点我是同行”, “画知识树” or “测测我懂没懂”.
- Make the default answer useful enough without extra prompts: plain explanation, analogy and jargon translation.
- End with a lightweight invitation to shift mode.
- Keep TTS, UI, backend, history and visual maps out of this skill.

## Scope

Build:

- `feynman/SKILL.md`
- Four references: styles, audiences, personas and concept-tree
- Product README
- Changelog and release notes
- Static checks
- Manual pressure scenarios
- Automatic trigger matrix

Do not build:

- API server
- TTS
- frontend app
- package registry automation

## Skill Architecture

`SKILL.md` stays small and acts as a router:

- Trigger conditions
- Default output contract
- Reference loading rules
- Quality bar and mistakes to avoid

References hold reusable detail:

- `styles.md`: analogy, story, dialogue and recipe styles
- `audiences.md`: 5-year-old, 10-year-old, lay adult, elder and expert calibration
- `personas.md`: self-test evaluation personas
- `concept-tree.md`: knowledge tree and deep follow-up rules

## Success Criteria

- A user can paste a confusing paragraph and get a useful answer without choosing settings.
- A user can change audience or style with one sentence.
- A user can move into knowledge tree or self-test mode without installing another skill.
- The project can be published as a standalone GitHub repository.
- Static checks pass and manual scenarios describe expected behavior clearly.
