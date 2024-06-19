<%@page import="dto.Task"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.List"%>
<%@ include file="nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">


/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 20px;
}

#a {
    background-color: #ffffff;
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Label Styles */
form label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

/* Input Styles */
form input[type="text"],
form input[type="date"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
}

/* Read-only Input Styles */
form input[readonly] {
    background-color: #e9ecef;
}

/* Radio Button Styles */
form input[type="radio"] {
    margin-right: 10px;
}

form label[for^="option"] {
    display: inline-block;
    margin-right: 20px;
    font-weight: normal;
    font-size: 16px;
}

/* Submit Button Styles */
#submit {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Form Title */
form h1 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
}

/* Form Description */
form p {
    text-align: center;
    font-size: 16px;
    margin-bottom: 20px;
}



</style>
</head>
<body>

<% Task task=(Task)request.getAttribute("task"); %>

	<form action="update" method="post" id="a">
		<label>task id:</label><br>
		<input type= "text" name = "taskid" required class="a" readonly="readonly" value="<%= task.getTaskid()%>"><br>
		
		<label>task title:</label><br>
		<input type= "text" name = "tasktitle" required class="a" value="<%= task.getTasktitle() %>"><br>
		
		<label>task description:</label><br>
		<input type= "text" name = "taskdescription" required class="a" value="<%= task.getTaskdescription() %>"><br>
		
		<label>Current taskpriority</label> <br>
		<input value="<%= task.getTaskpriority() %>" name="taskpriority">
		
		<label>Options :</label><br>
		<label for="option1">
		<input type= "radio" id="option1" value="low" name = "taskpriority" > Low
		</label><br>
		<label for="option2">
		<input type= "radio" id="option2" value="medium" name = "taskpriority" > Medium
		</label><br>
		<label for="option3">
		<input type= "radio" id="option3" value="high" name = "taskpriority" > High
		</label><br>
		
		<label>Due Date:</label><br>
		<input type= "date" name = "taskduedate" value="<%= task.getTaskduedate() %>"><br><br>
		
		<input type="submit"id="submit">
	</form>


</body>
</html>