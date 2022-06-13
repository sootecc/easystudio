package user;

import common.DBConnPool;

public class userDAO extends DBConnPool{
	
	public userDAO() {
		super();	
	}
	
	
	
	
	/**
	 * ȸ������ó��(registerPro.jsp)���� �Ѿ���� ���� DB�� ����(insert)
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
			
			System.out.println("ȸ������ DB �Է� ����");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ������ DB �Է½� ���� �߻�");
		}
	}
	
		/**�α��� ó�� (loginPro.jsp) :  ������ �Ѱ� ���� ID�� Pass�� DB�� Ȯ��. 
		// ����� ����ó��, DB�� ������ �����Ҷ� , DB�� ������ ���� �Ҷ�. 
		//����� ���� (MemberCheck.jsp) ���� ����ϴ� �޼ҵ�
		*/
	public int userCheck(String id, String passwd) {
		int x = -1;   //x = -1  : ���̵� �������� ���� , 
					  //x = 1   : ���� ����, 
		
		
		try {
			
			
			String sql = "select userPassword from ezuser where userID = ? "; 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);   
			rs = psmt.executeQuery(); 
			
			if (rs.next()) {    //���̵� �����ϸ� 
				String dbpasswd = rs.getString("userPassword");     //DB���� ������ �н����� . 
				if (dbpasswd.equals(passwd)) {
					x=1;  // ������ �Ѱܿ� �н������ DB���� ������ �н����尡 ��ġ �Ҷ� x: 1 
				}else {
					x= -1;   // �н����尡 ��ġ���� ������ 
				}			
			}			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("���̵�� �н����� ���� ���� �߽��ϴ�.");
		}
			
		return x; 		
	}
	
	
	/**���̵� �ߺ� üũ (confirmId.jsp) : ���̵� �ߺ��� Ȯ���ϴ� �޼ҵ�
	 *  
	 * @param id
	 * @return
	 */
	public int confirmId (String id) {
		int x = -1 ;    //x = -1 �϶� : ���� ID�� DB�� �������� ����
						//x = 1 �϶� : ���� ID �� DB�� ���� �Ѵ�. (�ߺ�)
		
		try {
			String sql = "select userID from ezuser where userID = ?" ; 
			psmt = con.prepareStatement(sql); 
			psmt.setString (1,id); 
			rs = psmt.executeQuery();
			
			if ( rs.next()) {  // ���̵� DB �� �����ϴ� ���
				 x= 1; 
			} else {  //���̵� DB�� �������� �ʴ� ���
				 x= -1 ; 
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(" ID �ߺ� üũ�� ���� �߻�");
		}
		return x ; 
	}
	
	
	/**
	 * ȸ�� ���� ����(modifyForm.jsp): DB���� ȸ�� ������ ���� �������� �޼ҵ�
	 * @param uid
	 * @param upass
	 * @return
	 */
	public userDTO getuserDTO(String uid, String upass) {
		userDTO dto = new userDTO();
		String query = "select * from ezuser where userID = ? and userPassword =?";		//������������
		
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
					
					System.out.println("ȸ������ �о���� ����");
				}
				else {}
			}else {
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� �о���� �� ���� �߻�");
		}	
		
		return dto;
	}
	
	
	public userDTO getuserDTO(String uid) {
		userDTO dto = new userDTO();
		String query = "select * from ezuser where userID = ? ";		//������������
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
		
			if(rs.next()) {	
					dto.setUserID(rs.getString("userID"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserProfilePath(rs.getString("userProfilePath"));
					dto.setUserMoreInfo(rs.getString("userMoreInfo"));
					
					System.out.println("ȸ������ �о���� ����");
				
			}else {
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� �о���� �� ���� �߻�");
		}	
		
		return dto;
	}
	
	
		/**�������������� ������ ������ DB�� �����ϴ� �޼ҵ� ( 
		//ȸ�� ���� ���� ó�� (modifyPro.jsp) ���� ȸ�������� ������ ó���ϴ� �޼ҵ� 
		*/
		public int updateMember(userDTO user) {
			int x = -1 ; //x = -1 : update ���н� 
						 //x = +1 : update ���� 
			
			//ID �� Passwd �� Ȯ���� ������Ʈ ���� . 
			
			
			try {
				
				String sql = "select userPassword from ezuser where userID = ?" ; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, user.getUserID());
				rs = psmt.executeQuery();  
				
				if (rs.next()) {	// �ش� ���̵� DB�� �����Ѵ�.
					//������ �ѱ� �н������ DB���� ������ �н����尡 ��ġ�ϴ��� Ȯ���� ó�� 
					String dbpasswd = rs.getString("userPassword"); 
					if (dbpasswd.equals(user.getUserPassword())) {   //��  �н����尡 ��ġ�Ҷ� 
						//DTO (user)���� ���� ���� DB�� UPDATE 
						       sql = "update ezuser set userNickName = ?,userProfilePath =?, userMoreInfo =? " ;  
							   sql += " where userID = ?"; 
						psmt = con.prepareStatement(sql); 
						
						psmt.setString(1, user.getUserNickName());
						psmt.setString(2, user.getUserProfilePath());
						psmt.setString(3, user.getUserMoreInfo());
						psmt.setString(4, user.getUserID());
						
						psmt.executeUpdate();
						x = 1; 	//update ������ x ������ 1 �� �Ҵ�. 	
					
					}
								
				} else {	// �ش� ���̵� DB�� �����Ѵ�. 			
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("ȸ�� ���� ������ ���� �߻�");
			}
						
			return x; 				 
		}
		
		/**ȸ�� Ż�� ó�� ( deletePro.jsp ) ���� ȸ�� ���� ���� �޼ҵ� 
		*/
		public int deleteMember(String id, String passwd) {
			int x = -1;  // x= -1 : ȸ�� Ż�� ���� 
						 // x = 1 : ȸ�� Ż�� ���� 
			
			try {
				
				
				String sql = "select userPassword from ezuser where userID = ?"; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, id);
				rs = psmt.executeQuery(); 
				
				if (rs.next()) {  //id�� DB�� ���� 
					String dbpasswd = rs.getString("passwd"); 
					if ( dbpasswd.equals(passwd)) {  //password �� ��ġ�ϴ� ���: delete
						sql = "delete ezuser where userID = ?"; 
						
						psmt = con.prepareStatement(sql); 
						psmt.setString(1, id);
						psmt.executeUpdate(); 
						x = 1;     //delete ������ 								
					}		
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("ȸ�� Ż��� ���ܰ� �߻� �߽��ϴ�");
			}
			
			return x; 			// ������ x = 1, ���н� x= -1 
		}
	
	
}
