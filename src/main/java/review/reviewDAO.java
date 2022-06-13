package review;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class reviewDAO extends DBConnPool{
	
	
	public reviewDAO () {
		super(); 			//DBConnPool��ü�� �⺻ ������ ȣ�� , DBCP���� con ��ü Ȱ��ȭ
	}
	
	//�˻� ���ǿ� �´� �Խù� ������ ��ȯ�մϴ�. 
	public int selectCount( Map<String, Object> map ) {
		int totalCount = 0; 
		String query = "SELECT COUNT(*) FROM review";    //���ڵ��� �Ѱ��� ��ȯ ,  
			if (map.get("searchWord") != null) {			// �˻������ ��������� where 
				query += " Where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'"; 
			}
		try {
			psmt = con.prepareStatement(query);
			rs = stmt.executeQuery(query);
			rs.next(); 
			totalCount = rs.getInt(1); 
			
		} catch (Exception e) {
			System.out.println("�Խù� ī��Ʈ�� ���� �߻�");
			e.printStackTrace();
		}
					
		return totalCount; 
	}
	
	
	
	
	//�˻� ���ǿ� �´� �Խù� ����� ��ȯ�մϴ�.
		//DataBase���� Select �� ��� ����  DTO�� ��Ƽ� ���� ������.  
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
        
        System.out.println(query);  //�ֿܼ� ��ü ���� ��� 

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
	
	
	
	
	//��� �� �˻� (Select ) : �־��� �Ϸ� ��ȣ�� �ش� �ϴ� ���� DTO �� �� �� ��ȯ�մϴ�. (�������� read)
    //ViewController ��û�� ó�� 
    
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
    		System.out.println("�Խù� ������ ����� ���� �߻�");
    		e.printStackTrace();
    	}
    	
    	return dto; 
    }
    
    
    
    
    
    
    
	
	//������ ���� (Insert)
	public int insertWrite (reviewDTO dto) {
		int result = 0 ; 
		try {
			String query = "INSERT INTO mvcboard ( "
					+ " reviewIndex,reviewPlaceID,reviewUserID,reviewDate,reviewText) "
					+ " VALUES ("
					+ " seq_board_num.nextval, ?, ?, ?, ?)"; 
			
		psmt = con.prepareStatement(query);  //PareparedStatement ��ü ���� 
		
		psmt.setInt(1, dto.getReviewPlaceID());
		psmt.setString(2, dto.getReviewUserID());
		psmt.setString(3, dto.getReviewDate());
		psmt.setString(4, dto.getReviewText());
		
		
		result = psmt.executeUpdate();  //insert�� �����϶� result > 0   //DB �� ���� ���� 
				//result : 0 �϶� <== Insert ���� , result : 1 �϶� insert ���� 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return result; 		// result : Insert ������ > 0 , ���н� : 0 
	}
	
	
	
	
	//������ ���� (delete)
	public int deletePost(String idx) {
		int result = 0 ; 
		
		try {
			String query = "DELETE mvcboard WHERE idx = ?"; 
			psmt = con.prepareStatement(query); 
			psmt.setString(1, idx);
			
			result = psmt.executeUpdate();  //result > 0 ���� ����, result = 0 : ���� ���� 
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete �� ���� �߻� ");
		}
				
		return result; 				
	}
	
	
	
	
	
}
