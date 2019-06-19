package com.pack.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pack.form.Address;
import com.pack.form.Item;
import com.pack.form.User;

@Repository
public class UserDaoImpl implements UserDao {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void registerUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public int registerAddress(Address address) {
		// TODO Auto-generated method stub
		return (int) sessionFactory.getCurrentSession().save(address);
	}

	@Override
	public User verifyUser(String email, String password) {
		// TODO Auto-generated method stub
		Query q=sessionFactory.getCurrentSession().createQuery("from User where email=:email and password=:password");
		q.setParameter("email", email);
		q.setParameter("password", password);
		return (User)q.uniqueResult();
		//return u.getUserid();
	}

	@Override
	public void postAd(Item item) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(item);
	}

	@Override
	public User getUserDetails(Integer userid) {
		// TODO Auto-generated method stub
		Query q=sessionFactory.getCurrentSession().createQuery("from User where userid=:userid");
		q.setParameter("userid",userid);
		return (User)q.uniqueResult();
	}

	/*@Override
	public List<Item> viewProduct(int userid) {
		// TODO Auto-generated method stub
		Query q=sessionFactory.getCurrentSession().createQuery("from Item where userid=:userid");
		q.setParameter("userid", userid);
		List<Item>list=q.list();
		return list;
	}*/

	/*@Override
	public int getCategoryId(String categoryname) {
		// TODO Auto-generated method stub
		Query q=sessionFactory.getCurrentSession().createQuery("select categoryid from Category where categoryname=:categoryname");
		q.setParameter("categoryname", categoryname);
		return (int)q.uniqueResult();
	}*/

	/*@Override
	public List<String> gatherCategory() {
		// TODO Auto-generated method stub
		Query q=sessionFactory.getCurrentSession().createQuery("select categoryname from Category");
		List<String>list=q.list();
		System.out.println(list);
		return list;
	}*/

	

}
