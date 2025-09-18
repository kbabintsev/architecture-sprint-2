# pymongo-api

## 3. Как запустить mongo-sharding-repl

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Проводим инициализацию и заполняем mongodb данными

```shell
./scripts/init.sh
```

Откройте в браузере http://localhost:3001

Для очистки во избежания конфликтов при запуске других заданий

```shell
docker compose down -v --rmi all
```