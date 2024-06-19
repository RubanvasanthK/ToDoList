<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    form {
        background-color: #ffffff;
        max-width: 400px;
        width: 100%;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    #heading {
        text-align: center;
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"],
    input[type="email"],
    input[type="file"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="file"]:focus,
    input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    input[type="submit"]:active {
        background-color: #004494;
    }

    input[type="file"] {
        padding: 3px;
    }

    input[type="file"]::-webkit-file-upload-button {
        background-color: #007bff;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="file"]::-webkit-file-upload-button:hover {
        background-color: #0056b3;
    }

    input[type="file"]::-webkit-file-upload-button:active {
        background-color: #004494;
    }
</style>
</head>
<body>

<form action="saveuser" method="post" enctype="multipart/form-data">
    <h2 id="heading">SIGNUP</h2>
    <label for="userid">Id:</label>
    <input type="text" id="userid" name="id" required><br>
    
    <label for="username">Name:</label>
    <input type="text" id="username" name="name" required><br>
    
    <label for="useremail">Email:</label>
    <input type="email" id="useremail" name="email" required><br>
    
    <label for="usercontact">Contact:</label>
    <input type="text" id="usercontact" name="contact" required><br>
    
    <label for="userpassword">Password:</label>
    <input type="password" id="userpassword" name="password" required><br>
    
    <label for="userimage">Image:</label>
    <input type="file" id="userimage" name="image" required><br><br>
    
    <input type="submit" id="submit" value="Sign Up">
</form>

</body>
</html>
