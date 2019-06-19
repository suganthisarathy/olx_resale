package com.pack;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pack.form.Item;
import com.pack.form.User;
//import com.pack.form.example;
import com.pack.service.ImageService;

@Controller
public class ImageController {
	@Autowired(required = true)
	@Qualifier(value = "imageService")
	ImageService imageService;
	List<Item> list = new ArrayList();

	@RequestMapping(value = "/insertimage", method = RequestMethod.POST)
	public ModelAndView save(@RequestParam(required = false, value = "itemname") String itemname,
			@RequestParam(required = false, value = "categoryname") String categoryname,
			@RequestParam(required = false, value = "yearsofusage") Integer yearsofusage,
			@RequestParam(required = false, value = "image") MultipartFile image) {

		try {
			imageService.insertRecords(itemname, categoryname, yearsofusage, image);
			System.out.println("inside image controller");
			return new ModelAndView("example", "msg", "Records succesfully inserted into database.");

		} catch (Exception e) {
			return new ModelAndView("example", "msg", "Error: " + e.getMessage());
		}
	}

	/*
	 * @RequestMapping(value = "/fetch") public ModelAndView
	 * listStudent(ModelAndView model) throws IOException {
	 * 
	 * List<example> imagelist = imageService.itemList();
	 * 
	 * model.addObject("imagelist", imagelist); model.setViewName("index");
	 * 
	 * return model; }
	 */

	@RequestMapping(value = "/getStudentPhoto/{itemname}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("itemname") String itemname)
			throws Exception {
		response.setContentType("image/jpeg");

		Blob ph = imageService.getPhotoByName(itemname);

		byte[] bytes = ph.getBytes(1, (int) ph.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@RequestMapping(value = "/additem", method = RequestMethod.POST)
	public ModelAndView postItem(@RequestParam(required = false, value = "itemname") String itemname,
			@RequestParam(required = false, value = "categoryname") String categoryname,
			@RequestParam(required = false, value = "price") Float price,
			@RequestParam(required = false, value = "yearsofusage") Integer yearsofusage,
			@RequestParam(required = false, value = "image") MultipartFile image,
			@RequestParam(required = false, value = "description") String description, HttpSession session) {
		try {
			System.out.println("Inside post item method");
			int userid = (int) session.getAttribute("userid");
			System.out.println(userid);
			int categoryid = imageService.fetchCategoryid(categoryname);
			System.out.println("The fetched category id is" + categoryid);
			Random r = new Random();
			int itemid = r.nextInt(999) + 100;
			imageService.insertItem(itemname, categoryid, price, yearsofusage, itemid, image, userid, description);
			System.out.println("inside image controller");
			List<Item> itemslist = imageService.fetchItemList();
			session.setAttribute("itemslist", itemslist);
			System.out.println("after fetch item list");
			return new ModelAndView("afterlogin", "msg", "Records succesfully inserted into database.");

		} catch (Exception e) {
			return new ModelAndView("sell", "msg", "Error: " + e.getMessage());
		}
	}

	@RequestMapping(value = "/getItemImage/{itemid}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("itemid") Integer itemid) throws Exception {
		response.setContentType("image/jpeg");

		Blob ph = imageService.getImageById(itemid);

		byte[] bytes = ph.getBytes(1, (int) ph.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@RequestMapping(value = "/collectitem")
	public String collectitem(HttpServletRequest request) {
		List<Item> itemslist = imageService.fetchItemList();
		request.setAttribute("items", itemslist);
		return "homepage";
	}

	@RequestMapping(value = "/inter")
	public String collectitemforafterlogin(HttpSession session) {
		List<Item> itemslist = imageService.fetchItemList();
		session.setAttribute("itemslist", itemslist);
		return "afterlogin";
	}

	@RequestMapping(value = "/sell")
	public String postAd(HttpSession session) {
		List<String> list = imageService.gatherCategory();
		session.setAttribute("categoryname", list);
		return "sell";
	}

	@RequestMapping(value = "/itempage/{itemid}")
	public String getSingleItem(HttpSession session, @PathVariable("itemid") Integer itemid) {
		Item item = imageService.getItemDetails(itemid);
		session.setAttribute("singleitem", item);
		return "index2";
	}

	@RequestMapping(value = "/cart/{itemid}")
	public String addToCart(HttpSession session, @PathVariable("itemid") Integer itemid) {
		Item item = imageService.getItemDetails(itemid);
		list.add(item);
		session.setAttribute("cartitemlist", list);
		return "intermediate";
	}

	@RequestMapping(value = "/cartpage")
	public String cartPage() {
		return "cart";
	}

	@RequestMapping(value = "/removefromcart/{itemid}")
	public String removeFromCart(HttpSession session, @PathVariable("itemid") Integer itemid) {
		Item item = imageService.getItemDetails(itemid);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getItemid() == item.getItemid()) {
				list.remove(i);
			}
		}
		session.setAttribute("cartitemlist", list);
		return "index3";
	}
	
	@RequestMapping(value = "/myadspage")
	public String myAdsPage(HttpSession session) {
		int userid=(int)session.getAttribute("userid");
		List<Item>myadslist=imageService.getmyads(userid);
		session.setAttribute("myads", myadslist);
		return "myads";
	}

	
	@RequestMapping(value = "/removemyads/{itemid}")
	public String removeMyAds(HttpSession session,@PathVariable("itemid") Integer itemid) {
		int item = imageService.removeItemDetails(itemid);
		return "index5";
	}
}
