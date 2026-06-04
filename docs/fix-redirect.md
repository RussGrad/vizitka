# Редирект на vizit_sodeystvie.ru — как исправить

Старый домен **vizit_sodeystvie.ru** (с подчёркиванием) в GitHub Pages вызывает редирект с `github.io/vizitka` на нерабочий адрес.

## 1. GitHub → Settings → Pages (главное)

1. https://github.com/RussGrad/vizitka/settings/pages
2. Поле **Custom domain** — удалите `vizit_sodeystvie.ru` полностью (крестик / Clear).
3. Введите **`vizitka.ru`** → **Save**.
4. Дождитесь зелёной галочки DNS (для `vizitka.ru` нужны A-записи, см. `dns-cname.md`).
5. Включите **Enforce HTTPS**.

Пока DNS для `vizitka.ru` не готов — **оставьте Custom domain пустым**, тогда работает только:

**https://russgrad.github.io/vizitka/**

## 2. В репозитории должен быть CNAME

Файл `CNAME` в корне с одной строкой:

```
vizitka.ru
```

Не `vizit_sodeystvie.ru`.

## 3. DNS

- **vizitka.ru** — 4× A на IP GitHub (см. `dns-cname.md`).
- **vizit_sodeystvie.ru** — удалите записи, если добавляли; домен не используем.

## 4. Проверка

```bash
curl -sI https://russgrad.github.io/vizitka/ | grep -i location
```

Строки `location: ...vizit_sodeystvie` быть не должно.

Очистите кэш браузера или откройте в режиме инкогнито.
