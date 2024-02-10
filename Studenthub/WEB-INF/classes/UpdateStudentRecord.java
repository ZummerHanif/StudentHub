import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class UpdateStudentRecord extends HttpServlet {

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
	

String query= "UPDATE studentrecord SET studentname='"+studentname+"', studentdept='"+studentdept+"', studentcgpa='"+studentcgpa+"', studentsemester='"+studentsemester+"', studentrollno='"+studentNewRollno+"' WHERE studentRollno='"+studentRollno+"'";
	
	    
	
    int i= st.executeUpdate(query);
	
	if(i>0)
	{
      
	   session.setAttribute("studentname", studentname);
		 session.setAttribute("studentRollno", studentNewRollno);
		   session.setAttribute("studentdept", studentdept);
		  session.setAttribute("studentcgpa", studentcgpa);
		   session.setAttribute("studentsemester", studentsemester);

response.sendRedirect("UpdatedRecord.jsp");
     
	}
	else
	{
		response.sendRedirect("UpdateStudentRecord.jsp");
	}
	
		 
		 
		  
		   

        
    

  

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
