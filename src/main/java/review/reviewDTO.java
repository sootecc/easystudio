package review;

public class reviewDTO {

	private int reviewIndex;
	private int reviewPlaceID;
	private String reviewUserID;
	private String reviewDate;
	private String reviewText;
	
	
	public int getReviewIndex() {
		return reviewIndex;
	}
	public void setReviewIndex(int reviewIndex) {
		this.reviewIndex = reviewIndex;
	}
	public int getReviewPlaceID() {
		return reviewPlaceID;
	}
	public void setReviewPlaceID(int reviewPlaceID) {
		this.reviewPlaceID = reviewPlaceID;
	}
	public String getReviewUserID() {
		return reviewUserID;
	}
	public void setReviewUserID(String reviewUserID) {
		this.reviewUserID = reviewUserID;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	
	
}
