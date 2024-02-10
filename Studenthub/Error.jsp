<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RecordNotFound</title>
    <style>h1 {
    text-align: center;
    font-size: 36px;
    color: red;
    margin-top: 50px;
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
    <h1>Record Not Found</h1>

    <% } } %>

    <form action="logout" method="post">
   <input type="submit" value="Logout">
</form>
</body>
</html>