package com.haggar.eshopBackend.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Address implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	// -----
	@ManyToOne
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	// ------
	
	


	@Column(name = "address_line_one")
	private String addressLineOne;
	
	@Column(name = "address_line_two")
	private String addessLineTwo;
	private String city;
	private String area;
	
	@Column(name = "code_postal")
	private String codePostal;
	private boolean billing;
	private boolean chipping;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddressLineOne() {
		return addressLineOne;
	}
	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}
	public String getAddessLineTwo() {
		return addessLineTwo;
	}
	public void setAddessLineTwo(String addessLineTwo) {
		this.addessLineTwo = addessLineTwo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	public boolean isBilling() {
		return billing;
	}
	public void setBilling(boolean billing) {
		this.billing = billing;
	}
	public boolean isChipping() {
		return chipping;
	}
	public void setChipping(boolean chipping) {
		this.chipping = chipping;
	}
	
	
	@Override
	public String toString() {
		return "Address [addressLineOne=" + addressLineOne + ", addessLineTwo=" + addessLineTwo
				+ ", city=" + city + ", area=" + area + ", codePostal=" + codePostal + ", billing=" + billing
				+ ", chipping=" + chipping + "]";
	}
	
	
	
	

}
