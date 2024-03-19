package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BookOrderImpl;
import com.dao.CartDaoImpl;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAddr=address+","+landmark+","+city+","+state+","+pincode;
			
			/* System.out.println(name=" "+email+" "+phno+" "+fullAddr+" "+paymentType); */    //demo purpose
			
			CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
			List<Cart> blist=dao.getBookByUserId(id);
			
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
				
				BookOrder o=null;
				
				ArrayList<BookOrder> orderList=new ArrayList<BookOrder>();
				Random r=new Random();
				for(Cart c:blist)
				{
					o=new BookOrder();
					/* System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice()); */   //demo purpose
					
					o.setOrderId("Book-ORD-00"+r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFullAddr(fullAddr);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					//i++;
					orderList.add(o);
					
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg", "Please Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}
				else
				{
					boolean f=dao2.saveOrder(orderList);
					
					if(f)
					{
						resp.sendRedirect("order_success.jsp");
					}
					else {
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
