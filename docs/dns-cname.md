# Домен vizitka.ru → GitHub Pages

В репозитории файл **`CNAME`** с содержимым `vizitka.ru`.

Публичный адрес визитки: **https://vizitka.ru/**  
Запасной: https://russgrad.github.io/vizitka/

---

## 1. DNS у регистратора (зона vizitka.ru)

### Корень домена `vizitka.ru` (обязательно)

Четыре записи **A** для хоста `@` (или «корень»):

| Тип | Имя | Значение |
|-----|-----|----------|
| A | @ | `185.199.108.153` |
| A | @ | `185.199.109.153` |
| A | @ | `185.199.110.153` |
| A | @ | `185.199.111.153` |

Это IP-адреса GitHub Pages (актуальный список: [документация GitHub](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)).

### www (по желанию)

| Тип | Имя | Значение |
|-----|-----|----------|
| CNAME | www | `russgrad.github.io` |

В GitHub Pages можно добавить `www.vizitka.ru` и включить редирект на `vizitka.ru`.

---

## 2. REG.RU (пример)

1. Домены → **vizitka.ru** → **Управление зоной DNS**
2. Добавить 4× **A** для `@` (см. таблицу выше)
3. Добавить **CNAME**: `www` → `russgrad.github.io`
4. TTL: по умолчанию (3600)

---

## 3. GitHub

1. [github.com/RussGrad/vizitka/settings/pages](https://github.com/RussGrad/vizitka/settings/pages)
2. **Custom domain:** `vizitka.ru` → **Save**
3. Дождаться **DNS check successful**
4. Включить **Enforce HTTPS**

После `git push` с файлом `CNAME` домен подхватится автоматически.

---

## 4. Проверка

```bash
dig vizitka.ru A +short
dig vizitka.ru AAAA +short
curl -sI https://vizitka.ru/ | head -5
```

Распространение DNS: от 15 минут до 24–48 часов.

---

## 5. Деплой

```bash
cd /Users/an_sodeystvie/BITRIX/projects/vizitka
git add CNAME docs/dns-cname.md README.md
git commit -m "Домен vizitka.ru для GitHub Pages"
git push
```
