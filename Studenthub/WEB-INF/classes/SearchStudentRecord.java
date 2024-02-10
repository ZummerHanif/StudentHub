import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class SearchStudentRecord extends HttpServlet {

  public static void main(String args [])
  {
    
  }
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();

     
  
	 HttpSession session = request.getSession(false);
   String type=(String)session.getAttribute("type");
   if(type.equals("s") || session==null)
   {
   
		response.sendRedirect("/Studenthub/login.jsp");
   }



  

	
    String studentRollno=request.getParameter("studentRollno");
	
  


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/studenthub";

    Connection con=DriverManager.getConnection(url, "root", "root");
  
    Statement st=con.createStatement();
	


     
    String query = "Select * from studentrecord where studentRollno='" +studentRollno  + "'"; 

     System.out.println(query);

      ResultSet rs = st.executeQuery( query );
	  
	

     if(rs.next() )
     {
		  String  studentname=rs.getString("studentname");
	      String  studentdept=rs.getString("studentdept");
		  String  studentcgpa=rs.getString("studentcgpa");
		  String  studentsemester=rs.getString("studentsemester");
		  
		 
		    
			 session.setAttribute("studentname", studentname);
		 session.setAttribute("studentRollno", studentRollno);
		   session.setAttribute("studentdept", studentdept);
		  session.setAttribute("studentcgpa", studentcgpa);
		   session.setAttribute("studentsemester", studentsemester);

		   response.sendRedirect("Result.jsp");
		   
	 }
			
		 
		 
		  
		   else
		   {
			   
            

		  response.sendRedirect("Error.jsp");
		   
		   }

        
    

  

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
