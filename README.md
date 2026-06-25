# Feynman Skill

一个中文优先的费曼解释 skill。目标很简单：用户把看不懂的概念、论文段落、教材句子或技术黑话丢进来，不需要选菜单，就能拿到讲透的中文解释、生活类比和黑话翻译。

它不是 App 后端，也不依赖 API。它是一套纯 prompt 驱动的 agent skill，可以放进支持本地 skills 的 AI 编程助手里使用。

## Why This Exists

很多“解释概念”的工具会把用户推到表单里：选受众、选风格、选深度。真实学习时通常不是这样。真实场景是卡住了，想马上听懂。

这个 skill 的产品原则是：

- 零选择起步：默认直接解释，不先问配置。
- 自然语言换挡：想“讲给5岁听”“用做菜比喻”“再深一点我是同行”，直接说人话。
- 闭环学习：从即时解惑滑向知识树、深度追问和自测。
- 中文为主：输出默认是简体中文，即使输入是英文论文或技术文档。

## Install

把 `feynman/` 目录复制到你的 agent skills 目录。

Codex 示例：

```powershell
Copy-Item -Recurse .\feynman "$env:USERPROFILE\.codex\skills\feynman"
```

Claude Code 风格目录示例：

```powershell
Copy-Item -Recurse .\feynman "$env:USERPROFILE\.claude\skills\feynman"
```

如果你的工具使用其他 skills 路径，复制 `feynman/` 这个目录即可。

## Usage

直接贴看不懂的内容：

```text
这段在讲啥：In transformer attention, queries and keys are projected into a shared latent space so the model can compute pairwise relevance before aggregating values.
```

指定受众：

```text
用费曼方法讲讲零知识证明，讲给10岁孩子听。
```

指定风格：

```text
用做菜的比喻解释一下反向传播。
```

生成知识树：

```text
给我画一下“强化学习”的知识树，顺便标出先修概念。
```

做自测：

```text
我来解释一下量子纠缠，你用三人格帮我挑刺。
```

## Project Structure

```text
feynman-skill/
├── feynman/
│   ├── SKILL.md
│   └── references/
│       ├── audiences.md
│       ├── concept-tree.md
│       ├── personas.md
│       └── styles.md
├── tests/
│   ├── manual-pressure-scenarios.md
│   ├── trigger-matrix.md
│   └── run-static-checks.ps1
├── docs/
│   └── specs/
├── CHANGELOG.md
├── LICENSE
├── README.md
└── RELEASE_NOTES.md
```

## Test

运行静态项目检查：

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\run-static-checks.ps1
```

手动体验测试见 `tests/manual-pressure-scenarios.md`。每次改 `SKILL.md` 或 `references/` 后，至少跑一遍静态检查，再抽测默认解释、自然语言换挡、知识树和自测场景。

自动触发边界见 `tests/trigger-matrix.md`。先用它判断“该不该唤醒 skill”，再用压力场景判断“唤醒后答得好不好”。

## Product Boundary

这个仓库只做纯文本 skill：

- 不做 TTS 朗读。
- 不调用后端服务。
- 不要求用户记命令格式。
- 不复制 App 的下拉菜单体验。

TTS、UI、历史记录和可视化交互留给 App 产品线。
