FROM puckel/docker-airflow:1.10.2

USER root

RUN python3 -m pip install apache-airflow[kubernetes]==1.10.2 --no-cache-dir && \
    python3 -m pip install cryptography --no-cache-dir && \
    python3 -m pip install psycopg2-binary==2.7.4 --no-cache-dir

COPY tutorial.py /usr/local/airflow/dags/
COPY tutorial_using_variable.py /usr/local/airflow/dags/
