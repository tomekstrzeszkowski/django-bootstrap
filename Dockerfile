FROM python:3.10

RUN adduser --disabled-password --gecos '' user
COPY ./requirements*.txt /home/user/
RUN apt-get update && apt-get install -y postgresql openssl gcc libpq-dev
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /home/user/requirements-development.txt

EXPOSE 8000
USER user
WORKDIR /home/user/app
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=True
CMD python ./manage.py migrate \
    && python ./manage.py runserver --insecure 0.0.0.0:8000
