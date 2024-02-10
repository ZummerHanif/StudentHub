import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class Login extends HttpServlet {

  public static void main(String args [])
  {
    
  }
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();

     
    String password=request.getParameter("password");
    String email=request.getParameter("email");
	







    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/studenthub";

    Connection con=DriverManager.getConnection(url, "root", "root");
  
    Statement st=con.createStatement();
	
			 

     
     String query = "Select * from sh where email='" +email  + "' And password='" + password+"'"; 

     System.out.println(query);

      ResultSet rs = st.executeQuery( query );
	  
	  

     if(rs.next() )
     {
		  String  username=rs.getString("username");
		 String  type=rs.getString("type");
		 
		   String  rollno=rs.getString("rollno");
		    String  phoneno=rs.getString("phoneno");
			
			 
		 

		   HttpSession session = request.getSession(true);

		  session.setAttribute("username", username);
		 session.setAttribute("type", type);
		   session.setAttribute("email", email);
		  session.setAttribute("rollno", rollno);
		   session.setAttribute("phoneno", phoneno);
		if(type.equals("s"))
		{
		
      response.sendRedirect("StudentHome.jsp");
		}
		if (type.equals("a")){
			
  response.sendRedirect("AdminHome.jsp");		}
        
     
    }
	else{
		
	
		response.sendRedirect("/Studenthub/login.jsp");
	}

  

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
