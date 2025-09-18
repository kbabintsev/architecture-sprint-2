# pymongo-api

## 2. Как запустить mongo-sharding

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Проводим инициализацию и заполняем mongodb данными

```shell
./scripts/init.sh
```

Откройте в браузере http://localhost:3000

Для очистки во избежания конфликтов при запуске других заданий

```shell
docker compose down -v --rmi all
```