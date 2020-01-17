package com.haggar.eshopBackend.dao;

import java.util.List;

import com.haggar.eshopBackend.dto.Product;

public interface ProductDAO {
	
	List<Product> list();
	Product get(int productId);
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
	
	
	List<Product> listActiveProducts();
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> getLatestActivateProducts(int count);
	
	
}