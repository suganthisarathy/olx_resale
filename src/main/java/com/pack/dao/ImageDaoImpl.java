package com.pack.dao;

import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.MultipartFile;

import com.pack.form.Item;
//import com.pack.form.example;

public class ImageDaoImpl implements ImageDao {
	private JdbcTemplate jdbcTemplate;

	public ImageDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertRecords(String itemname, String category, Integer yearsofusage, MultipartFile image)
			throws IOException {
		// TODO Auto-generated method stub
		byte[] imagebytes = image.getBytes();
		String sql = "INSERT INTO EXAMPLE(ITEMNAME,CATEGORY,YEARSOFUSAGE,IMAGE) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { itemname, category, yearsofusage, imagebytes });
	}

	/*
	 * @Override public List<example> itemList() { // TODO Auto-generated method
	 * stub List<example> list = jdbcTemplate.query("SELECT * FROM example", new
	 * RowMapper<example>() {
	 * 
	 * @Override public example mapRow(ResultSet rs, int rowNum) throws SQLException
	 * { example ex = new example(); ex.setItemname(rs.getString("itemname"));
	 * ex.setCategoryname(rs.getString("category"));
	 * ex.setYearsofusage(rs.getInt("yearsofusage")); return ex; } });
	 * 
	 * return list; }
	 */

	@Override
	public Blob getPhotoByName(String itemname) {
		// TODO Auto-generated method stub
		String query = "select image from example where itemname=?";
		Blob photo = jdbcTemplate.queryForObject(query, new Object[] { itemname }, Blob.class);
		return photo;
	}

	@Override
	public int fetchCategoryid(String categoryname) {
		// TODO Auto-generated method stub
		String query = "select categoryid from category where categoryname=?";
		int categoryid = jdbcTemplate.queryForInt(query, new Object[] { categoryname });
		return categoryid;
	}

	@Override
	public void insertItem(String itemname, int categoryid, Float price, Integer yearsofusage, int itemid,
			MultipartFile image, int userid,String description) throws IOException {
		// TODO Auto-generated method stub
		byte[] imagebytes = image.getBytes();
		String sql = "INSERT INTO ITEM(ITEMNAME,CATEGORYID,PRICE,YEARSOFUSAGE,ITEMID,ITEMIMAGE,USERID,DESCRIPTION) VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,
				new Object[] { itemname, categoryid, price, yearsofusage, itemid, imagebytes, userid ,description});
	}

	@Override
	public List<Item> fetchItemList() {
		// TODO Auto-generated method stub
		List<Item> list = jdbcTemplate.query("SELECT * FROM item", new RowMapper<Item>() {

			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item i = new Item();
				i.setItemname(rs.getString("itemname"));
				i.setCategoryid(rs.getInt("categoryid"));
				i.setPrice(rs.getFloat("price"));
				i.setYearsofusage(rs.getInt("yearsofusage"));
				i.setItemid(rs.getInt("itemid"));
				i.setUserId(rs.getInt("userid"));
				i.setDescription(rs.getString("description"));
				return i;
			}
		});
		return list;
	}

	@Override
	public Blob getImageById(Integer itemid) {
		// TODO Auto-generated method stub
		String query = "select itemimage from item where itemid=?";
		Blob photo = jdbcTemplate.queryForObject(query, new Object[] { itemid }, Blob.class);
		return photo;
	}

	@Override
	public List<String> gatherCategory() {
		// TODO Auto-generated method stub
		List<String> list = jdbcTemplate.query("SELECT categoryname FROM category", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("categoryname");
			}
		});
		return list;
	}

	@Override
	public Item getItemDetails(Integer itemid) {
		// TODO Auto-generated method stub
		List<Item> list = jdbcTemplate.query("select * from item where itemid="+itemid, new RowMapper<Item>() {

			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item i = new Item();
				i.setItemname(rs.getString("itemname"));
				i.setCategoryid(rs.getInt("categoryid"));
				i.setPrice(rs.getFloat("price"));
				i.setYearsofusage(rs.getInt("yearsofusage"));
				i.setItemid(rs.getInt("itemid"));
				i.setUserId(rs.getInt("userid"));
				i.setDescription(rs.getString("description"));
				System.out.println(i.getItemname());
				System.out.println(i.getItemid());
				return i;
			}
		});
		return list.get(0);
	}

	@Override
	public List<Item> getmyads(int userid) {
		// TODO Auto-generated method stub
		List<Item> list = jdbcTemplate.query("SELECT * FROM item where userid="+userid, new RowMapper<Item>() {

			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item i = new Item();
				i.setItemname(rs.getString("itemname"));
				i.setCategoryid(rs.getInt("categoryid"));
				i.setPrice(rs.getFloat("price"));
				i.setYearsofusage(rs.getInt("yearsofusage"));
				i.setItemid(rs.getInt("itemid"));
				i.setUserId(rs.getInt("userid"));
				i.setDescription(rs.getString("description"));
				return i;
			}
		});
		return list;
		
	}

	@Override
	public int removeItemDetails(Integer itemid) {
		// TODO Auto-generated method stub
		String sql = "delete from item where itemid=?";
		int item=jdbcTemplate.update(sql,
				new Object[] { itemid});
		return item;
	}

}
