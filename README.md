# py-flask
------------
Using python and flask to run a shell script from a web app ui

A simple web-app to call a local shell-script and print the output.

## hello.py
------------
```
from flask import flash
import re
import subprocess
from flask import Flask, render_template, request, redirect, url_for
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField


DEBUG = True
app = Flask(__name__,template_folder='/home/vijaych/py-flask/templates')
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
   ```
   
## index.html
--------------
```

<!doctype html>
<html>
<head>
  <title>sample flask app</title>
</head>
<body>

<link rel="stylesheet" media="screen" href="static/bootstrap.min.css">
<link rel="stylesheet" href="static/bootstrap-theme.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<div class="container">
<h2>Script Runner</h2>
  <form action="" method="post">
    Enter arguments for your script:<br>
<div class="form-group">
	<input type="text" name="text_input" value="">
</div>
<br>
<button type="submit" class="btn btn-success">Submit</button>
  </form>
  <br>
  <form action="/reset" method="post">
	  <button type="submit" class="btn btn-success">Reset</button>
  </form>
  <br>
  <div class="row"> 
<div class="alert alert-info"> 
	  {{ resp }} 

  </div>
  </div>
  </div>
		
</body>
</html>
```

## Shell script
---------------
```
#!/bin/bash

echo "The argument you passed for your script was: $1"
```
this is a silly script though :P




### change path in hello.py
--------------------------
app = Flask(__ name __ ,template_folder= __'/PATH/TO/__ py-flask/templates')

### Command to run app
---------------------
export FLASK_APP=hello.py
flask run

### Run in background (daemon)
-----------------------------
sudo apt install gunicorn

gunicorn -b 127.0.0.1:5000 hello:app -D
