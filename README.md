# py-flask
Using python and flask to run a shell script from a web app ui

A simple web-app to call a local shell-script and print the output.

## change path in hello.py

app = Flask(__ name __ ,template_folder= __'/PATH/TO/__ py-flask/templates')

## Command to run app

export FLASK_APP=hello.py
flask run

## Run in background (daemon)

sudo apt install gunicorn

gunicorn -b 127.0.0.1:5000 hello:app -D
