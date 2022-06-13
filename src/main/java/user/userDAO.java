package user;

import common.DBConnPool;

public class userDAO extends DBConnPool{
	
	public userDAO() {
		super();	
	}
	
	
	
	
	/**
	 * 회원가입처리(registerPro.jsp)에서 넘어오는 값을 DB에 저장(insert)
	 * @param dto
	 */
	public void insertUser(userDTO dto) {
		
		String sql ="insert into ezuser values(?, ?, ?, ?, ?)";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getUserID());
			psmt.setString(2, dto.getUserPassword());
			psmt.setString(3, dto.getUserNickName());
			psmt.setString(4, dto.getUserProfilePath());
			psmt.setString(5, dto.getUserMoreInfo());
			
			psmt.executeUpdate();
			
			System.out.println("회원정보 DB 입력 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 DB 입력시 예외 발생");
		}
	}
	
		/**로그인 처리 (loginPro.jsp) :  폼에서 넘겨 받은 ID와 Pass를 DB를 확인. 
		// 사용자 인증처리, DB의 정보를 수정할때 , DB의 정보를 삭제 할때. 
		//사용자 인증 (MemberCheck.jsp) 에서 사용하는 메소드
		*/
	public int userCheck(String id, String passwd) {
		int x = -1;   //x = -1  : 아이디가 존재하지 않음 , 
					  //x = 1   : 인증 성공, 
		
		
		try {
			
			
			String sql = "select userPassword from ezuser where userID = ? "; 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);   
			rs = psmt.executeQuery(); 
			
			if (rs.next()) {    //아이디가 존재하면 
				String dbpasswd = rs.getString("userPassword");     //DB에서 가져온 패스워드 . 
				if (dbpasswd.equals(passwd)) {
					x=1;  // 폼에서 넘겨온 패스워드와 DB에서 가져온 패스워드가 일치 할때 x: 1 
				}else {
					x= -1;   // 패스워드가 일치하지 않을때 
				}			
			}			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디와 패스워드 인증 실패 했습니다.");
		}
			
		return x; 		
	}
	
	
	/**아이디 중복 체크 (confirmId.jsp) : 아이디 중복을 확인하는 메소드
	 *  
	 * @param id
	 * @return
	 */
	public int confirmId (String id) {
		int x = -1 ;    //x = -1 일때 : 같은 ID가 DB에 존재하지 않음
						//x = 1 일때 : 같은 ID 가 DB에 존재 한다. (중복)
		
		try {
			String sql = "select userID from ezuser where userID = ?" ; 
			psmt = con.prepareStatement(sql); 
			psmt.setString (1,id); 
			rs = psmt.executeQuery();
			
			if ( rs.next()) {  // 아이디가 DB 에 존재하는 경우
				 x= 1; 
			} else {  //아이디가 DB에 존재하지 않는 경우
				 x= -1 ; 
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(" ID 중복 체크중 예외 발생");
		}
		return x ; 
	}
	
	
	/**
	 * 회원 정보 수정(modifyForm.jsp): DB에서 회원 정보의 값을 가져오는 메소드
	 * @param uid
	 * @param upass
	 * @return
	 */
	public userDTO getuserDTO(String uid, String upass) {
		userDTO dto = new userDTO();
		String query = "select * from ezuser where userID = ? and userPassword =?";		//유저가져오기
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2,upass);
			rs = psmt.executeQuery();
		
			if(rs.next()) {	
				String dbpasswd = rs.getString("userPassword");
				if(dbpasswd.equals(upass)) {
					dto.setUserID(rs.getString("userID"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserProfilePath(rs.getString("userProfilePath"));
					dto.setUserMoreInfo(rs.getString("userMoreInfo"));
					
					System.out.println("회원정보 읽어오기 성공");
				}
				else {}
			}else {
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 정보 읽어오는 중 예외 발생");
		}	
		
		return dto;
	}
	
	
	public userDTO getuserDTO(String uid) {
		userDTO dto = new userDTO();
		String query = "select * from ezuser where userID = ? ";		//유저가져오기
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
		
			if(rs.next()) {	
					dto.setUserID(rs.getString("userID"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserProfilePath(rs.getString("userProfilePath"));
					dto.setUserMoreInfo(rs.getString("userMoreInfo"));
					
					System.out.println("회원정보 읽어오기 성공");
				
			}else {
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 정보 읽어오는 중 예외 발생");
		}	
		
		return dto;
	}
	
	
		/**수정페이지에서 수정한 내용을 DB에 저장하는 메소드 ( 
		//회원 정보 수정 처리 (modifyPro.jsp) 에서 회원정보를 수정을 처리하는 메소드 
		*/
		public int updateMember(userDTO user) {
			int x = -1 ; //x = -1 : update 실패시 
						 //x = +1 : update 성공 
			
			//ID 와 Passwd 를 확인후 업데이트 진행 . 
			
			
			try {
				
				String sql = "select userPassword from ezuser where userID = ?" ; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, user.getUserID());
				rs = psmt.executeQuery();  
				
				if (rs.next()) {	// 해당 아이디가 DB에 존재한다.
					//폼에서 넘긴 패스워드와 DB에서 가져온 패스워드가 일치하는지 확인후 처리 
					String dbpasswd = rs.getString("userPassword"); 
					if (dbpasswd.equals(user.getUserPassword())) {   //두  패스워드가 일치할때 
						//DTO (user)에서 들어온 값을 DB에 UPDATE 
						       sql = "update ezuser set userNickName = ?,userProfilePath =?, userMoreInfo =? " ;  
							   sql += " where userID = ?"; 
						psmt = con.prepareStatement(sql); 
						
						psmt.setString(1, user.getUserNickName());
						psmt.setString(2, user.getUserProfilePath());
						psmt.setString(3, user.getUserMoreInfo());
						psmt.setString(4, user.getUserID());
						
						psmt.executeUpdate();
						x = 1; 	//update 성공시 x 변수에 1 을 할당. 	
					
					}
								
				} else {	// 해당 아이디가 DB에 존재한다. 			
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("회원 정보 수정시 예외 발생");
			}
						
			return x; 				 
		}
		
		/**회원 탈퇴 처리 ( deletePro.jsp ) 에서 회원 정보 삭제 메소드 
		*/
		public int deleteMember(String id, String passwd) {
			int x = -1;  // x= -1 : 회원 탈퇴 실패 
						 // x = 1 : 회원 탈퇴 성공 
			
			try {
				
				
				String sql = "select userPassword from ezuser where userID = ?"; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, id);
				rs = psmt.executeQuery(); 
				
				if (rs.next()) {  //id가 DB에 존재 
					String dbpasswd = rs.getString("passwd"); 
					if ( dbpasswd.equals(passwd)) {  //password 가 일치하는 경우: delete
						sql = "delete ezuser where userID = ?"; 
						
						psmt = con.prepareStatement(sql); 
						psmt.setString(1, id);
						psmt.executeUpdate(); 
						x = 1;     //delete 성공시 								
					}		
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("회원 탈퇴시 예외가 발생 했습니다");
			}
			
			return x; 			// 성공시 x = 1, 실패시 x= -1 
		}
	
	
}
