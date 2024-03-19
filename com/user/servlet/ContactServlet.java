package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.ContactDaoImpl;
import com.entity.Contact;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String msg = req.getParameter("msg");
			
			//System.out.println(fname+" "+lname+" "+email+" "+phno+" "+msg);
			
			//Creating contact object
			Contact c=new Contact();
			c.setFirstName(fname);
			c.setLastName(lname);
			c.setEmail(email);
			c.setPhno(phno);
			c.setMsg(msg);
			  
			HttpSession session = req.getSession();
			
			ContactDaoImpl dao=new ContactDaoImpl(DBConnect.getConn());
			
			boolean contact=dao.contactUser(c);
			if(contact)
			{
				//System.out.println("FeedBack Submitted Successfully...");
				session.setAttribute("succMsg", "FeedBack Submitted Successfully...");
             	resp.sendRedirect("contactus.jsp");
			}
			else {
				// System.out.println("Something went wrong on the server...");
				 session.setAttribute("failedMsg", "Something went wrong on the server...");
              	 resp.sendRedirect("contactus.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
