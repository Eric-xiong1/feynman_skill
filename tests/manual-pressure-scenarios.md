# Manual Pressure Scenarios

Use these scenarios after editing `feynman/SKILL.md` or any reference file. The goal is to verify the product experience, not just file validity.

For automatic trigger boundaries, run the smaller matrix in `tests/trigger-matrix.md` first. This file checks the deeper product behavior after the skill has triggered.

## Scenario 1: Zero-Choice Paper Rescue

User prompt:

```text
这段在讲啥：In transformer attention, queries and keys are projected into a shared latent space so the model can compute pairwise relevance before aggregating values.
```

Expected behavior:

- Answer in Simplified Chinese.
- Do not ask the user to choose audience, style or depth.
- Include plain-language explanation, life analogy, jargon translation and one follow-up question.
- Explain query, key, value and relevance without drowning the user in linear algebra.

Failure signs:

- Starts with a menu.
- Gives only a dictionary definition.
- Leaves "latent space" or "pairwise relevance" untranslated.

## Scenario 2: Audience Switch

User prompt:

```text
讲给5岁听：什么是零知识证明？
```

Expected behavior:

- Use very short sentences and concrete objects.
- Avoid cryptography jargon unless instantly translated.
- Preserve the core idea: prove that something is true without revealing the secret.

Failure signs:

- Says "交互式证明系统" without translation.
- Becomes childish but loses the proof-vs-secret distinction.

## Scenario 3: Style Switch

User prompt:

```text
用做菜的比喻解释反向传播。
```

Expected behavior:

- Use recipe structure: ingredients, steps, heat control, failed dish.
- Map outputs, error, parameter update and iteration to concrete cooking actions.
- Mention the analogy boundary.

Failure signs:

- Only says "像调味" and stops.
- No local correspondence map.

## Scenario 4: Knowledge Tree

User prompt:

```text
给我画一下强化学习的知识树，标出先修概念和常见误解。
```

Expected behavior:

- Load concept-tree behavior.
- Produce a compact 5-8 node tree.
- Include problem background, prerequisites, mechanism, misconception, application and boundary.
- Offer 2-3 deeper follow-up questions.

Failure signs:

- Generates a huge encyclopedia outline.
- Lists keywords without parent-child relationships.

## Scenario 5: Self-Test

User prompt:

```text
我来讲一下量子纠缠，你用三人格帮我挑刺：它就是两个粒子隔很远还能互相发消息。
```

Expected behavior:

- Do not continue lecturing as the default tutor.
- Evaluate the user's explanation.
- Catch the false "发消息" interpretation.
- Give feedback from curious child, critical peer and rigorous professor.
- End with a targeted follow-up challenge.

Failure signs:

- Praises the explanation as correct.
- Ignores the misconception about faster-than-light messaging.

## Scenario 6: Expert Mode

User prompt:

```text
再深一点，我是同行。用费曼方式解释一下扩散模型里的 score matching。
```

Expected behavior:

- Keep necessary technical terms but translate each term into intuition.
- Include boundary conditions and common confusions.
- Avoid treating the user as a child.

Failure signs:

- Removes all technical content.
- Gives a graduate textbook definition with no intuition.
