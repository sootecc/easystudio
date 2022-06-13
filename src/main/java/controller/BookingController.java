package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import place.placeDAO;
import place.placeDTO;
import user.userDAO;
import user.userDTO;
import utils.BoardPage;

@WebServlet("/booking.do")
public class BookingController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userDAO udao = new userDAO();
		String uid = request.getParameter("userID");
		userDTO udto = udao.getuserDTO(uid);
		udao.close();
		
		udto.setUserID(uid);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		placeDAO pdao = new placeDAO(); 
		String idx= request.getParameter("placeID");
		String res_user = uid;
		String res_date = request.getParameter("date");
		int totalCount = pdao.selectCount(map);
		
		ServletContext application = getServletContext(); 
		int pageSize = 20; 	//��� ���ڵ� ��
		int blockPage = 5;	//������ �� 
		
		//System.out.println(pageSize);
		//System.out.println(blockPage);
		
		//���� ������ Ȯ�� 
		int pageNum = 1; 
		String pageTemp = request.getParameter("pageNum");  
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp); 	//  ���� ��� ���� ������ �ѿ��� ������ ������ ������ ��ȯ�ؼ� ���� 
		}
		
		//��Ͽ� ����� �Խù� ���� ��� 
		int start = (pageNum -1) * pageSize + 1 ;  //ù �Խù� ��ȣ 
		int end = pageNum * pageSize;     //������ �Խù� ��ȣ 
		
		//�� �������� ���� ������     
		map.put("start", start); 
		map.put("end", end);
		
		//System.out.println(start);
		//System.out.println(end);
		
		
		
		/* ����¡ ó�� �κ� end */ 
			
		// �Խù� ����� �޾ƿ��� (DAO ��ü�� �۾��� ���� )
		//boardLists�� DB�� ���ڵ带 ���� DTO��ü(5��) �� ��� �ִ�. 
	
        List<placeDTO> boardLists = pdao.selectListPage(map);  // �Խù� ��� �ޱ�
        pdao.close(); // DB ���� �ݱ�
	
        //���������� ���� �� �Ű��������� �߰� 
        //utils.BoardPage : ����¡ ó���ϴ� Ŭ����, pagingStr �޼ҵ� : static �޼ҵ�
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
            blockPage, pageNum, "/list.do");  // �ٷΰ��� ���� HTML ���ڿ�
    
	    //View�������� ������ ���� ���� 
	    
	    map.put("pagingImg", pagingImg);
	    map.put("totalCount", totalCount);
	    map.put("pageSize", pageSize);
	    map.put("pageNum", pageNum); 
		
		
		
		placeDTO pdto = pdao.selectView(idx);
		pdao.close();
		
		pdto.setReservationUser(res_user);
		pdto.setReservationDate(res_date);
		
		
		request.setAttribute("boardLists", boardLists);  //DataBase���� Select�� �����
	    request.setAttribute("map", map);
		request.setAttribute("udto", udto);
		request.setAttribute("pdto", pdto);
		
		request.getRequestDispatcher("/hostprofile.jsp").forward(request, response);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	

		
		


}
