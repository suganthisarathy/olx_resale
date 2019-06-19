package com.pack.service;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pack.dao.ImageDao;
import com.pack.form.Item;
//import com.pack.form.example;
import com.pack.form.User;

public class ImageServiceImpl implements ImageService {
	private ImageDao imageDao;

	public void setImageDao(ImageDao imageDao) {
		this.imageDao = imageDao;
	}

	@Override
	@Transactional
	public int insertRecords(String itemname, String category, Integer yearsofusage, MultipartFile image)
			throws IOException {
		// TODO Auto-generated method stub
		return imageDao.insertRecords(itemname, category, yearsofusage, image);
	}

	/*@Override
	@Transactional
	public List<example> itemList() {
		// TODO Auto-generated method stub
		return imageDao.itemList();
	}*/

	@Override
	@Transactional
	public Blob getPhotoByName(String itemname) {
		// TODO Auto-generated method stub
		return imageDao.getPhotoByName(itemname);
	}

	@Override
	@Transactional
	public int fetchCategoryid(String categoryname) {
		// TODO Auto-generated method stub
		return imageDao.fetchCategoryid(categoryname);
	}

	@Override
	@Transactional
	public void insertItem(String itemname, int categoryid, Float price, Integer yearsofusage, int itemid,
			MultipartFile image, int userid,String description) throws IOException {
		// TODO Auto-generated method stub
		imageDao.insertItem(itemname, categoryid, price, yearsofusage, itemid, image, userid,description);
	}

	@Override
	@Transactional
	public List<Item> fetchItemList() {
		// TODO Auto-generated method stub
		return imageDao.fetchItemList();
	}

	@Override
	@Transactional
	public Blob getImageById(Integer itemid) {
		// TODO Auto-generated method stub
		return imageDao.getImageById(itemid);
	}

	@Override
	@Transactional
	public List<String> gatherCategory() {
		// TODO Auto-generated method stub
		return imageDao.gatherCategory();
	}

	@Override
	public Item getItemDetails(Integer itemid) {
		// TODO Auto-generated method stub
		 return imageDao.getItemDetails(itemid);
		
	}

	@Override
	public List<Item> getmyads(int userid) {
		// TODO Auto-generated method stub
		return imageDao.getmyads(userid);
	}

	@Override
	public int removeItemDetails(Integer itemid) {
		// TODO Auto-generated method stub
		return imageDao.removeItemDetails(itemid);
	}

	

	
}
