FROM python:3.7-slim-buster

WORKDIR /app

RUN pip install flask && pip install wtforms

COPY . /app

ENTRYPOINT export FLASK_APP=hello.py && flask run --host 0.0.0.0
