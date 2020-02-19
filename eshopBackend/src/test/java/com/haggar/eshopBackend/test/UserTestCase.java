package com.haggar.eshopBackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.haggar.eshopBackend.dao.UserDAO;
import com.haggar.eshopBackend.dto.Address;
import com.haggar.eshopBackend.dto.Cart;
import com.haggar.eshopBackend.dto.User;

public class UserTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.haggar.eshopBackend");
		context.refresh();
		
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	
	
	/*@Test
	public void testAdd() {
		
		user = new User();
		user.setFirstName("haggar1");
		user.setLastName("haggar2");
		user.setEmail("hh@gmail.com");
		user.setContactNumber("1234543");
		user.setRole("USER");
		user.setPassword("4745654345");
		
		// add user
		assertEquals("Failed to add user!", true, userDAO.addUser(user));
		
		
		address = new Address();
		address.setAddressLineOne("ndj, tchad");
		address.setAddessLineTwo("mdou, tchad");
		address.setCity("Ndj");
		address.setArea("diguel");
		address.setCodePostal("7876576");
		address.setBilling(true);
		
		// link the user with the address
		address.setUserId(user.getId());
		
		
		// add user
		assertEquals("Failed to add the address!", true, userDAO.addAddress(address));
		
		if(user.getRole().equals("USER")) {
			
			//create a cart for this user
			cart = new Cart();
			cart.setUser(user);
			
			// add the cart
			assertEquals("Failed to add the cart!", true, userDAO.addCart(cart));
			
			// add a shipping address for this user
			
			address = new Address();
			address.setAddressLineOne("ndj, tchad");
			address.setAddessLineTwo("mdou, tchad");
			address.setCity("Ndj");
			address.setArea("diguel");
			address.setCodePostal("7876576");
			address.setChipping(true);
			
			// link it with the user
			address.setUserId(user.getId());
			
			assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
		}
		
		
	}
*/
	
/*	@Test
	public void testAdd() {
		
		user = new User();
		user.setFirstName("haggar1");
		user.setLastName("haggar2");
		user.setEmail("hh@gmail.com");
		user.setContactNumber("1234543");
		user.setRole("USER");
		user.setPassword("4745654345");
		
		
		if(user.getRole().equals("USER")) {
			
			//create a cart for this user
			cart = new Cart();
			cart.setUser(user);
			
			// attach cart with the user
			user.setCart(cart);
			
		}
		
		// add user
		assertEquals("Failed to add user!", true, userDAO.addUser(user));
	}*/
	 
	/*@Test
	public void testUpdateCart() {
		// fetch user by email
		
		user = userDAO.getByEmail("hh@gmail.com");
		
		cart = user.getCart();
		
		cart.setGrandTotal(5555);
		
		cart.setCarteLine(2);
		
		assertEquals("Failed to update the cart", true, userDAO.updateCart(cart));
		
	}*/
	
	/*@Test
	public void testAddAddress() {
		
		// add user
		user = new User();
		user.setFirstName("haggar1");
		user.setLastName("haggar2");
		user.setEmail("hh@gmail.com");
		user.setContactNumber("1234543");
		user.setRole("USER");
		user.setPassword("4745654345");
		
		// add user
		assertEquals("Failed to add user!", true, userDAO.addUser(user));
		
		
		
		
		// add address
		
		address = new Address();
		address.setAddressLineOne("ndj, tchad");
		address.setAddessLineTwo("mdou, tchad");
		address.setCity("Ndj");
		address.setArea("diguel");
		address.setCodePostal("7876576");
		address.setBilling(true);
		
		// attache the user to the address
		
		address.setUser(user);
		
		assertEquals("Failed to add user!", true, userDAO.addAddress(address));
		
		
		// add shipping address
		
		address = new Address();
		address.setAddressLineOne("ndj, tchad");
		address.setAddessLineTwo("mdou, tchad");
		address.setCity("Ndj");
		address.setArea("diguel");
		address.setCodePostal("7876576");
		address.setChipping(true);
		
		address.setUser(user);
		
		assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
		
		
	}*/
	
	
	/*@Test
	public void testAddAddress() {
		
		user = userDAO.getByEmail("hh@gmail.com");

		address = new Address();
		address.setAddressLineOne("Sarh, tchad");
		address.setAddessLineTwo("mdou, tchad");
		address.setCity("Ndj");
		address.setArea("50 m");
		address.setCodePostal("7876576");
		address.setBilling(true);
		
		// attache the user to the address
		
		address.setUser(user);
		
		assertEquals("Failed to add user!", true, userDAO.addAddress(address));
		
	}*/
	
	@Test
	public void testGetAddresses() {
		
		user = userDAO.getByEmail("hh@gmail.com");
		
		assertEquals("Failed to fetch the list of address!", 0, 
				userDAO.listShippingAddresses(user).size());
		
		
		assertEquals("Failed to fetch the list of billing address!", "Ndj", 
				userDAO.getBillingAddress(user).getCity());
		
	}

	
}
