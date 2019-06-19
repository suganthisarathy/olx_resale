package com.pack.service;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pack.form.Item;
import com.pack.form.User;

public interface ImageService {
	public int insertRecords(String itemname,String category,Integer yearsofusage , MultipartFile image) throws IOException;
	//public List<example> itemList();
	public Blob getPhotoByName(String itemname);
	public int fetchCategoryid(String categoryname);
	public void insertItem(String itemname, int categoryid, Float price, Integer yearsofusage, int itemid,
			MultipartFile image, int userid, String description) throws IOException;
	public List<Item> fetchItemList();
	public Blob getImageById(Integer itemid);
	public List<String> gatherCategory();
	public Item getItemDetails(Integer itemid);
	public List<Item> getmyads(int userid);
	public int removeItemDetails(Integer itemid);
}
