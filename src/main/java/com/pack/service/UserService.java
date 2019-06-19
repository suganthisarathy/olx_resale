package com.pack.service;

import java.util.List;

import com.pack.form.Address;
import com.pack.form.Category;
import com.pack.form.Item;
import com.pack.form.User;


public interface UserService {
	public void registerUser(User user);
	public int registerAddress(Address address);
	public User verifyUser(String email,String password);
	public void postAd(Item item);
	/*public int getCategoryId(String categoryname);
	public List<Item> viewProduct(int userid);
	public List<String> gatherCategory();*/
	public User getUserDetails(Integer userid);
}
