package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Contact;

public class ContactDaoImpl implements ContactDao {
	
	private Connection conn;
	
	public ContactDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean contactUser(Contact contact) {
		boolean f=false;
		
		try {
			String sql="insert into contact_us(fname,lname,email,phno,comment) values (?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, contact.getFirstName());
			ps.setString(2, contact.getLastName());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getPhno());
			ps.setString(5, contact.getMsg());
			
			int i = ps.executeUpdate();
			if(i>0)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
