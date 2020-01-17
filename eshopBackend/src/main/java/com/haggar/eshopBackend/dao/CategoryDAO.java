package com.haggar.eshopBackend.dao;

import java.util.List;

import com.haggar.eshopBackend.dto.Category;

public interface CategoryDAO {
	
	
	List<Category> list();

	Category get(int id);

	boolean add(Category category);

	boolean update(Category category);
	
	boolean delete(Category category);
}
