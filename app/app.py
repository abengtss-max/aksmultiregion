import time
from flask import Flask, request, render_template, redirect
import os

app = Flask(__name__, template_folder='templates')

@app.route('/')
def hello():
    return redirect("/index.html", code=302)

@app.route('/index.html')
def index():
    region = os.environ.get('REGION_NAME', 'unknown')
    return render_template('index.html', response={'region': region})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
