#!/usr/bin/env bash
# Публикация визитки: RussGrad/vizitka → GitHub Pages
set -euo pipefail
cd "$(dirname "$0")/.."

REMOTE="${REMOTE:-git@github.com:RussGrad/vizitka.git}"
BRANCH="${BRANCH:-main}"
MSG="${1:-Обновление визитки}"

if ! git rev-parse --git-dir &>/dev/null; then
  echo "Ошибка: не git-репозиторий. Запустите из папки vizitka."
  exit 1
fi

if ! git remote get-url origin &>/dev/null; then
  git remote add origin "$REMOTE"
  echo "→ Добавлен remote: $REMOTE"
fi

git fetch origin "$BRANCH" 2>/dev/null || true

if git rev-parse "origin/$BRANCH" &>/dev/null; then
  LOCAL=$(git rev-parse HEAD 2>/dev/null || echo "")
  REMOTE=$(git rev-parse "origin/$BRANCH")
  if [ "$LOCAL" != "$REMOTE" ]; then
    echo "→ Подтягиваем изменения с GitHub (rebase)…"
    git pull --rebase origin "$BRANCH"
  fi
fi

if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "$MSG"
fi

echo "→ Push в $REMOTE ($BRANCH)…"
if git push -u origin "$BRANCH"; then
  echo ""
  echo "Готово. Через 1–2 мин:"
  echo "  https://russgrad.github.io/vizitka/"
  echo "  https://vizitka.ru/  (если DNS и Custom domain настроены)"
  echo ""
  echo "Pages: github.com/RussGrad/vizitka/settings/pages"
else
  echo ""
  echo "Push не удался. Проверьте:"
  echo "  git pull --rebase origin main && git push"
  echo "  Репозиторий: https://github.com/RussGrad/vizitka"
  exit 1
fi
