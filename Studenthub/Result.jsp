<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results</title>
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

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: lightgray;
        }
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        h2 {
    text-align: center;
    font-size: 2em;
    font-family: Arial, sans-serif;
    color: green;
    margin-top: 50px;
    margin-bottom: 30px;
}
form {
   display: flex;
   align-items: center;
   justify-content: center;
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
    </style>
</head>
<body>
    <%
    if(session==null)
    { response.sendRedirect("login.jsp"); }
    else {
    String type=(String) session.getAttribute("type");
    if(type==null || type.equals("s"))
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
     </form>
        <% String studentname=(String) session.getAttribute("studentname");
         String studentcgpa=(String) session.getAttribute("studentcgpa");

            String studentdept=(String) session.getAttribute("studentdept");
             String studentsemester=(String) session.getAttribute("studentsemester");
              String studentRollno=(String) session.getAttribute("studentRollno");

             
            %>
    
            <!DOCTYPE html>
            <html>
    
            <head>
                <title>Results</title>
            </head>
    
            <body>
                <h2> Record Found</h2>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>RollNo</th>
                        <th>Deptartment</th>
                        <th>Cgpa</th>
                         <th> Semester</th>
                    </tr>
                    <tr>
                        <td>
                            <%=studentname%>
                        </td>
                        <td>
                            <%=studentRollno%>
                        </td>
                        <td>
                            <%=studentdept%>
                        </td>
                        <td>
                            <%=studentcgpa%>
                        </td>
                         <td>
                            <%=studentsemester%>
                        </td>
                    </tr>
                </table>

         

<form action="logout" method="post">
   <input type="submit" value="Logout">
</form>
<% } } %>
                   

                
</body>
</html>