package place;

import java.sql.Date;


public class placeDTO {
	
	private int placeID;
	private String userID;
	private String placeTag;
	private String placeTitle;
	private String placeIntroduce;
	private String placeRule;
	private String reservationDate;
	private String reservationUser;
	private String location;
	private String ofile;
	private String sfile;
	private int price;
	private String realPath;
	
	
	public String getReservationUser() {
		return reservationUser;
	}
	public void setReservationUser(String reservationUser) {
		this.reservationUser = reservationUser;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public int getPlaceID() {
		return placeID;
	}
	public void setPlaceID(int placeID) {
		this.placeID = placeID;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPlaceTag() {
		return placeTag;
	}
	public void setPlaceTag(String placeTag) {
		this.placeTag = placeTag;
	}
	public String getPlaceTitle() {
		return placeTitle;
	}
	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}
	public String getPlaceIntroduce() {
		return placeIntroduce;
	}
	public void setPlaceIntroduce(String placeIntroduce) {
		this.placeIntroduce = placeIntroduce;
	}
	public String getPlaceRule() {
		return placeRule;
	}
	public void setPlaceRule(String placeRule) {
		this.placeRule = placeRule;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
