package com.mycompany.forum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.forum.DatabaseConnection;
// Servlet Name
public class createPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            String User_ID = "";
            String user = request.getParameter("user");
            Connection con = DatabaseConnection.initializeDatabase();
            String query  = "SELECT User_ID from Users where Username = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user);
            ResultSet rs = ps.executeQuery();
            rs.next();

            User_ID = rs.getString("User_ID");
            String Title = request.getParameter("inputTitle");
            String Post = request.getParameter("inputPost");
            java.util.Date date = new java.util.Date();
            java.sql.Date data = new java.sql.Date( date.getTime() );            PreparedStatement st = con
                    .prepareStatement("INSERT INTO `Posts` (`Post_ID`, `Author_ID`, `Post_Title`, `Post`,`Date`) VALUES (NULL, ?, ?, ?, ?)");
            st.setString(1,User_ID);
            st.setString(2,Title);
            st.setString(3,Post);
            st.setString(4,data.toString());
            st.executeUpdate();
            PrintWriter out = response.getWriter();
            // Close all the connections
            st.close();
            con.close();
            response.sendRedirect("/Forum");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}