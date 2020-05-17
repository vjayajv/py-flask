from flask import flash
import re
import subprocess
from flask import Flask, render_template, request, redirect, url_for
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField

# App config.
DEBUG = True
app = Flask(__name__,template_folder='/app/py-flask/templates')
app.config.from_object(__name__)
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "GET":
        return render_template("index.html", resp="your script's output will be printed here")
    if request.method == "POST":
        resp = request.form["text_input"]
        output = subprocess.check_output(['./script.sh',resp])
    print(output)
    return render_template("index.html", resp=output)

@app.route('/reset', methods=['GET', 'POST'])
def text():
    if request.method == "POST":
        return redirect("/")
if __name__ == '__main__':
   app.run(debug=True)
