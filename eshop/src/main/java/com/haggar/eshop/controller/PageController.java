package com.haggar.eshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.haggar.eshop.exception.ProductNotFoundException;
import com.haggar.eshopBackend.dao.CategoryDAO;
import com.haggar.eshopBackend.dao.ProductDAO;
import com.haggar.eshopBackend.dto.Category;
import com.haggar.eshopBackend.dto.Product;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping( value = {"/", "/index", "/home"})
	public ModelAndView index() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Accueil");
		
		// logger
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - INFO");
		//------
		
		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickHome", true);		
		return mv;	
	}
	
	@RequestMapping( value = {"/about"})
	public ModelAndView about() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "A propos de nous");
		mv.addObject("userClickAbout", true);		
		return mv;	
	}
	
	@RequestMapping(value = {"/contact"})
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact");
		mv.addObject("userClickContact", true);		
		return mv;
	}
	
	@RequestMapping( value = {"/show/all/products"})
	public ModelAndView showAllProducts() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Nos produits");
		
		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickAllProducts", true);		
		return mv;	
	}
	
	
	@RequestMapping( value = {"/show/category/{id}/products"})
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		
		ModelAndView mv = new ModelAndView("page");
		
		// fetching a single product
		Category category = null;
		
		category = categoryDAO.get(id);
		
		mv.addObject("title", category.getName());
		
		// passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		// passing the single category object
		
		mv.addObject("category", category);
		
		
		mv.addObject("userClickCategorylProducts", true);		
		return mv;	
	}
	
	
	// View single product
	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		
		//Exception
		if(product == null ) throw new ProductNotFoundException();
		
		
		// update the view count
		product.setViews(product.getViews() +1);
		productDAO.update(product);
		//-------
		
		
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct", true);
		
		
		
		return mv;
		
	}
	
	
	@RequestMapping( value = {"/register"})
	public ModelAndView register() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Register");		
		return mv;	
	}
	
	
	@RequestMapping( value = {"/login"})
	public ModelAndView login(@RequestParam(name="error", required = false)String error, 
			@RequestParam(name="logout", required= false) String logout
			) {
		
		ModelAndView mv = new ModelAndView("login");
		
		if(error!=null) {
			mv.addObject("message", "Invalid username and password!");
		}
		
		if(error!=null) {
			mv.addObject("logout", "Successfully logout!");
		}
		
		mv.addObject("title", "Login");		
		return mv;	
	}
	
	@RequestMapping( value = {"/access-denied"})
	public ModelAndView accessDenied() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "Not Access");	
		mv.addObject("errorTitle", "Not Access");	
		mv.addObject("errorDescription", "Not Access");	
		return mv;	
	}
	
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth!=null) {
			
			new SecurityContextLogoutHandler().logout(request, response, auth);
			
		}

		return "redirect:/login?logout";
	}
	
}
