package com.dao;

import java.util.List;

import com.entity.BookOrder;
import com.user.servlet.OrderServlet;

public interface BookOrderDao {
	
	public boolean saveOrder(List<BookOrder> b);
	
	public List<BookOrder> getBook(String email);
	
	public List<BookOrder> getAllOrder();
}
