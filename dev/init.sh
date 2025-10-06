#!/usr/bin/env bash
set -euo pipefail

. ./.env
cp $WGER_CODEPATH/extras/docker/production/settings.py $WGER_CODEPATH/
docker compose exec web wger bootstrap
# docker compose exec web -- python3 manage.py sync-exercises
# docker compose exec web -- wger load-online-fixtures
docker compose exec web python3 manage.py runserver 0.0.0.0:8000
