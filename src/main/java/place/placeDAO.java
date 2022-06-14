package place;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class placeDAO extends DBConnPool{
	
	
		public placeDAO () {
			super(); 			
		}
		
		/**검색 조건에 맞는 게시물 개수를 반환합니다. 
		*/
		public int selectCount( Map<String, Object> map ) {
			int totalCount = 0; 
			String query = "SELECT COUNT(*) FROM ezplace";    //레코드의 총갯수 반환 ,  
				if (map.get("searchWord") != null) {			// 검색기능을 사용했을시 where 
					query += " Where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'"; 
				}
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery(query);
				rs.next(); 
				totalCount = rs.getInt(1); 
				
			} catch (Exception e) {
				System.out.println("게시물 카운트중 예외 발생");
				e.printStackTrace();
			}
						
			return totalCount; 
		}
		
		
		
		
		/**검색 조건에 맞는 게시물 목록을 반환합니다.
			DataBase에서 Select 한 결과 값을  DTO에 담아서 리턴 시켜줌.  
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
	        
	        System.out.println(query);  //콘솔에 전체 쿼리 출력 

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
	                System.out.println( "DB에서 가져온 값(idx) : " + rs.getString(1));
	                System.out.println("DB에서 가져온 값 (name)" + rs.getString(2));

	                System.out.println("==================");
	                
	                System.out.println("DTO에서 가져온값 (idx)" + dto.getIdx());
	                System.out.println("DTO에서 가져온 값 (Name)" + dto.getName());
	                */

	                board.add(dto);
	            }
	        }
	        catch (Exception e) {
	            System.out.println("게시물 조회 중 예외 발생");
	            e.printStackTrace();
	        }
	        return board;
	    }
		
		
		
		
		/**목록 상세 검색 (Select ) : 주어진 일련 번호에 해당 하는 값을 DTO 에 담 아 반환합니다. (한페이지 read)
	    //ViewController 요청을 처리 
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
	    		System.out.println("게시물 상세정보 출력중 예외 발생");
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
	    		System.out.println("게시물 상세정보 출력중 예외 발생");
	    		e.printStackTrace();
	    	}
	    	
	    	return dto; 
	    }
	    
		
		/**데이터 삽입 (Insert)
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
				
			psmt = con.prepareStatement(query);  //PareparedStatement 객체 생성 
			
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
			
			result = psmt.executeUpdate();  //insert가 성공일때 result > 0   //DB 에 값을 저장 
					//result : 0 일때 <== Insert 실패 , result : 1 일때 insert 성공 
			
			}catch (Exception e) {
				e.printStackTrace();
			}
				
			return result; 		// result : Insert 성공시 > 0 , 실패시 : 0 
		}
		
		
		//데이터 수정 (Update)
		public int updatePost (placeDTO dto) {
			int result = 0 ; 
			
			try {
				String query =    "UPDATE ezplace "
								+ " SET placeTag = ? , placeTitle = ?, placeIntroduce = ?, placeRule = ?"
								+ " WHERE idx = ? and pass = ?"; 
				//쿼리문 준비 
				psmt = con.prepareStatement(query); 
				
				psmt.setString(1, dto.getPlaceTag());
				psmt.setString(2, dto.getPlaceTitle());
				psmt.setString(3, dto.getPlaceIntroduce());
				psmt.setString(4, dto.getPlaceRule());
				//파일 업데이트는 아직
				
				result = psmt.executeUpdate();   //update성공시 result 변수의 값이 > 0 	
				
				//System.out.println("result : " + result);
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("Update시 예외발생");
			}
					
			return result ;   //result > 0 : 수정 성공, result = 0 : 수정 실패 		
		}
		
		
		//데이터 삭제 (delete)
		public int deletePost(String placeID) {
			int result = 0 ; 
			
			try {
				String query = "DELETE ezpalce WHERE placeID = ?"; 
				psmt = con.prepareStatement(query); 
				psmt.setString(1, placeID);
				
				result = psmt.executeUpdate();  //result > 0 삭제 성공, result = 0 : 삭제 실패 
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("delete 시 예외 발생 ");
			}
					
			return result; 				
		}
		
		
		
		
		
		
	
}
