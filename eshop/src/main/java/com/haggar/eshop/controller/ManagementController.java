package com.haggar.eshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.haggar.eshop.util.FileUploadUtility;
import com.haggar.eshop.validator.ProductValidator;
import com.haggar.eshopBackend.dao.CategoryDAO;
import com.haggar.eshopBackend.dao.ProductDAO;
import com.haggar.eshopBackend.dto.Category;
import com.haggar.eshopBackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;

	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation", required=false) String operation) {
		
		ModelAndView mv = new ModelAndView("page");
		
		
		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Ajouter produits");
		Product nProduct = new Product();
		
		// set few of the fields  // create new product
		nProduct.setSupplierId(1);
		nProduct.setActivate(true);
		
		
		mv.addObject("product", nProduct);
		
		
		if(operation!=null) {
			
			if(operation.equals("product")) {
				
				mv.addObject("message", "succes");
				
			}
			else if(operation.equals("category")) {
				
				mv.addObject("message", "Category successfully submitted");
				
			}
			
		}
		
		return mv;
		
	}
	
	@RequestMapping(value="/{id}/product", method=RequestMethod.GET)
	public ModelAndView showEditProducts(@PathVariable int id) {
		
		ModelAndView mv = new ModelAndView("page");
		
		
		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Ajouter produits");
		
		// Fetch the product from database
		Product nProduct = productDAO.get(id);
		
		// set the product fetch from database
		mv.addObject("product", nProduct);
		
		
		return mv;
		
	}
	
	
	// submission for new products
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public String handlerProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, 
			Model model, HttpServletRequest requests) {
		
		// image validation for new product
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		}
		else {
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results); 
			}
		}
			
		
		
		// looking for errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage products");
			model.addAttribute("message", "Product submission failed");
			
			return "page";
		}
		
		
		logger.info(mProduct.toString());
		
		// create a new product record if id is 0
		if(mProduct.getId() == 0) {
			
			productDAO.add(mProduct);
		}
		else {
			// if id is not 0
			productDAO.update(mProduct);
		}
		
		
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			
			FileUploadUtility.uploadFile(requests, mProduct.getFile(), mProduct.getCode());
			
		}
		
		return "redirect:/manage/products?operation=product";
		
	}
	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handlerProductActivation(@PathVariable int id) {
		
		//  fetch the product in database
		Product product = productDAO.get(id);
		boolean isActive = product.isActivate();
		
		// activating and deactivating based on the value of active field
		product.setActivate(!product.isActivate());
		
		// updating the product
		productDAO.update(product);
		
		return (isActive)? 
				"You have succesflly deactivated the  product with id " +product.getId()
				: "You have succesflly activated the  product with id " +product.getId();
	}
	
	// category submission
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		
		// add a new category
		categoryDAO.add(category);
		
		return "redirect:/manage/products?operation=category";
	}
	
	
	
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category getCategory() {
		
		return new Category();
	}
	
	

}
