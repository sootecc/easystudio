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
		
		int pageSize = 10; 	//��� ���ڵ� ��
		
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
		
		

	
        List<placeDTO> boardLists = pdao.selectListPage(map);  // �Խù� ��� �ޱ�
        List<placeDTO> resLists = pdao.selectListPage(map);  // �Խù� ��� �ޱ�
        
        pdao.close(); // DB ���� �ݱ�
	
        
		
		
		
		placeDTO pdto = pdao.selectView(idx);
		pdao.close();
		
		pdto.setReservationUser(res_user);
		pdto.setReservationDate(res_date);
		
		
		request.setAttribute("boardLists", boardLists);  //DataBase���� Select�� �����
		request.setAttribute("resLists", resLists);
	    request.setAttribute("map", map);
		request.setAttribute("udto", udto);
		request.setAttribute("pdto", pdto);
		
		request.getRequestDispatcher("/hostprofile.jsp").forward(request, response);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	

		
		


}
