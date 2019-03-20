FROM puckel/docker-airflow:1.10.2

USER root

RUN python3 -m pip install apache-airflow[kubernetes]==1.10.2 --no-cache-dir && \
    python3 -m pip install prometheus_client --no-cache-dir && \
    python3 -m pip install fab_oidc==0.0.6 --no-cache-dir && \
    python3 -m pip install pyspark==2.4.0 --no-cache-dir && \
    python3 -m pip install -U setuptools --no-cache-dir && \
    python3 -m pip install cryptography --no-cache-dir && \
    python3 -m pip install psycopg2-binary==2.7.4 --no-cache-dir && \
    python3 -m pip install boto3 --no-cache-dir && \
    python3 -m pip install awscli --no-cache-dir

USER airflow
ENV AIRFLOW__CORE__LOGGING_LEVEL DEBUG

COPY tutorial.py /usr/local/airflow/dags/
COPY tutorial_using_variable.py /usr/local/airflow/dags/
