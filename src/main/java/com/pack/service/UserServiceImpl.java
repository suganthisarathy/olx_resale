package com.pack.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pack.dao.UserDao;
import com.pack.form.Address;
import com.pack.form.Category;
import com.pack.form.Item;
import com.pack.form.User;
@Service
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	@Transactional
	public void registerUser(User user) {
		// TODO Auto-generated method stub
		userDao.registerUser(user);
	}


	@Override
	@Transactional
	public int registerAddress(Address address) {
		// TODO Auto-generated method stub
		return userDao.registerAddress(address);
	}


	@Override
	@Transactional
	public User verifyUser(String email, String password) {
		// TODO Auto-generated method stub
		return userDao.verifyUser(email,password);
	}


	@Override
	@Transactional
	public void postAd(Item item) {
		// TODO Auto-generated method stub
		userDao.postAd(item);
	}


	@Override
	@Transactional
	public User getUserDetails(Integer userid) {
		// TODO Auto-generated method stub
		return userDao.getUserDetails(userid);
	}


	/*@Override
	@Transactional
	public List<Item> viewProduct(int userid) {
		// TODO Auto-generated method stub
		return userDao.viewProduct(userid);
	}


	@Override
	@Transactional
	public int getCategoryId(String categoryname) {
		// TODO Auto-generated method stub
		return userDao.getCategoryId(categoryname);
	}


	@Override
	@Transactional
	public List<String> gatherCategory() {
		// TODO Auto-generated method stub
		return userDao.gatherCategory();
	}*/

}
