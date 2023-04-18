#!/bin/bash
#
echo "Применение миграции базы данных"
python manage.py migrate

# Start server
echo "Запуск сервера"
python manage.py runserver 0.0.0.0:8000