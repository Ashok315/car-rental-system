package com.springmvctest.process;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.springmvctest.model.SignIn;
import com.springmvctest.model.User;

public class SignInProcess {
	public int signIn(SignIn signInData) {	
		Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Query query = s.createQuery("from User where email = :email and password = :password");
		query.setParameter("email", signInData.getEmail());
		query.setParameter("password", signInData.getPassword());
		List<User> users = query.list();
		if(users.size() == 1)
			return users.get(0).getId();
		else
			return 0;
	}
	
}
