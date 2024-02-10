import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class DeleteStudentRecord extends HttpServlet {

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



  
    String studentname=request.getParameter("studentname");
    String studentdept=request.getParameter("studentdept");
	
    String studentRollno=request.getParameter("studentRollno");
	String studentcgpa=request.getParameter("studentcgpa");
	String studentsemester=request.getParameter("studentsemester");
	 String studentNewRollno=request.getParameter("studentNewRollno");
	
  


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/studenthub";

    Connection con=DriverManager.getConnection(url, "root", "root");
  
  
	Statement  st= con.createStatement();
	

String query = "DELETE FROM studentrecord WHERE studentRollno = '" + studentRollno + "'";
	
	    
	
    int i= st.executeUpdate(query);
	
	if(i>0)
	{
      
	  out.println("Record Deleted successfully");     
	}
	else
	{
		out.println("This Roll no doesn't exists");
		response.sendRedirect("DeleteStudentRecord.jsp");
	}
	
		 
		 
		  
		   

        
    

  

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
