/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.forum;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // get request parameters for userID and password

        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        try{
        Connection con = DatabaseConnection.initializeDatabase();
        String query  = "select * from Users where Username = ? && passwd = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,user);
        ps.setString(2,pwd);
        ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String ID = rs.getString("User_ID");
                HttpSession session = request.getSession();
                session.setAttribute("user", "Pankaj");
                //setting session to expiry in 30 mins
                session.setMaxInactiveInterval(30*60);
                Cookie userName = new Cookie("user", user);
                Cookie userID = new Cookie("userID", ID);
                userName.setMaxAge(30*60);
                userID.setMaxAge(30*60);

                response.addCookie(userName);
                response.addCookie(userID);
                response.sendRedirect("/Forum");

            }else{
                InetAddress addr = InetAddress.getLocalHost();
                String ipAddress = addr.getHostAddress();
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");


                String appPath = "Users\\Public\\Documents\\servlet";
                String folderName = request.getParameter("folder");
                appPath +="\\"+folderName+"\\";

                try {
                    File myObj = new File("C:\\Users\\Public\\Documents\\pliki.txt");
                    if (myObj.createNewFile()) {
                        System.out.println("File created: " + myObj.getName());
                    } else {
                        System.out.println("File already exists.");
                    }
                } catch (IOException e) {
                    System.out.println("An error occurred.");
                    e.printStackTrace();
                }
                try {
                    Files.write(Paths.get("C:\\\\Users\\\\Public\\\\Documents\\\\pliki.txt"),(ipAddress+"\n").getBytes(),StandardOpenOption.APPEND);
                }catch (IOException e) {
                }
                PrintWriter out= response.getWriter();
                out.println("<font color=red>Either user name or password is wrong. Your IP adress: "+ipAddress+"</font >");
                rd.include(request, response);
            }

    } catch (
                SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }



    }

}

