# DNS для визитки (опционально, позже)

Сейчас визитка доступна по адресу: **https://russgrad.github.io/vizitka/**

Ниже — настройка своего домена, когда понадобится (например `vizit.sodeystvie.ru`).

## 1. Запись в DNS (REG.RU или другой регистратор)

Зона домена: **sodeystvie.ru** (если поддомен вида `что-то.sodeystvie.ru`).

| Поле | Значение |
|------|----------|
| Тип | **CNAME** |
| Имя / поддомен | `vizit_sodeystvie` |
| Значение / куда | `russgrad.github.io` |
| TTL | 3600 (или «по умолчанию») |

**Не** указывайте IP вручную — только CNAME на `russgrad.github.io`.

### REG.RU (пример)

1. [reg.ru](https://www.reg.ru) → **Домены** → **sodeystvie.ru**
2. **Управление зоной DNS** / **Ресурсные записи**
3. **Добавить запись** → тип **CNAME**
4. Subdomain: `vizit_sodeystvie` → Canonical: `russgrad.github.io.`
5. Сохранить

### Если панель просит «полное имя»

- Хост: `vizit_sodeystvie.sodeystvie.ru`
- Указывает на: `russgrad.github.io`

## 2. GitHub (уже частично сделано)

1. [github.com/RussGrad/vizitka/settings/pages](https://github.com/RussGrad/vizitka/settings/pages)
2. **Custom domain:** `vizit_sodeystvie.ru` → **Save**
3. Дождаться проверки DNS (зелёная галочка)
4. Включить **Enforce HTTPS** (станет доступно после выпуска сертификата)

## 3. Проверка (через 5–60 мин, иногда до 24 ч)

```bash
dig vizit_sodeystvie.ru CNAME +short
# ожидается: russgrad.github.io.

curl -sI https://vizit_sodeystvie.ru/ | head -3
```

В браузере: https://vizit_sodeystvie.ru/

## Запасной адрес

Пока DNS не обновился: https://russgrad.github.io/vizitka/

## Важно про имя с подчёркиванием

В DNS подчёркивание в имени хоста **допустимо**, но некоторые браузеры и сертификаты ведут себя капризно. Если домен не откроется или нет HTTPS — заведите поддомен **vizit.sodeystvie.ru** (с точкой), обновите `CNAME` в репозитории и запись CNAME в DNS на `vizit` → `russgrad.github.io`.
