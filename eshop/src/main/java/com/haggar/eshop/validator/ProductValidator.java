package com.haggar.eshop.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.haggar.eshopBackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Product product = (Product) target;
		
		// File selected or not
		if(product.getFile() == null ||
				product.getFile().getOriginalFilename().equals("")) {
			
			errors.rejectValue("file",null, "Selectionner une image pour joindre!");
			return;
		}
		
		if(! (
			  product.getFile().getContentType().equals("image/jpeg") ||
			  product.getFile().getContentType().equals("image/png") ||
			  product.getFile().getContentType().equals("image/jpg") ||
			  product.getFile().getContentType().equals("image/gif") 
			  )) {
			
			errors.rejectValue("file", null, "Respectez les normes des images!");
			return;
		}
		
	}

}
