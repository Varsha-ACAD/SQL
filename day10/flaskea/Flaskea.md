# Flaskea

For this peer evaluation activity, implement APIs as per the specification mentioned below.
## API Specification
### 1. Get all users (GET `/user`)
* Handle the case where no users are present in the database.
* Return the appropriate status codes.
### 2. Get a user by ID (GET `/user/<int:user_id>`)
* Handle the case where the ID does not match any existing user.
* Return the appropriate status codes.
### 3. Get all products (GET `/products`)
* Handle the case where no products are present in the database.
* Return the appropriate status codes.
### 4. Get a product by ID (GET `/products/<int:product_id>`)
* Handle the case where the ID does not match any existing product.
* Return the appropriate status codes.
### 5. Get cart items by user ID (GET `/cart/<int:user_id>`)
* Handle the case where the user does not have a cart.
* Return the appropriate status codes.
### 6. Create a new user (POST `/users`)
* Accept the username, password and email as parameters in the URL.
* Since these fields are defined as NOT NULL in the db, validate the input to make sure all values are provided.
* Hash the password before storing it in the db. You can use any hashing library in Python to help you do this. For example, see [here](https://www.geeksforgeeks.org/how-to-hash-passwords-in-python/).
* Return the appropriate status codes.
### 7. Update a specific user's Email (PUT `/users/<int:user_id>`)
* Handle the case where the ID does not match any existing user.
* Return the appropriate status codes.
### 8. Create an API of your choice!
* Explain the purpose of the API in comments.

## How to Test
Use Postman to test that the endpoints are working as expected.

## How to Submit
Download and submit only the app.py file.

## Peer Evaluation
1. Run the app.py file and try out all the API endpoints using Postman.
2. Check the app.py file for design and comments.
3. Score based on correctness and design.