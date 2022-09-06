#!/bin/bash

/project/scripts/create_db.sh

/project/scripts/create_admin.sh

# Запуск шедулера и вебсервера
airflow scheduler & airflow webserver
