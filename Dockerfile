FROM python:rc-alpine3.10
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

RUN pip install Flask-WTF

COPY . /app

ENTRYPOINT flask run --host 0.0.0.0

