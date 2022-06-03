package easystudio.placedetail;

public class PlaceDetailDTO {
	private String placeId;
	private String id;
	private String price;
	private float locationX;
	private float locationY;
	private String rule;
	private String placeTag;
	private int reservationRequest;
	
	public PlaceDetailDTO() {}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public float getLocationX() {
		return locationX;
	}

	public void setLocationX(float locationX) {
		this.locationX = locationX;
	}

	public float getLocationY() {
		return locationY;
	}

	public void setLocationY(float locationY) {
		this.locationY = locationY;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getPlaceTag() {
		return placeTag;
	}

	public void setPlaceTag(String placeTag) {
		this.placeTag = placeTag;
	}

	public int getReservationRequest() {
		return reservationRequest;
	}

	public void setReservationRequest(int reservationRequest) {
		this.reservationRequest = reservationRequest;
	}
	
	
	
}
