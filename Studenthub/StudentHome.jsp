<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Student Hub Home Page</title>
	<style>
		body {
			margin: 0;
		font-family: 'Montserrat', sans-serif;
      
     background-color: #f2f2f2;
		}

	header nav ul {
  list-style: none;
  margin: auto;
  padding: 0;
  display: flex;
  justify-content: space-evenly;
  background-color: #005792; /* dark blue */
}

header nav ul li a {
  color: #fff;
  text-decoration: none;
  padding: 1rem;
  display: block;
}

header nav ul li a:hover {
  background-color: #ff8c42; /* orange */
}

main h1 {
  text-align: center;
  margin-top: 2rem;
  color: #005792; /* dark blue */
}

main p {
  text-align: center;
  margin-bottom: 2rem;
  color: #005792; /* dark blue */
}

footer {
  text-align: center;
  background-color: #005792; /* dark blue */
  color: #fff;
  padding: 1rem;
  margin-top: 30%;
}
.my-icon {
  color: white;
  font-size: 50px;
  padding-left: 300%;
}

  
	</style>
</head>
<body>
	<%
	if(session==null) {
		response.sendRedirect("login.jsp");
	} else {
		String type=(String) session.getAttribute("type"); 
		if(type==null || !type.equals("s")) {
			response.sendRedirect("login.jsp");
		} else {
	%>
		<header>
			<nav>

				<ul>
					<li><a href="StudentHome.jsp">Home</a></li>
					<li><a href="ViewGrades.jsp">Courses</a></li>
          <li><i class="my-icon">...</i></li>
				</ul>
			</nav>
		</header>
		<main>
			<%
				String username =(String)session.getAttribute("username");
			%>
			<h1>Welcome <%=username%></h1>
			<p>This is the Student Hub Home Page.</p>
		</main>
	<%
		}
	}
	%>

	<footer>
		<p>&copy; Student Hub 2023</p>
	</footer>
</body>
</html>
