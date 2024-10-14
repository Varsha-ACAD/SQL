from flask import Flask, jsonify, request
from helper import execute_query

app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

# Define routes
@app.route('/')
def index():
    return 'Welcome to the Ikea!'

if __name__ == '__main__':
    app.run(debug = False)