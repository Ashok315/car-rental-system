package com.springmvctest.controller;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springmvctest.model.Cars;
import com.springmvctest.model.User;
import com.springmvctest.process.AllProcess;
import com.springmvctest.process.Change;
import com.springmvctest.process.ContactDetail;
import com.springmvctest.process.UserData;

@Controller
public class CarController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView loadHome(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		AllProcess process = new AllProcess();
		List<Cars> allCars = process.getAllCarDetails();
		
		List<Cars> cars = new ArrayList<Cars>();
	    cars.addAll(allCars);
		
		return new ModelAndView("index", "cars", cars);
	}
	
	@RequestMapping(value = "/About", method = RequestMethod.GET)
	public ModelAndView loadAbout(HttpServletRequest req, HttpServletResponse res) {
		return new ModelAndView("about");
	}
	
	@RequestMapping(value = "/Pricing", method = RequestMethod.GET)
	public ModelAndView loadPricing(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		AllProcess process = new AllProcess();
		List<Cars> cars = process.getAllCarDetails();
		return new ModelAndView("pricing", "cars", cars);
	}
	
	@RequestMapping(value = "/Car", method = RequestMethod.GET)
	public ModelAndView loadCar(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		AllProcess process = new AllProcess();
		List<Cars> cars = process.getAllCarDetails();
		
		return new ModelAndView("car", "cars", cars);
	}
	
	@RequestMapping(value = "/Car/{CarId}", method = RequestMethod.GET)
	public ModelAndView loadcarDetail(@PathVariable(value="CarId") String carId, HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		AllProcess process = new AllProcess();
		Cars car = process.getCarDetails(carId);
		if(car == null)
			return new ModelAndView("error-404");
		else
			return new ModelAndView("car-single", "car", car);
	}
	
	@RequestMapping(value = "/Car/{CarId}/Registration", method = RequestMethod.GET)
	public ModelAndView loadcarRegistrationDirect(@PathVariable(value="CarId") String carId, HttpServletRequest req, HttpServletResponse res) {
		return new ModelAndView("redirect:/Car/" + carId);
	}

	@RequestMapping(value = "/Car/{CarId}/Registration", method = RequestMethod.POST)
	public ModelAndView loadcarRegistration(@PathVariable(value="CarId") String carId, HttpServletRequest req, HttpServletResponse res) {
		UserData user = new UserData();
		AllProcess process = new AllProcess();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("carBook");
		mv.addObject("user", user.getData(Integer.parseInt(req.getSession().getAttribute("userId").toString())));
		mv.addObject("car", process.getCarDetails(carId));
		mv.addObject("address", process.getAllCity());
		return mv;
	}

	@RequestMapping(value = "/Car/{CarId}/Registration/Submit", method = RequestMethod.POST)
	public ModelAndView loadcarRegistrationSubmit(@PathVariable(value="CarId") String carId, HttpServletRequest req, HttpServletResponse res, RedirectAttributes ra) {
		AllProcess process = new AllProcess();
		if(process.carReservation(req, Integer.parseInt(carId)))
			ra.addFlashAttribute("reservation", "YES");
		return new ModelAndView("redirect:/Profile");
	}
	
	@RequestMapping(value = "/Contact", method = RequestMethod.GET)
	public ModelAndView loadContact(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact");
		if(session.getAttribute("userId") != null) {
			UserData userData = new UserData();
			User user = userData.getData((int) session.getAttribute("userId"));
			mv.addObject("userData", user);
		} 
		return mv;
	}
	
	@RequestMapping(value = "/Contact/Submit", method = RequestMethod.POST)
	public ModelAndView loadContactSubmit(HttpServletRequest req, HttpServletResponse res) {
		ContactDetail contact = new ContactDetail();
		contact.submitData(req);
		return new ModelAndView("redirect:/Contact");
	}
	
	@RequestMapping(value = "/Profile", method = RequestMethod.GET)
	public ModelAndView loadProfile(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null) {
			UserData userData = new UserData();
			int userId = Integer.parseInt(session.getAttribute("userId").toString());
			User user = userData.getData(userId);
			AllProcess process = new AllProcess();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("profile");
			mv.addObject("userData", user);
			mv.addObject("reservations", process.getReservationById(userId));
			mv.addObject("city", process.getAllCity());
			mv.addObject("process", process);
			return mv;
		} else {	
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value = "/Profile/ChangeProfile/", method = RequestMethod.POST)
	public ModelAndView loadProfileChange(@RequestParam("profile") MultipartFile file, HttpServletRequest req, HttpServletResponse res, RedirectAttributes at) {
		Change ch = new Change();
		String status = ch.profileChange(req, file);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Profile/");
		if(status == "extension")
			at.addFlashAttribute("err", "extension");
		else if(status == "success")
			at.addFlashAttribute("err", "success");
		return mv;
	}

	@RequestMapping(value = "/Profile/ChangePassword/", method = RequestMethod.POST)
	public ModelAndView loadPasswordChange(HttpServletRequest req, HttpServletResponse res, RedirectAttributes at) {
		Change ch = new Change();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Profile/");
		if(ch.passwordChange(req)) {
			at.addFlashAttribute("msg", "success");
		} else {
			at.addFlashAttribute("msg", "error");
		}
		return mv;
	}

	@RequestMapping(value = "/Error-404", method = RequestMethod.GET)
	public ModelAndView loadError() {
		return new ModelAndView("error404");
	}

	
}
