package com.haggar.eshopBackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.haggar.eshopBackend.dao.ProductDAO;
import com.haggar.eshopBackend.dto.Product;

public class ProductTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static ProductDAO productDAO;
	
	private Product product;
	
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("com.haggar.eshopBackend");
		context.refresh();
		productDAO = (ProductDAO)context.getBean("productDAO");
		
	}
	
	
/*	@Test
	public void testCRUDProduct() {
		
		// Create operation
		product = new Product();
		
		product.setName("Oppo taiwan");
		product.setBrand("Oppo");
		product.setDescription("Some description for oppo.");
		product.setUnitPrice(2000);
		product.setActivate(true);
		product.setCategoryId(3);
		product.setSupplierId(3);
		
		assertEquals("Not ok to insert the product", true, productDAO.add(product));
		
		
		// reading and updating the category
		product = productDAO.get(2);
		product.setName("Samsung");
		
		
		assertEquals("Not ok for updating", true, productDAO.update(product));
		
		
		assertEquals("Not ok for deleting", true, productDAO.delete(product));
		
		
		
		assertEquals("Not ok for fetching the product on list", 6, productDAO.list().size());
		
		
	}*/
	
	@Test 
	public void testListActivateProduct() {
		
		assertEquals("Not ok for fetching the product in list active product", 0, productDAO.listActiveProducts().size());
		
	}
	
	
	@Test 
	public void testListActivateProductsByCategory() {
		
		assertEquals("Not ok for fetching the product in list active product by category ", 0, productDAO.listActiveProductsByCategory(3).size());
		
		assertEquals("Not ok for fetching the product in list active product by category", 0, productDAO.listActiveProductsByCategory(1).size());
		
	}

	
	@Test 
	public void testGetLatestActivateProducts() {
		
		assertEquals("Not ok for fetching the latest products ", 0, productDAO.getLatestActivateProducts(3).size());
		
	}
	 
}
