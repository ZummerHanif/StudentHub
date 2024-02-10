import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class AddStudentRecord extends HttpServlet {

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
  


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/studenthub";

    Connection con=DriverManager.getConnection(url, "root", "root");
  
    Statement st=con.createStatement();
	


     
    String query = "INSERT INTO studentrecord(studentname,studentRollno,studentdept,studentcgpa,studentsemester)VALUES('" + studentname + "','" + studentRollno + "','" + studentdept+ "','" + studentcgpa + "','"+ studentsemester + "') ";


      
	  
 int rs = st.executeUpdate(query);

            if (rs == 1) {
                out.println("<h1>Data inserted sucessfully </h1>");
            } else {
                out.println("<h1>Data not inserted.</h1>");
            }
     
		 
		 
		  
		   

        
    

  

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
