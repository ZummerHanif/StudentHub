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
    if(type==null || type.equals("a"))
    {
    response.sendRedirect("login.jsp"); }
    else { %>
         <header>
            <nav>
                <ul>
                    <li><a href="StudentHome.jsp">Home</a></li>
                    <li><a href="ViewGrades.jsp">Grades</a></li>
                   
                </ul>
            </nav>
        </header>
     </form>
        <% 
        
        String []coursenames=(String[]) session.getAttribute("coursename");
         String []coursemarks=(String[]) session.getAttribute("coursemarks");
      for (int i = 0; i < coursenames.length; i++) 
         {
            String coursemark=coursemarks[i];
            String coursename=coursenames[i];
         int temp=Integer.parseInt(coursemark);
         double coursegpa=0.0;
         String coursegrade="Z";
            if(temp>=85)
            {
             coursegpa=4.0;
             coursegrade="A";
            }
            else if(temp>= 80 && temp <  85)
            {
             coursegpa=3.7;
             coursegrade="A-";
            }
             else if(temp>= 75 && temp <  80)
            {
             coursegpa=3.3;
             coursegrade="B+";
            }
             else if(temp>= 70 && temp <  75)
            {
             coursegpa=3.0;
             coursegrade="B";
            }
             else if(temp>= 65 && temp <  70)
            {
             coursegpa=2.7;
             coursegrade="B-";
            }
                else if(temp>= 60 && temp <  65)
            {
             coursegpa=2.3;
             coursegrade="C+";
            }
                else if(temp>= 55 && temp <  60)
            {
             coursegpa=2;
             coursegrade="C";
            }
                else if(temp>= 50 && temp <  55)
            {
             coursegpa=1.7;
             coursegrade="C-";
            }
            else
            {
                coursegrade="F";
                coursegpa=0;
            }
            
            
%>
              <p><%=coursename%></p>
              <p><%=coursegrade%></p>
                <p>  <%=coursegpa%></p>
    <%  }%>
    
            <!DOCTYPE html>
            <html>
    
            <head>
                <title>Results</title>
            </head>
    
            <body>
                <h2> Record Found</h2>
                <table border="1">
                    <tr>
                        <th>Course Name</th>
                        <th>Marks</th>
                        <th>Course Gpa</th>
                
                    </tr>
                    <tr>
                        <td>
                          
                        </td>
                        <td>
                            
                        </td>
                        <td>
                         
                        </td>
                       
                    </tr>
                </table>

         

<form action="logout" method="post">
   <input type="submit" value="Logout">
</form>
<% } } %>
                   

                
</body>
</html>