import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class ViewGrades extends HttpServlet {

  public static void main(String args [])
  {
    
  }
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
  
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();

     
  
	 HttpSession session = request.getSession(false);
   String type=(String)session.getAttribute("type");
   if(type.equals("a") || session==null)
   {
   
		response.sendRedirect("/Studenthub/login.jsp");
   }



  

	
    String studentRollno=request.getParameter("studentRollno");
	
   String rollno=(String)session.getAttribute("rollno");
   
    if(!rollno.equals(studentRollno) )
	{
	   response.sendRedirect("ViewGrades.jsp");
	}
	
	


    try
	{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/studenthub";

    Connection con=DriverManager.getConnection(url, "root", "root");
  
    Statement st=con.createStatement();
	


          String query = "Select * from coursemarks where studentRollno='" +studentRollno  + "'"; 

	      ResultSet  rs = st.executeQuery( query );
		  String[] coursename={" "};
		  String[] coursemarks={" "};
		  int i=0;
	  

	if(!rs.next())
			   
			{ out.println("<h1> Record Not Found </h1>");
			   out.println("<h2><a href='viewGrades.jsp' > Back </a> </h2>");
			  return ;
	}
       else
	   {
		   
     while(rs.next() )
     {
	 


      
 
    
		  String    name=rs.getString("coursename");
	      String  marks=rs.getString("coursemarks");
		    coursename[i]=name;
			coursemarks[i]=marks;
		  
		 
		    
			
		
i++;
		
		   
	 }
	  session.setAttribute("coursename", coursename);
		    session.setAttribute("coursemarks", coursemarks);
			
		
   response.sendRedirect("GradesResults.jsp");		
		  
	   }
	     
           
		
		   
		
        
    
	 
  

           st.close();
           con.close();

    }
	catch(Exception e)
	{

      out.println(e);
    }

  }

}