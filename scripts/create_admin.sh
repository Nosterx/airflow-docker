#!/bin/bash
# Создание пользователя
airflow users create \
          --username admin \
          --firstname admin \
          --lastname admin \
          --role Admin \
          --email $ADMIN_EMAIL \
          -p admin

