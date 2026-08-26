# 淬炼 temper · 自迭代仓库

> 用 temper 的方法论，迭代 temper 自己。当前处于**第一代**：只建结构、不动 SKILL.md。

## 当前状态

> 视图（非权威）。权威在 `循环/当前状态.md` + `.temper/state.json`。

- 阶段：**Formation**（局部 Eval Building）｜ 强度：**标准** ｜ Epoch：无
- 比较状态：`baseline_pending`（愿景基线对照已草拟，待人工验收）
- 当前工作版本：`方法/当前方法.md`（指针 → 安装位置 `~/.agents/skills/temper`）
- 最近运行：`运行记录/0001-初始化建基线`
- **需要你**（3 项，见 [循环/当前状态.md](循环/当前状态.md)）：
  1. 验收愿景基线对照 8 维与优先级；
  2. 裁决 SKILL.md 方法改动是否契约级变化；
  3. 确认注册表 0.0.2 / 本地 0.0.1 漂移处理。

## 快速导航

| 职责 | 文件 |
| --- | --- |
| 当前定义 | [项目定义/当前定义.md](项目定义/当前定义.md) |
| 当前状态 · 循环总览 | [循环/当前状态.md](循环/当前状态.md) · [循环/循环总览.md](循环/循环总览.md) |
| 当前方法（指针） | [方法/当前方法.md](方法/当前方法.md) |
| 评测说明 · 愿景基线对照 | [评测/评测说明.md](评测/评测说明.md) · [评测/愿景基线对照.md](评测/愿景基线对照.md) |
| 运行记录 | [运行记录/](运行记录/) |
| 机器状态 | [.temper/state.json](.temper/state.json) |

## 愿景与基线尺子

- `temper_docs/`（01~06 设计文档 + README）—— 设计愿景权威语料
- `temper-淬炼-开始使用.html` —— UX 主路径证据
- 已知待清理：`temper-淬炼-设计思想与完整机制.html` 在废纸篓，开始使用 HTML 的链接为断链

## 同步 / 发布链路（约定，本轮不执行）

```
改方法（未来某代）
  → 组装发布快照目录（发布包/ 或 skill/，含 SKILL.md）
  → cskills publish <含SKILL.md的目录>
  → 远端 registry（https://skills.gz.cvte.cn）
  → cskills sync / cskills add temper → 拉回 ~/.agents/skills/temper
  → symlink ~/.claude/skills/temper 自动生效
  → 校验 .cskills-meta.json fileHashes → 更新 state.json versions → 写运行记录
```

发布是**外发动作**，必须经用户确认后执行。详见 [方法/当前方法.md](方法/当前方法.md)。

## 本仓库规则

- 每代留痕：`运行记录/<run-id>/`（manifest + 决策/差异/评测）。
- 版本指针三态（工作/业务校准/生产）不混用；不把"工作采用"写成"业务已验证"。
- 只读进入，先看现状再决定改什么。
- 不建空目录/占位文档；复用优先，新增文件必须可从 README 发现。
- 愿景基线对照是便宜证据，真实使用反馈才是最终验证。
