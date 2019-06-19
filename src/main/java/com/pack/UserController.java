package com.pack;

//import java.util.List;
import java.util.Map;
//import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pack.form.Address;
import com.pack.form.Item;
//import com.pack.form.Item;
import com.pack.form.User;
import com.pack.service.UserService;

@Controller
public class UserController {

	private UserService userService;

	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/index")
	public String displaySignup(Map<String, Object> map) {
		// map.put("user", new User());
		return "homepage";
	}

	/*@RequestMapping(value = "/user/example")
	public String checkExample() {
		return "example";
	}*/
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, HttpServletResponse response) {
		String city, sublocation, state, country, pincode, street;
		city = request.getParameter("city");
		sublocation = request.getParameter("sublocation");
		state = request.getParameter("state");
		country = request.getParameter("country");
		pincode = request.getParameter("pincode");
		street = request.getParameter("street");
		Address address = new Address(city, sublocation, state, pincode, country, street);
		userService.registerAddress(address);
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String contactnumber = request.getParameter("contactnumber");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = new User(firstname, lastname, age, gender, contactnumber, password, email, address);
		userService.registerUser(user);
		return "homepage";
	}

	/*@RequestMapping(value = "/user/login")
	public String displayLogin() {
		return "login";
	}*/

	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	public String verifyUser(HttpServletRequest request, HttpServletResponse response) {
		String email, password;
		email = request.getParameter("email");
		password = request.getParameter("password");
		User u = userService.verifyUser(email, password);
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("userid", u.getUserid());
			return "intermediate";
		}
		return "homepage";
	}


	/*@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String sellProduct(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String itemname, categoryname, image;
		int yearsofusage, userid;
		itemname = request.getParameter("itemname");
		categoryname = request.getParameter("categoryname");
		int categoryid = userService.getCategoryId(categoryname);
		yearsofusage = Integer.parseInt(request.getParameter("yearsofusage"));
		image = request.getParameter("image");
		userid = (int) session.getAttribute("userid");
		Random r = new Random();
		int itemid = r.nextInt(900) + 100;
		Item item = new Item(itemname, yearsofusage, categoryid, itemid, image, userid);
		userService.postAd(item);
		return "redirect:/index";
	}*/

	/*@RequestMapping(value = "/user/view", method = RequestMethod.POST)
	public String viewProduct(HttpSession session) {
		int userid = (int) session.getAttribute("userid");
		List<Item> list = userService.viewProduct(userid);
		session.setAttribute("itemlist", list);
		return "displayproduct";
	}*/
	@RequestMapping(value = "/page")
	public String getSingleUser(HttpSession session) {
		Item i = (Item) session.getAttribute("singleitem");
		User user=userService.getUserDetails(i.getUserId());
		session.setAttribute("singleuser",user);
		return "itempage";
	}
	
	@RequestMapping(value="/logout")
	public String logoutFun(HttpSession session)
	{
		session.invalidate();
		return "index4";
	}
}
