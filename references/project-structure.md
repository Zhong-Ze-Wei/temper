# 最小项目结构

首次建结构或调整结构前读。目标：用户看得懂当前任务、支持可靠迭代——不是让所有项目长得一样。先识别逻辑职责，映射到已有路径；职责缺失且当前阶段确实需要，才创建。

## 先看一个真实示例

场景：用户项目已有 README、docs/、prompts/、runs/——不搬目录，只补缺口。

```
逻辑职责 → 已有路径映射：
  定义 → README「任务目标」一节（已有，更新一段）
  状态 → docs/STATUS.md      （新增 —— 缺失）
  方法 → prompts/v3.md       （已有）
  评测 → evals/cases.jsonl   （已有）
  运行 → runs/               （已有）
  学习 → docs/lessons.md     （新增 —— 缺失）
  归档 → docs/archive/       （已有）

结论：复用 5 处，新增 2 个文件，移动 0 个文件。
先把这个清单给用户批准，再动手。
```

要点：职责找映射，不造新目录；新建是最手段不是首选；动手前有批准。

## 七种逻辑职责

| 职责 | 承载内容 |
|---|---|
| 定义 | 当前目的、边界、成功标准、未知项 |
| 状态 | 阶段、强度、策略、Epoch、版本指针、当前节点、下一步 |
| 方法 | 当前方法、候选修改、并行或分流方法 |
| 评测 | 评测口径、样本、Gold、回归及结果 |
| 运行 | 每代的输入、配置、产物、Diff、决策 |
| 学习 | 待验证假设与已验证经验 |
| 归档 | 不再代表当前规则的历史内容（必须明确标注） |

目录名和语言可以不同；已有 README、CURRENT、docs、evals、runs、experiments、changelog 能承担职责就直接复用。

## 创建规则

顺序：**复用现有 → 补充现有 → 必要时拆分 → 最后才新建**。

- 不建空目录或占位文档；第一次实际需要内容时才创建；
- 一个逻辑职责只保留一个当前权威来源；README 和索引是视图，不是重复事实源；
- 替换式 Candidate 与当前工作版本分开，决策前不原地覆盖；增量 / 并行 / 分流按真实关系组织，不强造 Candidate/Baseline 对；
- 运行产物和决策记录不可变；更正时追加说明或生成新一代；
- 新文件必须能从 README、状态页或上级索引发现，不造孤儿文档；
- 只有生命周期、权限、读者或版本需求不同时才拆独立文件。

## 默认最小形态（仅当项目没有等价结构时用这些名字）

### 模糊任务 / 轻量 Discovery

```
README.md                # 复用已有首页；必要时加当前状态块
项目定义/当前理解.md      # 目的、假设、未知项、下一次学习问题
循环/当前状态.md
.temper/state.json
```

没有真实运行前不建 `运行记录/`；目标仍在探索时 `epoch` 可空、状态标 `exploratory`。

### 标准迭代

```
README.md
项目定义/当前定义.md
循环/{当前状态.md, 循环总览.md}
方法/{当前方法/, 候选方法/}     # 候选仅替换式迭代需要
评测/{评测说明.md, 回归案例/}   # 有真实回归 Case 才建
运行记录/
.temper/state.json
```

### 严格

从标准形态按已识别风险增加：关键基准、人工裁决、风险与回滚说明、更完整的运行 Manifest。不一次建齐 Anchor、Holdout、Hooks、Runtime、Graph。

## .temper/state.json（轻量机器状态 + 路径映射）

不保存重复的完整业务定义；按阶段只保留有意义字段，业务内容以用户可见文件为准。

```json
{
  "schema_version": 1,
  "stage": "discovery",
  "intensity": "light",
  "strategy": {
    "change_relation": "exploration",
    "feedback_cadence": "per_generation_observation",
    "human_mode": "review_each_round"
  },
  "comparison_status": "exploratory",
  "epoch": null,
  "versions": {
    "working": null,
    "last_business_validated": null,
    "production": null,
    "active_experiments": []
  },
  "current_step": "frame-first-v0",
  "paths": {
    "definition": "项目定义/当前理解.md",
    "status": "循环/当前状态.md",
    "runs": "运行记录"
  },
  "last_run": null,
  "next_action": "生成第一个可观察产物",
  "human_attention": []
}
```

## 状态页要让用户一眼看到

当前阶段和为什么；强度；Discovery 的当前学习问题或 Epoch 的冻结内容；适用的版本指针（不要求三个都存在或相同）；本代版本关系；最近一代、证据等级及实际支持的结论；下一次人工或 Gold 检查点及触发条件；待人工处理的争议；下一步。

更新已有 README 或状态页；README 另有用途时只更新明确标记的状态区，不覆盖用户正文，不另建首页。

## 循环总览图

只有循环多于几个显而易见的动作时才建。图反映当前真实节点：Discovery 不画 Promotion；没有 Eval 不画假回归；人工节点按实际位置在主流程或异常分支。图下写当前节点，以及每个非基础控制所解决的 failure mode。
