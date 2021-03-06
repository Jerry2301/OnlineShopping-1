package com.os.controller;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.os.dao.HomeDao;
import com.os.dao.UserDao;
import com.os.model.Category;
import com.os.model.Login;
import com.os.model.Product;
import com.os.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao udao;
	
	@Autowired
	HomeDao hdao;
	
	//Save user data to DB
	@RequestMapping("/saveUser")
	public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response, @ModelAttribute User u) {

		int i=udao.saveData(u);		
		return new ModelAndView("login");
	}

	//Validate Login and Create Session
	@RequestMapping("/userLogin")
	public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Login l, Model model) {
		boolean log = udao.validateUser(l);
		if(log) {
			List<User> lst = new LinkedList<User>();
			lst = udao.getAllUsers();
			for(User r:lst) {
				if(r.getGu_email().equalsIgnoreCase(l.getGu_email())) {
					//CREATES SESSION FOR USERNAME
					HttpSession session = request.getSession();
					session.setAttribute("user_id",r.getPk_g11_users());
					session.setAttribute("user_name",r.getGu_name());
					List<Category> clist = new LinkedList<Category>();
					List<Product> plist = new LinkedList<Product>();
					clist = hdao.getAllCategory();
					plist = hdao.getLatestProducts();
					ModelAndView map = new ModelAndView("display");
					map.addObject("Category",clist);
					map.addObject("Product", plist);
					return(map);
				}
			}
		}
		return new ModelAndView("login");
	}
	
	@RequestMapping("/redirectLogin")
	public ModelAndView returnLogin() {
		return new ModelAndView("login");
	}
	//Display product using get and session
	@RequestMapping("/redirectDisplay")
	public ModelAndView redirectDisplay() {
		List<Category> clist = new LinkedList<Category>();
		List<Product> plist = new LinkedList<Product>();
		clist = hdao.getAllCategory();
		plist = hdao.getLatestProducts();
		ModelAndView map = new ModelAndView("display");
		map.addObject("Category",clist);
		map.addObject("Product", plist);
		return map;
	}
	//Logout
	@RequestMapping("/redirectLogout")
	public ModelAndView returnLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.removeAttribute("user_name");
		session.removeAttribute("user_id");
		session.invalidate();		
		return new ModelAndView("logout");
	}
	
	@RequestMapping("/admin")
	public ModelAndView redirectAdmin() {
		return new ModelAndView("adminLogin");
	}
	
}
