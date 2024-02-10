<html lang="en">
<head>
    <%@ page import="java.util.*" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SearchStudentRecord</title>
   <style>
     header nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-around;
  background-color: #333;
}

header nav ul li a {
  color: #fff;
  text-decoration: none;
  padding: 1rem;
  display: block;
}

header nav ul li a:hover {
  background-color: #444;
}

        
      label {
        font-weight: bold;
        font-size: 18px;
        text-align: center;
        margin-bottom: 10px;
      }
      input[type="text"] {
        padding: 5px 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-top: 10px;
        width: 300px;
        text-align: center;
      }
      button[type="submit"] {
        padding: 5px 10px;
        background-color: green;
        color: white;
        border-radius: 5px;
        margin-top: 10px;
        cursor: pointer;
        width: 150px;
        text-align: center;
      }
      form {
            display:flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 10vh;
        }
        input[type="submit"] {
   padding: 10px 20px;
   background-color: red;
   color: white;
   border: none;
   border-radius: 5px;
   cursor: pointer;
   margin-top: 20px;
}

h1 {
  font-size: 36px;
  font-weight: bold;
  text-align: center;
  color:green;
  margin-top: 50px;
}
button:hover {
background-color: rgb(66, 152, 66); 
}

    </style>
</head>
<body>
     <%
    if(session==null)
    { response.sendRedirect("login.jsp"); }
    else {
    String type=(String) session.getAttribute("type");
    if(type==null || !type.equals("a"))
    {
    response.sendRedirect("login.jsp"); }
    else { %>
       <header>
            <nav>
                <ul>
                    <li><a href="AdminHome.jsp">Home</a></li>
                    <li><a href="SearchStudentRecord.jsp">SearchStudentRecord</a></li>
                    <li><a href="AddStudentRecord.jsp">AddStudentRecord</a></li>
                    <li><a href="UpdateStudentRecord.jsp">UpdateStudentRecord</a></li>
                    <li><a href="DeleteStudentRecord.jsp">DeleteStudentRecord</a></li>
                </ul>
            </nav>
        </header>
      <h1>Search Student Record</h1>
    <form action="SearchStudentRecord" method="post">
        <div>
            <label for="Search By Roll no">Enter Roll no:</label>
            <input type="text" id="studentRollno" name="studentRollno" required>
            <button type="submit" value="Search" name="Search">Search</button>
        </div>  
    

    </form>
</body>

<% } } %>
<form action="logout" method="post">
   <input type="submit" value="Logout">
</form>
</html>
