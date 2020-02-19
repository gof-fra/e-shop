package com.haggar.eshopBackend.dao;

import java.util.List;

import com.haggar.eshopBackend.dto.Address;
import com.haggar.eshopBackend.dto.Cart;
import com.haggar.eshopBackend.dto.User;

public interface UserDAO {
	
	// add user
	boolean addUser(User user);
	User getByEmail(String email);
	
	// add address
	boolean addAddress(Address address);
	// or
	//Address getBillingAddress(int userId);
	//List<Address> listShippingAddresses(int userId);
	
	
	Address getBillingAddress(User user);
	List<Address> listShippingAddresses(User user);
	
	// update cart
	boolean updateCart(Cart cart);
	
}
