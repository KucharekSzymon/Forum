package com.mycompany.forum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.forum.DatabaseConnection;
// Servlet Name
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
HttpServletResponse response)
		throws ServletException, IOException
	{
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			String user = request.getParameter("user");
			String pwd = request.getParameter("pwd");
			System.out.printf(user);
			System.out.printf(pwd);

			PreparedStatement st = con
				.prepareStatement("INSERT INTO `Users` (`User_ID`, `Username`, `passwd`, `Role`) VALUES (NULL, ?, ?, '1')");
			st.setString(1,user);
			st.setString(2,pwd);
			st.executeUpdate();
			PrintWriter out = response.getWriter();
			// Close all the connections
			st.close();
			con.close();
			response.sendRedirect("/Forum/login.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
			PrintWriter error = response.getWriter();
			error.println("<script>alert('Username is already taken! You will be redirected soon');window.location.href = '/Forum/register.jsp';</script>");
		}
	}
}
