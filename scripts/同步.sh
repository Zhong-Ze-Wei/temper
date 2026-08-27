#!/usr/bin/env bash
# temper 同步脚本 —— 用法：./scripts/同步.sh [agents] [claude] [github] [cskills]
# 规矩：github/cskills 是外发动作，执行前必须已获用户点头（见 发布与同步.md）
set -euo pipefail
cd "$(dirname "$0")/.."

VERSION="$(grep -m1 '^version:' SKILL.md | awk '{print $2}')"
COMMIT="$(git rev-parse --short HEAD)"
if [ -n "$(git status --porcelain)" ]; then
  echo "工作区不干净，先提交再同步（纪律：同步必须对应明确的 commit）"
  exit 1
fi
if [ "$#" -eq 0 ]; then
  echo "用法：$0 [agents] [claude] [github] [cskills]；详见 发布与同步.md"
  exit 0
fi

copy_skill() {  # $1 = 目标目录
  mkdir -p "$1/agents"
  cp SKILL.md "$1/SKILL.md"
  cp agents/openai.yaml "$1/agents/openai.yaml"
  rm -rf "$1/references"
}

SYNCED=()
for target in "$@"; do
  case "$target" in
    agents)  copy_skill "$HOME/.agents/skills/temper"; SYNCED+=(agents) ;;
    claude)  copy_skill "$HOME/.claude/skills/temper"; SYNCED+=(claude) ;;
    github)
      git push origin main
      git push origin --tags
      SYNCED+=(github) ;;
    cskills)
      # 注册表只要最小 skill 包（SKILL.md + agents/），不带仓库其余文件；publish 有交互确认，用 yes 管道
      STAGE="$(mktemp -d)"
      mkdir -p "$STAGE/agents"
      cp SKILL.md "$STAGE/SKILL.md"
      cp agents/openai.yaml "$STAGE/agents/openai.yaml"
      yes | cskills publish "$STAGE"
      rm -rf "$STAGE"
      cskills sync
      SYNCED+=(cskills) ;;
    *) echo "未知目标：$target（可选 agents/claude/github/cskills）"; exit 1 ;;
  esac
done

IFS='、'
echo "| $(date +%F) | v${VERSION} | ${COMMIT} | ${SYNCED[*]} |" >> 发布与同步.md
unset IFS
echo "已同步：${SYNCED[*]}（v${VERSION} @ ${COMMIT}）。记录已追加到 发布与同步.md——记得提交这一行。"
