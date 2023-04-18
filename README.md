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
