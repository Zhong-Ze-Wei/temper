# temper 版本记录

> 本目录（`skill/temper/`）是 temper skill 在项目里的**权威可编辑副本**，也是将来 `cskills publish` 的发布源目录。安装位置 `~/.agents/skills/temper` 是它的**部署副本**。

## 版本号规范

- `SKILL.md` frontmatter 的 `version` 是唯一版本号（当前发布口径）。
- 本仓库内同时存在三处版本线索：SKILL.md frontmatter（真版本）、`.temper/state.json`（机器状态）、`运行记录/`（各代记录）。以 **SKILL.md frontmatter** 为准。
- 版本变更规则：用户面行为变化 → 次版本（0.1.x）；机制/文案微调 → 补丁（0.0.x）。契约级变化（改"什么叫做好"）时升主版本或至少升次版本并开新 Epoch。

## 版本时间线

| 版本 | 内容 | 状态 |
| --- | --- | --- |
| 0.0.1 | 初版：方法论手册形态（概念导向） | 安装位置当前版本（与注册表 0.0.2 漂移，待对齐） |
| 0.1.0（候选） | 用户体验层重构：用户面四件事 + 交互契约 | 见 `方法/候选方法/`，待采纳 |

## 与安装位置的关系

- 编辑规则：在 `skill/temper/` 改 → 采纳/发布后同步到 `~/.agents/skills/temper`。
- 不要直接改安装位置（它是部署副本，会被 `cskills sync` 覆盖）。
- 将来发布：`cskills publish skill/temper`（本目录含 SKILL.md，满足 publish 要求）。
