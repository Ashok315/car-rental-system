package com.springmvctest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cars")
public class Cars {
	
	@Id
	private int id;
	private String company;
	private String name;
	@Column(name = "number")
	private String number;
	private String seats;
	private String mileage;
	private String fuel;
	private String airconditions;
	private String gps;
	private String music;
	private String bluetooth;
	private String remote_central_locking;
	private String seat_Belt;
	private String carkit;
	private String onboard_computer;
	private String rate_per_hour;
	private String rate_per_day;
	private String description;
	private String image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getAirconditions() {
		return airconditions;
	}
	public void setAirconditions(String airconditions) {
		this.airconditions = airconditions;
	}
	public String getGps() {
		return gps;
	}
	public void setGps(String gps) {
		this.gps = gps;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getBluetooth() {
		return bluetooth;
	}
	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}
	public String getRemote_central_locking() {
		return remote_central_locking;
	}
	public void setRemote_central_locking(String remote_central_locking) {
		this.remote_central_locking = remote_central_locking;
	}
	public String getSeat_Belt() {
		return seat_Belt;
	}
	public void setSeat_Belt(String seat_Belt) {
		this.seat_Belt = seat_Belt;
	}
	public String getCarkit() {
		return carkit;
	}
	public void setCarkit(String carkit) {
		this.carkit = carkit;
	}
	public String getOnboard_computer() {
		return onboard_computer;
	}
	public void setOnboard_computer(String onboard_computer) {
		this.onboard_computer = onboard_computer;
	}
	public String getRate_per_hour() {
		return rate_per_hour;
	}
	public void setRate_per_hour(String rate_per_hour) {
		this.rate_per_hour = rate_per_hour;
	}
	public String getRate_per_day() {
		return rate_per_day;
	}
	public void setRate_per_day(String rate_per_day) {
		this.rate_per_day = rate_per_day;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


}
