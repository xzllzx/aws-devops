from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello_world():
    current_time = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')
    return f'<h1>Current Time (GMT): {current_time}</h1>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
