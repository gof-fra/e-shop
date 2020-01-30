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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		mv.addObject("title", "Manage products");
		Product nProduct = new Product();
		
		// set few of the fields  // create new product
		nProduct.setSupplierId(1);
		nProduct.setActivate(true);
		
		
		mv.addObject("product", nProduct);
		
		
		if(operation!=null) {
			
			if(operation.equals("product")) {
				
				mv.addObject("message", "Product successfully submitted");
				
			}
			
		}
		
		return mv;
		
	}
	
	
	// submission for new products
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public String handlerProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, 
			Model model, HttpServletRequest requests) {
		
		new ProductValidator().validate(mProduct, results);
		
		// looking for errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage products");
			model.addAttribute("message", "Product submission failed");
			
			return "page";
		}
		
		
		logger.info(mProduct.toString());
		
		// create a new product
		productDAO.add(mProduct);
		
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			
			FileUploadUtility.uploadFile(requests, mProduct.getFile(), mProduct.getCode());
			
		}
		
		return "redirect:/manage/products?operation=product";
		
	}
	
	
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		
		return categoryDAO.list();
	}

}
