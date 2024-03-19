package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BookDaoImpl;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			int bookId=Integer.parseInt(req.getParameter("bookId"));
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			boolean f=dao.oldBookdelete(email, "Old", bookId);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg","Old Book Delete Successfully...");
				resp.sendRedirect("old_book.jsp");
			}
			else {
				session.setAttribute("failedMsg","Something wrong on server");
				resp.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
