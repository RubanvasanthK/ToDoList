<%@page import="dto.Task"%>
<%@ include file="nav.jsp" %>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <style>
 

#content{
   
    font-family: sans-serif;
  
 	
  
    
    /* flex-wrap: wrap; */
    
}

.card{

   
    height: 650px; 
    width: 515px;
    background-color: white;
    margin-top: 50px;
    
}

img{
    width: 515px;
    height: 400px;
   border-radius: 20px;
    
}

#item1{
    margin-left: 600px;

}
#item2{
margin-left: 70px;
}

.con2{
    padding: 20px;
   
}
p{
    line-height: 1.5;
    /* opacity: 0.3; */
    padding-top: 30px;
    font-weight: lighter;
}
#a1{
   
    border-radius: 3px;
   padding-left: 30px;
   padding-right: 30px;
   padding-top: 10px;
   padding-bottom: 10px;
   background-color: #D52349;
   color: white;
   text-decoration: none;
    margin: 40px;
    font-weight: bolder;
   
    
}
#a2{

    border-radius: 3px;
    padding-left: 30px;
    padding-right: 30px;
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: #252122;
    color: white;
    text-decoration: none;
    font-weight: bolder;

}





  </style>
</head>
<body>


<% User u=(User) request.getSession().getAttribute("user");  %>
<%String image = new String(Base64.getEncoder().encode(u.getUserimage()	)); %>



   <div id="content">
        
        <section id="item1" class="card">
            <img alt="" src="data:image/jpeg;base64,<%= image  %>" width="120px" height="120px">
            
             <div class="con2">
                <h2> User Name: <%=u.getUsername() %></h2>
                <section>User Email: <%=u.getUseremail() %></section>
                <p> User Password: <%=u.getUserpassword() %></p>

            

               

            </div>
           
            <a href="#" id="a1"><i class="fa-solid fa-file" ></i> Update profile </a>

           <a href="PasswordUpdate.jsp" id="a2"><i class="fa-solid fa-comment"></i>Update Password</a>

        </section>
    
    </div>


</body>
</html>