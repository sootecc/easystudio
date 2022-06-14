package place;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class placeDAO extends DBConnPool{
	
	
		public placeDAO () {
			super(); 			
		}
		
		/**�˻� ���ǿ� �´� �Խù� ������ ��ȯ�մϴ�. 
		*/
		public int selectCount( Map<String, Object> map ) {
			int totalCount = 0; 
			String query = "SELECT COUNT(*) FROM ezplace";    //���ڵ��� �Ѱ��� ��ȯ ,  
				if (map.get("searchWord") != null) {			// �˻������ ��������� where 
					query += " Where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'"; 
				}
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery(query);
				rs.next(); 
				totalCount = rs.getInt(1); 
				
			} catch (Exception e) {
				System.out.println("�Խù� ī��Ʈ�� ���� �߻�");
				e.printStackTrace();
			}
						
			return totalCount; 
		}
		
		
		
		
		/**�˻� ���ǿ� �´� �Խù� ����� ��ȯ�մϴ�.
			DataBase���� Select �� ��� ����  DTO�� ��Ƽ� ���� ������.  
	    */
	    public List<placeDTO> selectListPage(Map<String,Object> map) {
	        List<placeDTO> board = new Vector<placeDTO>();
	        String query = " "
	                     + "SELECT * FROM ( "
	                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
	                     + "        SELECT * FROM ezplace ";

	        if (map.get("searchWord") != null)
	        {
	            query += " WHERE " + map.get("searchField")
	                   + " LIKE '%" + map.get("searchWord") + "%' ";
	        }

	        query += "        ORDER BY placeID DESC "
	               + "    ) Tb "
	               + " ) "
	               + " WHERE rNum BETWEEN ? AND ?";
	        
	        System.out.println(query);  //�ֿܼ� ��ü ���� ��� 

	        try {
	            psmt = con.prepareStatement(query);
	            psmt.setString(1, map.get("start").toString());
	            psmt.setString(2, map.get("end").toString());
	            rs = psmt.executeQuery();

	            while (rs.next()) {
	            	placeDTO dto = new placeDTO();

	                dto.setPlaceID(rs.getInt(1));
	                dto.setUserID(rs.getString(2));
	                dto.setPlaceTag(rs.getString(3));
	                dto.setPlaceTitle(rs.getString(4));
	                dto.setPlaceIntroduce(rs.getString(5));
	                dto.setPlaceRule(rs.getString(6));
	                dto.setReservationDate(rs.getString(7));
	                dto.setReservationUser(rs.getString(8));
	                dto.setLocation(rs.getString(9));
	                dto.setOfile(rs.getString(10));
	                dto.setSfile(rs.getString(11));
	                dto.setPrice(rs.getInt(12));
	                dto.setRealPath(rs.getString(13));
	    			
	                
	                /*
	                System.out.println( "DB���� ������ ��(idx) : " + rs.getString(1));
	                System.out.println("DB���� ������ �� (name)" + rs.getString(2));

	                System.out.println("==================");
	                
	                System.out.println("DTO���� �����°� (idx)" + dto.getIdx());
	                System.out.println("DTO���� ������ �� (Name)" + dto.getName());
	                */

	                board.add(dto);
	            }
	        }
	        catch (Exception e) {
	            System.out.println("�Խù� ��ȸ �� ���� �߻�");
	            e.printStackTrace();
	        }
	        return board;
	    }
		
		
		
		
		/**��� �� �˻� (Select ) : �־��� �Ϸ� ��ȣ�� �ش� �ϴ� ���� DTO �� �� �� ��ȯ�մϴ�. (�������� read)
	    //ViewController ��û�� ó�� 
	    */
	    public placeDTO selectView(String placeID) {
	    	placeDTO dto = new placeDTO();
	    	String query = "SELECT * FROM ezplace WHERE placeID = ?"; 
	    	
	    	try {
	    		psmt = con.prepareStatement(query); 
	    		psmt.setString(1,placeID); 
	    		rs = psmt.executeQuery(); 
	    		
	    		if (rs.next()) {
	    			dto.setPlaceID(rs.getInt(1));
	                dto.setUserID(rs.getString(2));
	                dto.setPlaceTag(rs.getString(3));
	                dto.setPlaceTitle(rs.getString(4));
	                dto.setPlaceIntroduce(rs.getString(5));
	                dto.setPlaceRule(rs.getString(6));
	                dto.setReservationDate(rs.getString(7));
	                dto.setReservationUser(rs.getString(8));
	                dto.setLocation(rs.getString(9));
	                dto.setOfile(rs.getString(10));
	                dto.setSfile(rs.getString(11));
	                dto.setPrice(rs.getInt(12));
	                dto.setRealPath(rs.getString(13));
	    			
	    		}
	    		
	    	}catch (Exception e) {
	    		System.out.println("�Խù� ������ ����� ���� �߻�");
	    		e.printStackTrace();
	    	}
	    	
	    	return dto; 
	    }
	    
	    public String selectLocation(String placeID) {
	    	placeDTO dto = new placeDTO();
	    	String query = "SELECT location FROM ezplace WHERE placeID = ?"; 
	    	
	    	try {
	    		psmt = con.prepareStatement(query); 
	    		psmt.setString(1,placeID); 
	    		rs = psmt.executeQuery(); 
	    		
	    		if (rs.next()) {
	                dto.setLocation(rs.getString(9));
	    			
	    		}
	    		
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return dto.getLocation(); 
	    }
	    
	    
	    public placeDTO selectView_user(String userID) {
	    	placeDTO dto = new placeDTO();
	    	String query = "SELECT * FROM ezplace WHERE userID = ?"; 
	    	
	    	try {
	    		psmt = con.prepareStatement(query); 
	    		psmt.setString(1,userID); 
	    		rs = psmt.executeQuery(); 
	    		
	    		if (rs.next()) {
	    			dto.setPlaceID(rs.getInt(1));
	                dto.setUserID(rs.getString(2));
	                dto.setPlaceTag(rs.getString(3));
	                dto.setPlaceTitle(rs.getString(4));
	                dto.setPlaceIntroduce(rs.getString(5));
	                dto.setPlaceRule(rs.getString(6));
	                dto.setReservationDate(rs.getString(7));
	                dto.setReservationUser(rs.getString(8));
	                dto.setLocation(rs.getString(9));
	                dto.setOfile(rs.getString(10));
	                dto.setSfile(rs.getString(11));
	                dto.setPrice(rs.getInt(12));
	                dto.setRealPath(rs.getString(13));
	    			
	    		}
	    		
	    	}catch (Exception e) {
	    		System.out.println("�Խù� ������ ����� ���� �߻�");
	    		e.printStackTrace();
	    	}
	    	
	    	return dto; 
	    }
	    
		
		/**������ ���� (Insert)
		 * 
		 * @param dto
		 * @return
		 */
		public int insertWrite (placeDTO dto) {
			int result = 0 ; 
			try {
				String query = "INSERT INTO ezplace ( "
						+ " placeID, userID, placeTag, placeTitle, placeIntroduce,placeRule,location,ofile,sfile, price,realPath) "
						+ " VALUES ("
						+ " seq_board_num.nextval ,?, ?,?,?,?,?,?,?,?,? )"; 
				
			psmt = con.prepareStatement(query);  //PareparedStatement ��ü ���� 
			
			psmt.setString(1, dto.getUserID());
			psmt.setString(2, dto.getPlaceTag());
			psmt.setString(3, dto.getPlaceTitle());
			psmt.setString(4, dto.getPlaceIntroduce());
			psmt.setString(5, dto.getPlaceRule());
			psmt.setString(6, dto.getLocation());
			psmt.setString(7, dto.getOfile());
			psmt.setString(8, dto.getSfile());
			psmt.setInt(9,dto.getPrice());
			psmt.setString(10, dto.getRealPath());
			
			result = psmt.executeUpdate();  //insert�� �����϶� result > 0   //DB �� ���� ���� 
					//result : 0 �϶� <== Insert ���� , result : 1 �϶� insert ���� 
			
			}catch (Exception e) {
				e.printStackTrace();
			}
				
			return result; 		// result : Insert ������ > 0 , ���н� : 0 
		}
		
		
		//������ ���� (Update)
		public int updatePost (placeDTO dto) {
			int result = 0 ; 
			
			try {
				String query =    "UPDATE ezplace "
								+ " SET placeTag = ? , placeTitle = ?, placeIntroduce = ?, placeRule = ?"
								+ " WHERE idx = ? and pass = ?"; 
				//������ �غ� 
				psmt = con.prepareStatement(query); 
				
				psmt.setString(1, dto.getPlaceTag());
				psmt.setString(2, dto.getPlaceTitle());
				psmt.setString(3, dto.getPlaceIntroduce());
				psmt.setString(4, dto.getPlaceRule());
				//���� ������Ʈ�� ����
				
				result = psmt.executeUpdate();   //update������ result ������ ���� > 0 	
				
				//System.out.println("result : " + result);
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("Update�� ���ܹ߻�");
			}
					
			return result ;   //result > 0 : ���� ����, result = 0 : ���� ���� 		
		}
		
		
		//������ ���� (delete)
		public int deletePost(String placeID) {
			int result = 0 ; 
			
			try {
				String query = "DELETE ezpalce WHERE placeID = ?"; 
				psmt = con.prepareStatement(query); 
				psmt.setString(1, placeID);
				
				result = psmt.executeUpdate();  //result > 0 ���� ����, result = 0 : ���� ���� 
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("delete �� ���� �߻� ");
			}
					
			return result; 				
		}
		
		
		
		
		
		
	
}
