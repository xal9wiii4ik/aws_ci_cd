#!/bin/sh

python manage.py migrate
python manage.py collectstatic --noinput
echo "from django.contrib.auth.models import User; User.objects.create_superuser('xal9','xal9w@mail.ru','123')" | python manage.py shell
python manage.py runserver 0.0.0.0:8000

exec "$@"
