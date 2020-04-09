package com.haggar.eshopBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.haggar.eshopBackend.dao.ProductDAO;
import com.haggar.eshopBackend.dto.Product;


@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	//Single
	@Override
	public Product get(int productId) {
		try {
			
			return sessionFactory
						.getCurrentSession()
							.get(Product.class, Integer.valueOf(productId));
			
		} catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return null;
	}
	
	// List \\
	@Override
	public List<Product> list() {
		return sessionFactory
					.getCurrentSession()
						.createQuery("FROM Product", Product.class)
							.getResultList();
		
	}

	
	//Insert\\
	@Override
	public boolean add(Product product) {
		try {
			
			sessionFactory
				.getCurrentSession()
					.persist(product);
			
			return true;
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		return false;
	}
	
	//Update\\
	@Override
	public boolean update(Product product) {
		try {
			
			sessionFactory
					.getCurrentSession()
							.update(product);
			
			return true;
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		return false;
	}
	
	
	//Delete\\
	@Override
	public boolean delete(Product product) {
		try {
			
			product.setActivate(false);
			// call update method
			
			return this.update(product);
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		return false;
	}

	@Override
	public List<Product> listActiveProducts() {
		
		String selectActiveProducts = "FROM Product WHERE activate = :activate";
		
		return sessionFactory
					.getCurrentSession()
							.createQuery(selectActiveProducts, Product.class)
									.setParameter("activate", true)
											.getResultList();
		
		
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		
		String selectActiveProductsByCategory = "FROM Product WHERE activate = :activate AND categoryId = :categoryId";
		
		return sessionFactory
					.getCurrentSession()
							.createQuery(selectActiveProductsByCategory, Product.class)
									.setParameter("activate", true)
											.setParameter("categoryId", categoryId)
													.getResultList();
	}

	@Override
	public List<Product> getLatestActivateProducts(int count) {
		
		return sessionFactory
				.getCurrentSession()
						.createQuery("FROM Product WHERE activate = :activate ORDER BY id", Product.class)
								.setParameter("activate", true)
										.setFirstResult(0)
												.setMaxResults(count)
														.getResultList();
		
	}



}
