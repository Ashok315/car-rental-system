package com.springmvctest.process;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.springmvctest.model.Address;
import com.springmvctest.model.CarBooking;
import com.springmvctest.model.Cars;

public class AllProcess {
	public List<Cars> getAllCarDetails() {
		Configuration con = new Configuration().configure().addAnnotatedClass(Cars.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Query query = s.createQuery("from Cars");
		return query.list();
		
	}
	
	public Cars getCarDetails(String carId) {
		Configuration con = new Configuration().configure().addAnnotatedClass(Cars.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		Query query = s.createQuery("from Cars where id = :id");
		query.setParameter("id", Integer.parseInt(carId));
		List<Cars> cars = query.list();
		if(cars.size() != 0)
			return cars.get(0);
		else 
			return null;
	}
	
	public List<Address> getAllCity() {
		Configuration con = new Configuration().configure().addAnnotatedClass(Address.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		Query query = s.createQuery("from Address");
		List<Address> address = query.list();
		return address;
	}
	
	public Address getCityById(int id) {
		Configuration con = new Configuration().configure().addAnnotatedClass(Address.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		Query query = s.createQuery("from Address id = :id");
		query.setParameter("id", id);
		List<Address> address = query.list();
		return address.get(0);
	}
	
	public boolean carReservation(HttpServletRequest req, int carId) {
		Configuration con = new Configuration().configure().addAnnotatedClass(CarBooking.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
		
		CarBooking reservation = new CarBooking();
		reservation.setU_id(userId);
		reservation.setCar_id(carId);
		reservation.setDriver(req.getParameter("driver") == null ? "NO" : "YES");
		reservation.setLicense("NONE");
		reservation.setPick_location(Integer.parseInt(req.getParameter("pick").toString()));
		reservation.setPick_date(req.getParameter("pickDate"));
		reservation.setReturn_location(Integer.parseInt(req.getParameter("return").toString()));
		reservation.setReturn_date(req.getParameter("returnDate"));
		reservation.setRate(req.getParameter("rate"));
		reservation.setApproved(0);
		
		s.save(reservation);
		tx.commit();
		
		return true;
	}
	
	public List<CarBooking> getReservationById(int userId){
		Configuration con = new Configuration().configure().addAnnotatedClass(CarBooking.class);
		SessionFactory sf = con.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		Query query = s.createQuery("from CarBooking where u_id = :userId");
		query.setParameter("userId", userId);
		List<CarBooking> carBooking = query.list();
		return carBooking;
	}


}
