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


public class newComment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            String Reply = request.getParameter("Reply");
            String Usr_ID = request.getParameter("User_ID");
            String PostID = request.getParameter("Post_ID");
            java.util.Date date = new java.util.Date();
            java.sql.Date data = new java.sql.Date( date.getTime() );            PreparedStatement st = con
                    .prepareStatement("INSERT INTO `Relies` (`Reply_ID`, `Post_ID`, `User_ID`, `Reply`, `Date`) VALUES (NULL, ?, ?, ?, ?);");
            st.setString(1,PostID);
            st.setString(2,Usr_ID);
            st.setString(3,Reply);
            st.setString(4,data.toString());
            st.executeUpdate();
            PrintWriter out = response.getWriter();
            // Close all the connections
            st.close();
            con.close();
            response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}