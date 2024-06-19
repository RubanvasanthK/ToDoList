<%@page import="dto.Task"%>
<%@ include file="nav.jsp" %>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.List"%>
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

h1, h2 {
    text-align: center;
    color: #333;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

/* Table Styles */
table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

th, td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #007bff;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Button Styles */
a.button {
    display: inline-block;
    padding: 10px 20px;
    margin: 20px auto;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    text-align: center;
    cursor: pointer;
}

a.button:hover {
    background-color: #0056b3;
}


</style>


</head>
<body>





<h2>Tasks</h2>

<% 

User u=(User) request.getSession().getAttribute("user");

Dao dao=new Dao(); %>
<%List<Task> tasks = dao.getalltasksByUserId(u.getUserid());

int sno=1;
%>



<table>
<tr>
<th>s.no</th>
<th>title</th>
<th>description</th>
<th>priority</th>
<th>due date</th>
<th>status</th>
<th>Delete</th>
<th>Edit</th>
</tr>

<%for(Task task : tasks){  %>
<tr>
<td><%= sno %></td>
<td><%= task.getTasktitle() %></td>
<td><%= task.getTaskdescription() %></td>
<td><%= task.getTaskpriority()%></td>
<td><%= task.getTaskduedate() %></td>
<td><%= task.getTaskstatus() %></td>
<td><a href="delete?id=<%=task.getTaskid()%>">Delete</a></td>
<td><a href="edit?id=<%=task.getTaskid()%>">edit</a></td>
</tr>
<%  sno++; } %>

</table>

 


</body>
</html>