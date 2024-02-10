<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Hub Home Page</title>
    <style>
        header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
            background-color:#005792;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 1rem;
            display: block;
        }

        header nav ul li a:hover {
            background-color: #ffa500;
        }

        main h1 {
            text-align: center;
            margin-top: 2rem;
            color :#005792;
        }

        main p {
            text-align: center;
            margin-bottom: 2rem;
            color :#005792;
        }

        footer {
            text-align: center;
            background-color: #005792;
            color: #fff;
            padding: 1rem;
        }

        form {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #ffa500;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        footer {
  text-align: center;
  background-color: #005792; /* dark blue */
  color: #fff;
  padding: 1rem;
  margin-top: 27%;
}
    </style>
</head>

<body>
    <% 
        if(session==null)
        { 
            response.sendRedirect("login.jsp"); 
        } 
        else 
        {
            String type=(String) session.getAttribute("type"); 
            if(type==null || !type.equals("a")) 
            {
                response.sendRedirect("login.jsp"); 
            } 
            else 
            { 
    %> 
        <header>
            <nav>
                <ul>
                    <li><a href="AdminHome.jsp">Home</a></li>
                    <li><a href="SearchStudentRecord.jsp">Search Student Record</a></li>
                    <li><a href="AddStudentRecord.jsp">Add Student Record</a></li>
                    <li><a href="UpdateStudentRecord.jsp">Update Student Record</a></li>
                    <li><a href="DeleteStudentRecord.jsp">Delete Student Record</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <% 
                String username =(String)session.getAttribute("username"); 
            %>
            <h1>Welcome <%=username%></h1>

            <form action="logout" method="post">
                <input type="submit" value="Logout">
            </form>
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
