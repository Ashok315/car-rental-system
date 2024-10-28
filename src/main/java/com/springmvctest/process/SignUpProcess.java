package com.springmvctest.process;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.springmvctest.model.SignUp;
import com.springmvctest.model.User;

public class SignUpProcess {
	public boolean check(SignUp signUp) {
		
		Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Query query = s.createQuery("from User where email = :email or contact = :contact");
		query.setParameter("email", signUp.getEmail());
		query.setParameter("contact", signUp.getContact());
		List<User> users = query.list();
		
		sf.close();
		s.close();
		
		if(users.size() != 0)
			return false;
		else
			return true;
	}
	
	public int newCreate(HttpServletRequest req) {
		Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		HttpSession ses = req.getSession();
		SignUp signUp = (SignUp) ses.getAttribute("signUp");
		
		User user = new User();
		user.setFirstName(signUp.getFirstName());
		user.setLastName(signUp.getLastName());
		user.setGender(signUp.getGender());
		user.setEmail(signUp.getEmail());
		user.setContact(signUp.getContact());
		user.setDob(signUp.getDob());
		user.setPassword(signUp.getPassword());
		user.setProfile("Default.jpg");
		
		s.save(user);
		Query query = s.createQuery("from User where email = :email or password = :password");
		query.setParameter("email", signUp.getEmail());
		query.setParameter("password", signUp.getPassword());
		List<User> users = query.list();

		tx.commit();
		sf.close();
		s.close();
		
		if(users.size() == 1)
			return users.get(0).getId();
		else
			return 0;
		
	}

}
