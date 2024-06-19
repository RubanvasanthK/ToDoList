<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 20px;
    }

    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container form {
        background-color: #ffffff;
        max-width: 500px;
        width: 100%;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Label Styles */
    .form-container form label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    /* Input Styles */
    .form-container form input[type="text"],
    .form-container form input[type="date"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }

    /* Radio Button Styles */
    .form-container form input[type="radio"] {
        margin-right: 10px;
    }

    .form-container form label[for^="option"] {
        display: inline-block;
        margin-right: 20px;
        font-weight: normal;
        font-size: 16px;
    }

    /* Submit Button Styles */
    .form-container form input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
    }

    .form-container form input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<%@ include file="nav.jsp" %>


<% Dao d=new Dao();
	
  int id=d.max();


%>

<div class="form-container">
    <form action="addTask" method="post">
        <label>Task ID:</label><br>
        <input type="text" name="taskid" required class="a" value="<%= id+1 %>" readonly="readonly"><br>
        
        <label>Task Title:</label><br>
        <input type="text" name="tasktitle" required class="a"><br>
        
        <label>Task Description:</label><br>
        <input type="text" name="taskdescription" required class="a"><br>
        
        <label>Options:</label><br>
        <label for="option1">
            <input type="radio" id="option1" value="low" name="taskpriority"> Low
        </label><br>
        <label for="option2">
            <input type="radio" id="option2" value="medium" name="taskpriority"> Medium
        </label><br>
        <label for="option3">
            <input type="radio" id="option3" value="high" name="taskpriority"> High
        </label><br>
        
        <label>Due Date:</label><br>
        <input type="date" name="taskduedate"><br><br>
        
        <input type="submit" id="submit">
    </form>
</div>

</body>
</html>
