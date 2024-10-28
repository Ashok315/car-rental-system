package com.springmvctest.process;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.UUID;
import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.web.multipart.MultipartFile;

import com.springmvctest.model.User;

public class Change {
	public String profileChange(HttpServletRequest req, MultipartFile file) {
		if(!file.isEmpty()) {
			try {
				String[] extensions = new String[]{"jpg", "png"};
				String fileExtension = file.getOriginalFilename().toString().split("\\.")[1];
				if(Arrays.asList(extensions).contains(fileExtension)) {
					//File upload
					/*
					 * String webPath = "/assets/images/Profile"; String filePath =
					 * req.getServletContext().getRealPath(webPath);
					 */
					String uploadDirectory = req.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"assets"+File.separator+"images"+File.separator+"Profile";
					byte[] bytes = file.getBytes();
					/* File dir = new File(filePath); */
					
			
		                File dir = new File(uploadDirectory);
						/* File dir = new File(uploadDirectory); */
					System.out.println(uploadDirectory);
					System.out.println(dir);
					if(!dir.exists())
						dir.mkdirs();
					
					HttpSession session = req.getSession();
					
					String userId = session.getAttribute("userId").toString();
					String fileName = UUID.randomUUID().toString() + "." + fileExtension;
					File uploadFile = new File(dir.getAbsolutePath() + File.separator + fileName);
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(uploadFile));
					out.write(bytes);
					out.close();
					
					//Database change
					Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
					SessionFactory sf = con.buildSessionFactory();
					Session s = sf.openSession();
					Transaction tx = s.beginTransaction();
	
					User user = (User) s.load(User.class, Integer.parseInt(userId));
					user.setProfile(fileName);
				    System.out.println(user.getProfile());
	
					tx.commit();
					sf.close();
					s.close();
					
					return "success";
				} else {
					return "extension";
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean passwordChange(HttpServletRequest req) {
		String oldPass = req.getParameter("oldPassword");
		String newPass = req.getParameter("newPassword");
		HttpSession session = req.getSession();
		String userId = session.getAttribute("userId").toString();
		
		Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		User user = (User) s.load(User.class, Integer.parseInt(userId));
		if(user.getPassword().equals(oldPass)) {
			user.setPassword(newPass);
			tx.commit();
			sf.close();
			s.close();
			return true;
		} else {
			tx.commit();
			sf.close();
			s.close();
			return false;
		}
	}

}
