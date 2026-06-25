# Automatic Trigger Matrix

Use this matrix to review whether `feynman` should be automatically loaded. The rule is:

```text
Trigger only when the user provides material or a concept AND signals confusion, simplification, Feynman-style learning, structure mapping, or self-test intent.
```

## Should Trigger

| Prompt | Why |
| --- | --- |
| `这段在讲啥：In transformer attention...` | Has material plus confusion cue |
| `看不懂这句话，帮我说人话：梯度下降通过...` | Has material plus confusion and plain-language cues |
| `为啥零知识证明能证明我知道密码，但又不泄露密码？` | Conceptual why-question about a hard idea |
| `这个公式好难，通俗讲一下 KL divergence` | Has concept plus difficulty and simplification cues |
| `用费曼方法讲讲反向传播` | Explicit Feynman cue |
| `给我画一下强化学习的知识树` | Explicit knowledge tree cue |
| `我来讲量子纠缠，你用三人格帮我挑刺` | Explicit self-test cue |
| `还是不明白 transformer 的 QKV，打个比方` | Concept plus repeated-confusion and analogy cues |

## Should Not Trigger Automatically

| Prompt | Why |
| --- | --- |
| `解释一下这个 TypeScript 报错` | Debugging/code task, no plain-language learning cue |
| `解释这段代码为什么崩了` | Debugging task, not concept-learning by default |
| `总结这篇文章` | Summary task, no confusion or simplification cue |
| `把这段英文翻译成中文` | Translation task, no Feynman cue |
| `解释一下这个 API 怎么调用` | Tool usage task, no confusion/plain-language cue |
| `为什么今天股市下跌？` | Current factual/financial question, needs sources not Feynman simplification by default |
| `帮我润色这段介绍` | Writing task, no concept-learning cue |

## Borderline Cases

| Prompt | Recommended behavior |
| --- | --- |
| `解释一下 transformer` | Do not rely on auto-trigger; ordinary explanation is enough unless the user asks for simple/plain-language/Feynman help |
| `解释一下 transformer，简单点` | Trigger because `简单点` is a simplification cue |
| `这段代码我看不懂，帮我说人话` | Trigger only for conceptual walkthrough; do not replace debugging if the user asks to fix the code |
| `这个报错我看不懂，讲人话` | Explain the error in plain language, but keep debugging workflow if the user wants a fix |
