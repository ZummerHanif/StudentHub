<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Student Hub</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-image: url("std.jpg");
            background-size: cover;
            background-position: center;
            font-family: 'Montserrat', sans-serif;
        }
        

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px #00000060;
            margin-top: 50px;
            width: 45%;
            height:45%;
            border: 2px solid #ccc;
            background-color: rgba(255, 255, 255, 0.8);
             background: linear-gradient(to bottom, #f5f5f5, #e8e8e8);
             
        }

        .logo {
            max-width: 150px;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            border-radius: 5px;
            padding: 10px;
            border: none;
            box-shadow: 0px 0px 5px #00000060;
        }

        .form-group button {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            box-shadow: 0px 0px 5px #00000060;
        }

        .form-group button:hover {
            background-color: #0062cc;
        }
      
       
    </style>
</head>
<body>
    <%
     String type=(String) session.getAttribute("type"); 
   
    if (session!=null && type!=null && type.equals("s"))
                         {
                              response.sendRedirect("StudentHome.jsp");
                         }
    else if(session!=null && type!=null && type.equals("a"))
                          {
                             response.sendRedirect("AdminHome.jsp");
                          }
     else { %>
    <div class="container">
        <div class="text-center">
            <img class="logo" src="logo.jpg" alt="Student Hub logo">
        </div>
        <h1 class="text-center">Student Hub</h1>
        <form method="post" action="Login">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <br>
              <p>Don't have an account?  <a href="signup.jsp">Sign Up</a></p>
        </form>
    </div>
       <% } %> 
</body>
</html>
