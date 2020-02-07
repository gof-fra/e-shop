package com.haggar.eshop.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.haggar.eshop.model.RegisterModel;
import com.haggar.eshopBackend.dao.UserDAO;
import com.haggar.eshopBackend.dto.Address;
import com.haggar.eshopBackend.dto.Cart;
import com.haggar.eshopBackend.dto.User;

@Component
public class RegisterHandler {
	
	@Autowired
	private UserDAO userDAO;
	
	public RegisterModel init() {
		
		
		return new RegisterModel();
	}
	
	
	public void addUser(RegisterModel registerModel, User user) {
		
		registerModel.setUser(user);
		
	}
	
	
	public void addBilling(RegisterModel registerModel, Address billing) {
		
		registerModel.setBilling(billing);
		
	}
	
	public String saveAll(RegisterModel model) {
		String transitionvalue = "success";
		
		// fetch the user
		User user = model.getUser();
		
		if(user.getRole().equals("USER")) {
			
			Cart cart = new Cart();
			
			cart.setUser(user);
			user.setCart(cart);
		}
		
		// save user
		userDAO.addUser(user);
		
		// get the address
		
		Address billing = model.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		
		// save the address
		userDAO.addAddress(billing);
		
		
		return transitionvalue;
	}

}
