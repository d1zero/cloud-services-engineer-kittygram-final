#!/bin/bash

# Прекращение выполнения при ошибках
set -e

# Применение миграций
echo "Applying database migrations..."
python manage.py migrate

# Сборка статики (опционально)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Запуск основного процесса
echo "Starting Gunicorn server..."
exec "$@"