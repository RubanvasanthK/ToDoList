<%@page import="java.util.Base64"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.sql.*"  %>
<%@page import="java.io.*"  %>
<%@ include file="nav.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 5px;
        overflow: hidden;
    }
    
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #f0f0f0;
        color: #333;
    }
    
    td {
        color: #666;
    }
    
    img {
        max-width: 100px;
        max-height: 100px;
        vertical-align: middle;
    }
    
    #aa {
        text-decoration: none;
        color: #fff;
        background-color: green;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    #aa:hover {
        background-color: black;
    }
    
    tr {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* Add box shadow */
  margin-bottom: 10px; /* Add gap between rows */
}
    

</style>
</head>
<body>


<table>

		<thead>
			<tr>
				<th>id</th>
<th>title</th>
<th>description</th>
<th>priority</th>
<th>due date</th>
<th>status</th>
			</tr>

		</thead>
		<tbody>
		
        <%
        int i=0;
		try
		{	
			String name=request.getParameter("search");
			User u=(User)request.getSession().getAttribute("user");
			int id=u.getUserid();
			Connection con = Dao.getConnection();
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery("select * from db5.task where userid="+id+" and tasktitle like '%"+name+"%' or taskpriority like '%"+name+"%'  ");
			
			while(rs.next() && (!name.equals(""))) 
			{ 
        %>
        
			<tr>
			
				<td><%=i+1 %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
			
			</tr>
        
        <% i++;} 
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
		%>
		
		</tbody>
	</table>
<% if(i==0){ %>
<h1>Task not available</h1>
<% } %>
</body>
</html>