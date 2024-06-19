<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style >
	*{
padding: 0px;
margin: 0px;
}
#container{
		height:100vh;
		background-image: url("https://cdn.pixabay.com/photo/2020/08/03/09/51/pencil-5459686_1280.png");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		display: flex;
		flex-direction:row;
		justify-content: center;
		align-items:center;
	}
#box{
color:white;
   position:absolute;
   top:190px;
	padding: 30px;
	border:2px solid rgba(255,255,255,0.2);
	backdrop-filter:blur(5px);
	border-radius:10px;
	height: 300px;
	font-family: sans-serif;
	line-height: 20px;
	display: flex;
	flex-direction:row;
	justify-content: center;
	align-items:center;
	background:transparent;
	box-shadow: 0px 0px 25px 1px black;
}
input{
display:flex;
align-content: center;
width: 250px;
height: 30px;
border-radius: 10px;
}
#submit{
border: 1px solid white;
	background: linear-gradient(45deg, #003A52, #0785B4);
	width: 150px;
	height: 35px;
	text-align: center;
	border-radius: 10px;
	padding-left: 40px;
	font-family: monospace;
	font-size: x-large;
	transition:0.4s;
	
	
}
#submit:hover {
	background: linear-gradient(45deg, #0785B4, #003A52);
	width: 150px;
	height: 35px;
	text-align: center;
	border-radius: 30px;
	padding-left: 40px;
	font-family: monospace;
	font-size: x-large;
	transition:0.4s;
	cursor: pointer;
	color: white;
}
#heading{
	color: white;
}

a{
margin-left: 159px;
padding: 0px;
}
	
</style>

</head>
<body>

<div id="container">

<div id="box">

	<form action="userlogin" method="post" >
	<h2 id="heading">LOGIN</h2>
	<br>
	<label for="useremail">Email :</label><br>
	<input type="email" name="email"><br><br>
	
	<label for="userpassword">Password :</label><br>
	<input type="text" name="password"><br>
	
	<a href="forgotPassword.jsp" style="color: white; ">forgot password-click here</a>
	
	<br><br>
	
	<input type="submit" id="submit">
</form>


</div>


</div>



</body>
</html>