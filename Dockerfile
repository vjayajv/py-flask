FROM ubuntu:16.04


RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

RUN pip install Flask-WTF

COPY . /app

ENTRYPOINT flask run --host 0.0.0.0

