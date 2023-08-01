# Домашнее задание к лекции «Docker»

Инструкцию по сдаче домашнего задания вы найдете на главной странице репозитория. 

## Задание 1

По аналогии с практикой из лекции создайте свой docker image с http сервером nginx. Замените страницу приветсвия Nginx на своё (измените текст приветствия на той же странице).

<details>
<summary>Подсказки:</summary>
В официальном образе nginx стандартный путь к статичным файлам `/usr/share/nginx/html`.  
</details>

На проверку присылается GitHub-репозиторий с Dockerfile и статичными файлами для него.

> Для пользовательского html можно использовать пример в [каталоге](html/) с ДЗ.

## Задание 2

Создайте контейнер для REST API сервера любого вашего проекта из курса по Django (например, [CRUD: Склады и запасы](https://github.com/netology-code/dj-homeworks/tree/drf/3.2-crud/stocks_products)).

> **ВАЖНО**: поменяйте БД с postgresql на sqlite3. Чтобы ваш контейнер мог работать без зависимости от postgres (с этим мы разберемся на следующем занятии).

Проверьте конфигурацию Django на использование переменных окружения (environment).

- Приложите в репозиторий Dockerfile и файлы приложения.
- В README.md описать типовые команды для запуска контейнера c backend-сервером.

> Для проверки работоспособности вашего контейнера отправляйте запросы с помощью `VS Code REST Client` или `Postman`.

# 1. Билд и запуск собственного image Nginx
Все комады запускаются с корневого каталога.

Для билда запустить команду:
```
docker build -t nginx:netology-hw ./docker-nginx/
```

Для запуска:
```
docker run --name netology-nginx-server -d -p 8080:80 nginx:netology-hw
```
Для проверки(в bash):
```
curl localhost:8080/
```
# 2. Билд и запуск Django-приложения
В каталоге 'docker-django-project' создать файл переменного окружения '.env', по примеру:
```
SECRET_KEY='you_secret_key'
ALLOWED_HOSTS=*
DB_ENGINE=django.db.backends.sqlite3
DB_NAME='you_db-name'
DEBUG=True
```
Команда для билда:
```
docker build -t hw-project ./docker-django-project/
```
Команда для запуска:
```
docker run --name netology-hw-server6.0 -d -p 8000:8000 hw-project

```
Для проверки можно отправить POST запрос в bash:
```
curl -d '{"name":"Test", "description":"Test"}' -H "Content-Type: application/json" -X POST 127.0.0.1:8000/api/sensors/
```
Для вывода записи:
```
curl 127.0.0.1:8000/api/sensors/
```
