import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;
import java.util.regex.*;

public class SignUp extends HttpServlet {

    // Process the HTTP Get request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        // get PrintWriter object
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password= request.getParameter("password");
		 String confirmPassword= request.getParameter("confirmPassword");
        String rollno= request.getParameter("rollno");
        String phoneno = request.getParameter("phoneno");
		String type = "s";

 HttpSession session = request.getSession(true);
          session.setAttribute("rollno", rollno);
		  

        out.println("<html>");
        out.println("<head><title>Response</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");

        try {
			if(!password.equals(confirmPassword) )
		  {
			  out.println("<h1>Account not created.<br>(Password and Confirm password don't match)</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a> </h2>");
			  return ;
		  }
		  if(username.equals(" "))
		  {
			   out.println("<h1>Account not created.<br>Enter a valid username</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a></h2>");
			  return ;
			  
		  }
		   if(password.length()< 8 || password.length()>15)
			   
		  {
			   out.println("<h1>Account not created.<br>Password length should be atleast  8 character and at most 15 characters</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a></h2>");
			  return ;
			  
		  }
		  String regex = "^[a-zA-Z0-9_+&*-]+(?:\\." +
                "[a-zA-Z0-9_+&*-]+)*@" +
                "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                "A-Z]{2,7}$";

           Pattern pattern = Pattern.compile(regex);
           Matcher matcher = pattern.matcher(email);

          if (matcher.matches()!=true) {
			  out.println("<h1>Account not created.<br>email not valid</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a></h2>");
			  return ;
		  }
             if(rollno.equals(" ") || rollno.length()<9)
		  {
			   out.println("<h1>Account not created.<br>Enter a valid rollno</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a></h2>");
			  return ;
			  
		  }
		      if(phoneno.equals(" ") || phoneno.length()!=11)
		  {
			   out.println("<h1>Account not created.<br>Enter a valid phoneno</h1>");
			  out.println("<h2><a href='signup.jsp' > Back </a></h2>");
			  return ;
			  
		  }
          
 
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1/Studenthub";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query = "INSERT INTO sh(username,password,email,rollno,phoneno,type)VALUES('" + username + "','" + password + "','" + email+ "','" + rollno + "','"+ phoneno + "','"+ type + "') ";

           // System.out.println(query);

            int rs = st.executeUpdate(query);

            if (rs == 1) {
                out.println("<h1>Congratulations!! Your account has been created  successfully.</h1>");
				 out.println("<h2><a href='login.jsp' > Login </a> </h2>");
				
            } else {
                out.println("<h1>Account not created.</h1>");
            }

            out.println("</body></html>");

            st.close();
            con.close();

        } catch (Exception e) {

            out.println(e);
        }

    }

}
