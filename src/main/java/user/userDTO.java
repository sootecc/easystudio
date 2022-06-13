package user;

public class userDTO {
	
	private String userID;
	private String userPassword;
	private String userNickName;
	private String userProfilePath;
	private String userMoreInfo;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String nickName) {
		userNickName = nickName;
	}
	public String getUserProfilePath() {
		return userProfilePath;
	}
	public void setUserProfilePath(String userProfilePath) {
		this.userProfilePath = userProfilePath;
	}
	public String getUserMoreInfo() {
		return userMoreInfo;
	}
	public void setUserMoreInfo(String userMoreInfo) {
		this.userMoreInfo = userMoreInfo;
	}
	
	
}
