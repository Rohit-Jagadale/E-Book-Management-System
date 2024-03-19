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
import com.dao.CartDaoImpl;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
		    int bookId=Integer.parseInt(req.getParameter("bookId"));
			int userId=Integer.parseInt(req.getParameter("userId"));
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		    BookDetails b=dao.getBookById(bookId);
		    
		    Cart c = new Cart();
		    c.setBookId(bookId);
		    c.setUserId(userId);
		    c.setBookName(b.getBookName());
		    c.setAuthor(b.getAuthor());
		    c.setPrice(Double.parseDouble(b.getPrice()));
		    c.setTotalPrice(Double.parseDouble(b.getPrice()));
		    
		    CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
		    boolean f = dao2.addCart(c);
		    
		    HttpSession session=req.getSession();
		    
		    
		    if(f)
		    {
		    	session.setAttribute("addCart", "Book Added to Cart...");
		    	resp.sendRedirect("all_new_book.jsp");
		    
		    }
		    else {
		    	session.setAttribute("failed", "Something wrong on server...");
		    	resp.sendRedirect("all_new_book.jsp");
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
