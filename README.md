# pymongo-api

## Диаграмма

Файл диаграммы в корне репозитория
[pymongo-api.drawio](pymongo-api.drawio)

А так же доступна по ссылке
https://drive.google.com/file/d/1pNEu0kVNDLyBoOEObJWwWRvnZx6X0fOC/view?usp=sharing

## Как запустить sharding-repl-cache

Переходим в директорию приложения
```shell
cd sharding-repl-cache
```

Запускаем mongodb, redis и приложение

```shell
docker compose up -d
```

Проводим инициализацию и заполняем mongodb данными

```shell
./scripts/init.sh
```

Откройте в браузере http://localhost:3002

Для очистки во избежания конфликтов при запуске других заданий

```shell
docker compose down -v --rmi all
```