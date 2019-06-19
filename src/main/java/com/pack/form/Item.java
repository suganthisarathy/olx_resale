package com.pack.form;

public class Item {
	private String itemname;
	private int categoryid;
	private float price;
	private int yearsofusage;
	private int itemid;
	private int userId;
	private String description;
	
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Item(String itemname, int categoryid, float price, int yearsofusage, int itemid, int userId,
			String description) {
		super();
		this.itemname = itemname;
		this.categoryid = categoryid;
		this.price = price;
		this.yearsofusage = yearsofusage;
		this.itemid = itemid;
		this.userId = userId;
		this.description = description;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getYearsofusage() {
		return yearsofusage;
	}

	public void setYearsofusage(int yearsofusage) {
		this.yearsofusage = yearsofusage;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
