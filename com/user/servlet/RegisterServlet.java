package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDaoImpl;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

           // System.out.println(name+" "+email+" "+phno+" "+password+" "+check);    
            
            // Creating user object
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);
 
            HttpSession session = req.getSession();
            
            // Saving user to database
        if(check!=null)
        {
            UserDaoImpl userDao = new UserDaoImpl(DBConnect.getConn());
            
            boolean f2 = userDao.checkUser(email);
            if(f2)
            {
            	 boolean isRegisterd = userDao.userRegister(us);
            	 
                 if (isRegisterd) {
                     //System.out.println("User registered successfully..."); //checking purpose only
                 	
                 	session.setAttribute("succMsg", "Registration Successfully...");
                 	resp.sendRedirect("register.jsp");
                 } else {
                    // System.out.println("Something went wrong on the server...");
                 	session.setAttribute("failedMsg", "Something went wrong on the server...");
                 	resp.sendRedirect("register.jsp");
                 }
            }
            else {
            	session.setAttribute("failedMsg", "User Already Exist.. Try Another Email Id");
             	resp.sendRedirect("register.jsp");
			}
        }
        else 
        {
        	// System.out.println("Plese check Agree & Terms Condition.."); //checking purpose only
        	
        	session.setAttribute("failedMsg", "Plese Check Agree & Terms Condition..");
        	resp.sendRedirect("register.jsp");
        }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error occurred while processing registration.");
        }
    }
}
