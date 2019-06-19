package com.pack.dao;


import com.pack.form.Address;
import com.pack.form.Item;
import com.pack.form.User;

public interface UserDao {

	public void registerUser(User user);
	public int registerAddress(Address address);
	public User verifyUser(String email,String password);
	public void postAd(Item item);
	/*public List<Item> viewProduct(int userid);
	public int getCategoryId(String categoryname);
	public List<String> gatherCategory(); */
	public User getUserDetails(Integer userid);
}
