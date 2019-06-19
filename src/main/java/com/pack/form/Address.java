package com.pack.form;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Address", schema = "OLXResale")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int addressid;
	private String city;
	private String sublocation;
	private String state;
	private String pincode;
	private String country;
	private String street;

	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Address(int addressid, String city, String sublocation, String state, String pincode, String country,
			String street) {
		super();
		this.addressid = addressid;
		this.city = city;
		this.sublocation = sublocation;
		this.state = state;
		this.pincode = pincode;
		this.country = country;
		this.street = street;
	}

	public Address(String city, String sublocation, String state, String pincode, String country, String street) {
		super();
		this.city = city;
		this.sublocation = sublocation;
		this.state = state;
		this.pincode = pincode;
		this.country = country;
		this.street = street;
	}

	public int getAddressid() {
		return addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSublocation() {
		return sublocation;
	}

	public void setSublocation(String sublocation) {
		this.sublocation = sublocation;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
}
