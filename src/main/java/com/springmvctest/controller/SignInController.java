package com.springmvctest.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvctest.model.SignIn;
import com.springmvctest.model.SignUp;
import com.springmvctest.process.MailVerification;
import com.springmvctest.process.SignInProcess;
import com.springmvctest.process.SignUpProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class SignInController {

	@RequestMapping(value = "/SignIn", method = RequestMethod.GET)
	public ModelAndView loadSignIn(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null) {
			return new ModelAndView("redirect:/");
		} else {
			mv.setViewName("signin");
			SignIn signIn = new SignIn();
			mv.addObject("SignIn", signIn);
			return mv;
		}
	}

	@RequestMapping(value = "/SignIn/Process", method = RequestMethod.GET)
	public String loadSignInProcess() {
		return new String("redirect:/SignIn");
	}
	
	@RequestMapping(value = "/SignIn/Process", method = RequestMethod.POST)
	public String loadSignInProcess(@ModelAttribute("SignIn") SignIn signIn, HttpServletRequest req, HttpServletResponse res, Model m) {
		SignInProcess signin = new SignInProcess();
		int userId = signin.signIn(signIn);
		if(userId != 0) {
			HttpSession session = req.getSession();
			session.setAttribute("userId", userId);
			return new String("redirect:/");
		} else {
			m.addAttribute("Err","Invalid");
			return new String("redirect:/SignIn");
		}
	}
	
	@RequestMapping(value = "/SignUp", method = RequestMethod.GET)
	public ModelAndView loadSignUp(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null) {
			return new ModelAndView("redirect:/");
		} else {
			mv.setViewName("signup");
			SignUp signUp = new SignUp();
			mv.addObject("SignUp", signUp);
			return mv;
		}
	}
	
	@RequestMapping(value = "/SignUp/Process", method = RequestMethod.GET)
	public String loadSignUpProcess(@ModelAttribute("SignUp") SignUp signUp, HttpServletRequest request, HttpServletResponse response) {
		return new String("redirect:/");
	}
	
	@RequestMapping(value = "/SignUp/Process", method = RequestMethod.POST)
	public String loadSignUpProcess(@ModelAttribute("SignUp") SignUp signUp, BindingResult result, HttpServletRequest req, HttpServletResponse res, Model m) {
		SignUpProcess s = new SignUpProcess();
		
		if(s.check(signUp)) {
			//email and contact are not exist
			HttpSession session = req.getSession();
			session.setAttribute("signUp", signUp);
			MailVerification mail = new MailVerification();
			mail.sendOtp(signUp, req);
			return new String("redirect:/SignUp/OtpVerification");
		} else {
			m.addAttribute("Err", "DataExist");
			return new String("redirect:/SignUp");
		}
	}
	
	@RequestMapping(value = "/SignUp/OtpVerification", method = RequestMethod.GET)
	public ModelAndView loadSignUpOtp(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		if(session.getAttribute("signUp") != null) {
			return new ModelAndView("otpVerify");
		} else {
	
			return new ModelAndView("redirect:/SignUp");
		}
	}
	
	@RequestMapping(value = "/SignUp/OtpVerifing", method = RequestMethod.POST)
	public ModelAndView loadSignUpOtpVerify(HttpServletRequest req, HttpServletResponse res) {
		int otp = Integer.parseInt(req.getParameter("otp"));
		HttpSession session = req.getSession();
		int sessionOtp = (int) session.getAttribute("otp");
		if(otp == sessionOtp) {
			SignUpProcess s = new SignUpProcess();
			int userId = s.newCreate(req);
			if(userId != 0) {
				session.removeAttribute("signUp");
				session.removeAttribute("otp");
				session.setAttribute("userId", userId);
			}
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("redirect:/SignUp/OtpVerification");
		}
	}
	
	@RequestMapping(value = "/SignOut", method = RequestMethod.GET)
	public String loadSignOut(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.invalidate();
		return new String("redirect:" + req.getHeader("Referer"));
	}
	
	
}

