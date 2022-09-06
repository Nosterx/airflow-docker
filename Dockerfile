# Возьмем за основу образ
FROM python:3.10

# Airflow глобальные переменные
ARG MAJOR_PYTHON_VERSION=3.10
ARG AIRFLOW_VERSION=2.3.4
ARG CONSTRAINT_URL=https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${MAJOR_PYTHON_VERSION}.txt
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

# Сборка airflow
RUN pip install --upgrade pip
RUN pip install apache-airflow[postgres]==${AIRFLOW_VERSION} --constraint ${CONSTRAINT_URL}
RUN pip install pandas

# Создаем директрию для скриптов
RUN mkdir /project

# Копируем скрипты и конфиг файл
COPY scripts/ /project/scripts/
COPY configs/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

# Доступы для скрипта
RUN chmod +x /project/scripts/*

# Запускаем sh скрипт
ENTRYPOINT ["/project/scripts/init.sh"]
