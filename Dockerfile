FROM python:3.10 AS builder

RUN adduser --disabled-password --gecos '' user
COPY ./requirements*.txt /home/user/
RUN apt-get update && apt-get install -y postgresql openssl gcc libpq-dev
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /home/user/requirements-development.txt

FROM python:3.10 
RUN adduser --disabled-password --gecos '' user
COPY --from=builder /home/user ./
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
USER user
WORKDIR /home/user/app
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=True
EXPOSE 8000
CMD python ./manage.py runserver --insecure 0.0.0.0:8000
