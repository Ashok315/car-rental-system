package com.springmvctest.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.springmvctest.model.Contact;

public class ContactDetail {
	public void submitData(HttpServletRequest req) {
		Configuration con = new Configuration().configure().addAnnotatedClass(Contact.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Contact contact = new Contact();
		
		HttpSession session = req.getSession();
		if(session.getAttribute("userId") != null)
			contact.setUser(session.getAttribute("userId").toString()); 
		else 
			contact.setUser("VISITOR"); 
		contact.setName(req.getParameter("name"));
		contact.setEmail(req.getParameter("email"));
		contact.setSubject(req.getParameter("subject"));
		contact.setMessage(req.getParameter("message"));
		
		s.save(contact);

		tx.commit();
		sf.close();
		s.close();

	}

}
