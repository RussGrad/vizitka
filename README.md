# Визитка · Руссков Игорь Валерьевич

Цифровая визитка риэлтора — один `index.html`, без сборки.

**Основная ссылка:** https://vizitka.ru/  
**Запасная:** https://russgrad.github.io/vizitka/

## Возможности

- Контакты, услуги, прайс, отзывы из объекта `data`
- Светлая / тёмная тема
- Скачать контакт (.vcf) и QR-код

## Локально

```bash
cd vizitka
npm run dev
```

http://localhost:5173

## Первый push на GitHub

1. Создайте **пустой** репозиторий: [github.com/new?name=vizitka](https://github.com/new?name=vizitka) (без README).
2. В терминале:

```bash
cd /Users/an_sodeystvie/BITRIX/projects/vizitka
./deploy/publish.sh
```

3. **Settings → Pages** → ветка **main**, папка **/(root)** → Save.

## Обновления

```bash
git add -A
git commit -m "описание"
git push
```

## Файлы

| Файл | Назначение |
|------|------------|
| `index.html` | Сайт и данные `data` |
| `avatar.png` | Фото |

DNS для **vizitka.ru**: `docs/dns-cname.md`
