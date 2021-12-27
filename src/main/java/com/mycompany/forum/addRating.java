package com.mycompany.forum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class addRating extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            request.setCharacterEncoding("UTF-8");
            String Reply_ID = request.getParameter("Reply_ID");
            String User_ID = request.getParameter("User_ID");
            String star1 = request.getParameter("star1");
            java.util.Date date = new java.util.Date();
           java.sql.Date data = new java.sql.Date( date.getTime() );            PreparedStatement st = con
                    .prepareStatement("INSERT INTO `Rating` (`Reply_ID`, `User_ID`, `Stars`) VALUES (?, ?, ?);");
            st.setString(1,Reply_ID);
            st.setString(2,User_ID);
            st.setString(3,star1);
            st.executeUpdate();
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