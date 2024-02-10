<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Record</title>
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
}</style>
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
    <form action="AddStudentRecord" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="studentname"></td>
            </tr>
            <tr>
                <td>Roll No:</td>
                <td><input type="text" name="studentRollno"></td>
            </tr>
            <tr>
                <td>Department:</td>
                <td><input type="text" name="studentdept"></td>
            </tr>
            <tr>
                <td>Cgpa:</td>
                <td><input type="text" name="studentcgpa"></td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td><input type="text" name="studentsemester"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Add Student">
                </td>
            </tr>
        </table>
    </form>

    <% } } %>

    <form action="logout" method="post">
   <input type="submit" value="Logout">
</form>
</body>


</html>
