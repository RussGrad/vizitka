#!/usr/bin/env bash
# Публикация визитки: RussGrad/vizitka → GitHub Pages
set -euo pipefail
cd "$(dirname "$0")/.."

REMOTE="${REMOTE:-git@github.com:RussGrad/vizitka.git}"
BRANCH="${BRANCH:-main}"

if ! git rev-parse --git-dir &>/dev/null; then
  echo "Ошибка: не git-репозиторий. Запустите из папки vizitka."
  exit 1
fi

if ! git remote get-url origin &>/dev/null; then
  git remote add origin "$REMOTE"
  echo "→ Добавлен remote: $REMOTE"
fi

if ! git rev-parse HEAD &>/dev/null 2>&1 || [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "${1:-Обновление визитки}" || true
fi

echo "→ Push в $REMOTE ($BRANCH)…"
if git push -u origin "$BRANCH" 2>&1; then
  echo ""
  echo "Готово. Через 1–2 мин:"
  echo "  https://vizitka.ru/"
  echo "  https://russgrad.github.io/vizitka/"
  echo ""
  echo "Домен: docs/dns-cname.md"
  echo "Pages: github.com/RussGrad/vizitka/settings/pages"
  echo "  Source: Deploy from branch → main → /(root)"
else
  echo ""
  echo "Push не удался. Создайте пустой репозиторий:"
  echo "  https://github.com/new?name=vizitka"
  echo "Затем снова: ./deploy/publish.sh"
  exit 1
fi
