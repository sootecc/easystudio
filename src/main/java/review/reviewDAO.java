package review;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class reviewDAO extends DBConnPool{
	
	
	public reviewDAO () {
		super(); 			//DBConnPool객체의 기본 생성자 호출 , DBCP에서 con 객체 활성화
	}
	
	//검색 조건에 맞는 게시물 개수를 반환합니다. 
	public int selectCount( Map<String, Object> map ) {
		int totalCount = 0; 
		String query = "SELECT COUNT(*) FROM review";    //레코드의 총갯수 반환 ,  
			if (map.get("searchWord") != null) {			// 검색기능을 사용했을시 where 
				query += " Where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'"; 
			}
		try {
			psmt = con.prepareStatement(query);
			rs = stmt.executeQuery(query);
			rs.next(); 
			totalCount = rs.getInt(1); 
			
		} catch (Exception e) {
			System.out.println("게시물 카운트중 예외 발생");
			e.printStackTrace();
		}
					
		return totalCount; 
	}
	
	
	
	
	//검색 조건에 맞는 게시물 목록을 반환합니다.
		//DataBase에서 Select 한 결과 값을  DTO에 담아서 리턴 시켜줌.  
    public List<reviewDTO> selectListPage(Map<String,Object> map) {
        List<reviewDTO> board = new Vector<reviewDTO>();
        String query = " "
                     + "SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM review ";

        if (map.get("searchWord") != null)
        {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        query += "        ORDER BY reviewIndex DESC "
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
                reviewDTO dto = new reviewDTO();

                dto.setReviewIndex(rs.getInt(1));
                dto.setReviewPlaceID(rs.getInt(2));
                dto.setReviewUserID(rs.getString(3));
                dto.setReviewDate(rs.getString(4));
                dto.setReviewText(rs.getString(5));
              
                
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
	
	
	
	
	//목록 상세 검색 (Select ) : 주어진 일련 번호에 해당 하는 값을 DTO 에 담 아 반환합니다. (한페이지 read)
    //ViewController 요청을 처리 
    
    public reviewDTO selectView(String idx) {
    	reviewDTO dto = new reviewDTO();
    	String query = "SELECT * FROM review WHERE reviewIndex = ?"; 
    	
    	try {
    		psmt = con.prepareStatement(query); 
    		psmt.setString(1,idx); 
    		rs = psmt.executeQuery(); 
    		
    		if (rs.next()) {
    			dto.setReviewIndex(rs.getInt(1));
                dto.setReviewPlaceID(rs.getInt(2));
                dto.setReviewUserID(rs.getString(3));
                dto.setReviewDate(rs.getString(4));
                dto.setReviewText(rs.getString(5));
    			
    		}
    		
    	}catch (Exception e) {
    		System.out.println("게시물 상세정보 출력중 예외 발생");
    		e.printStackTrace();
    	}
    	
    	return dto; 
    }
    
    
    
    
    
    
    
	
	//데이터 삽입 (Insert)
	public int insertWrite (reviewDTO dto) {
		int result = 0 ; 
		try {
			String query = "INSERT INTO mvcboard ( "
					+ " reviewIndex,reviewPlaceID,reviewUserID,reviewDate,reviewText) "
					+ " VALUES ("
					+ " seq_board_num.nextval, ?, ?, ?, ?)"; 
			
		psmt = con.prepareStatement(query);  //PareparedStatement 객체 생성 
		
		psmt.setInt(1, dto.getReviewPlaceID());
		psmt.setString(2, dto.getReviewUserID());
		psmt.setString(3, dto.getReviewDate());
		psmt.setString(4, dto.getReviewText());
		
		
		result = psmt.executeUpdate();  //insert가 성공일때 result > 0   //DB 에 값을 저장 
				//result : 0 일때 <== Insert 실패 , result : 1 일때 insert 성공 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return result; 		// result : Insert 성공시 > 0 , 실패시 : 0 
	}
	
	
	
	
	//데이터 삭제 (delete)
	public int deletePost(String idx) {
		int result = 0 ; 
		
		try {
			String query = "DELETE mvcboard WHERE idx = ?"; 
			psmt = con.prepareStatement(query); 
			psmt.setString(1, idx);
			
			result = psmt.executeUpdate();  //result > 0 삭제 성공, result = 0 : 삭제 실패 
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete 시 예외 발생 ");
		}
				
		return result; 				
	}
	
	
	
	
	
}
