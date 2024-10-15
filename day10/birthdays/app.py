from flask import Flask, jsonify, request
from helper import execute_query

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

@app.route("/", methods = ["GET", "POST"])
def index():
    if request.method == "GET":
        return "Welcome to Birthdays!"
    elif request.method == "POST":
        return jsonify("You cannot POST to Birthdays."), 405

# Before starting, change the visibility of the port 5000 to Public so Postman can access the endpoints!

# 1. Create an API with route /birthdays to display all the birthdays in the database
@app.route("/birthdays", methods = ["GET", "POST"])
def birthdays():
    if request.method == "GET":
        birthdays = execute_query("SELECT * FROM birthdays")
        return birthdays, 200
    elif request.method == "POST":
        birthday = request.json
        print(birthday)
        query = f"INSERT INTO birthdays (name, month, day) VALUES ('{birthday['name']}', {birthday['month']}, {birthday['day']})"
        execute_query(query)
        return "Success!"

# 2. Using the same route, allow the user to add a birthday to the database

# 3. Create an API with route /birthdays/count to count the number of birthdays in the database

# 4. Create an API to search for birthdays by month
# Example: If we hit /birthdays/search?month=6, we should be able to see all the June birthdays

# 5. Create an API to search for the birthday by name
# Example: If we hit /birthdays/search?name=Hermione, we should be able to see Hermione's birthday

# 6. Make sure the above APIs validate input and return the correct status codes!

if __name__ == '__main__':
    app.run(debug = False)

