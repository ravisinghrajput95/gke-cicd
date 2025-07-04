from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Flask app v2.0 deployed to GKE via Cloud Build CI/CD!"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
