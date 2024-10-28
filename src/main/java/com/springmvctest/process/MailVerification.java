package com.springmvctest.process;


import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
/*import javax.mail.Authenticator;*/
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.springmvctest.model.SignUp;

public class MailVerification {
	public void sendOtp(SignUp signUp, HttpServletRequest req) {
		String from = "ashokpateliya315@gmail.com";
		String password = "bcfq rxko lpnb dese";
		String subject = "OTP Verification for Sign Up | Car Rental";


		Random rand = new Random();
		int otp = Integer.parseInt(String.format("%04d", rand.nextInt(10000)));
		HttpSession s = req.getSession();
		s.setAttribute("otp", otp);
		String body = "OTP : " + otp;
		
		Properties props = new Properties(); 

		
		 props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.socketFactory.port", "465");
		 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.port", "465");
		 
		/*
		 * props.put("mail.smtp.auth", "true"); props.put("mail.smtp.starttls.enable",
		 * "true"); props.put("mail.smtp.host", "smtp.gmail.com");
		 * props.put("mail.smtp.port", "587");
		 */
        
        
	    Session mailSession = Session.getInstance(props,    
	     	new Authenticator() {    
	     	protected PasswordAuthentication getPasswordAuthentication() { 
	     		return new PasswordAuthentication(from, password);  
	     	}    
	    });       
	    try {    
	    	MimeMessage message = new MimeMessage(mailSession);  
	    	message.setFrom(new InternetAddress(from));
	    	message.addRecipient(Message.RecipientType.TO, new InternetAddress(signUp.getEmail()));    
	    	message.setSubject(subject);    
	    	message.setText(body);
	    	Transport.send(message);
	    }
	    catch (MessagingException e) {
	    	e.printStackTrace();
	    }  
	
	}

}
