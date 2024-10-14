from flask import Flask, jsonify, request
from helper import execute_query

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

@app.route("/", methods = ["GET"])
def index():
    return "Welcome to Birthdays!"

# Before starting, change the visibility of the port 5000 to Public so Postman can access the endpoints!

# 1. Create an API with route /birthdays to display all the birthdays in the database

# 2. Using the same route, allow the user to add a birthday to the database

# 3. Create an API with route /birthdays/count to count the number of birthdays in the database

# 4. Create an API to search for birthdays by month
# Example: If we hit /birthdays/search?month=6, we should be able to see all the June birthdays

# 5. Create an API to search for the birthday by name
# Example: If we hit /birthdays/search?name=Hermione, we should be able to see Hermione's birthday

# 6. Make sure the above APIs validate input and return the correct status codes!

if __name__ == '__main__':
    app.run(debug = False)

