package com.dao;

import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUserId(int userId);
	
	public boolean deleteBook(int bookId,int userId,int cartId);
	
}
