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
		
		int pageSize = 10; 	//출력 레코드 수
		
		//System.out.println(pageSize);
		//System.out.println(blockPage);
		
		//현재 페이지 확인 
		int pageNum = 1; 
		String pageTemp = request.getParameter("pageNum");  
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp); 	//  값이 비어 있지 않을때 넘오논 페이지 변수를 정수로 변환해서 저장 
		}
		
		//목록에 출력할 게시물 범위 계산 
		int start = (pageNum -1) * pageSize + 1 ;  //첫 게시물 번호 
		int end = pageNum * pageSize;     //마지막 게시물 번호 
		
		//뷰 페이지에 값을 던져줌     
		map.put("start", start); 
		map.put("end", end);
		
		

	
        List<placeDTO> boardLists = pdao.selectListPage(map);  // 게시물 목록 받기
        List<placeDTO> resLists = pdao.selectListPage(map);  // 게시물 목록 받기
        
        pdao.close(); // DB 연결 닫기
	
        
		
		
		
		placeDTO pdto = pdao.selectView(idx);
		pdao.close();
		
		pdto.setReservationUser(res_user);
		pdto.setReservationDate(res_date);
		
		
		request.setAttribute("boardLists", boardLists);  //DataBase에서 Select한 결과값
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
