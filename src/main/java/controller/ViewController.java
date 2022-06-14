package controller;

import java.io.IOException;
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
import review.reviewDAO;
import review.reviewDTO;
import utils.BoardPage;

	


@WebServlet("/view.do")
public class ViewController extends HttpServlet {

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			
			//게시물 정보 불러 오기 ( 1. 조회수 증가, 2.게시물 정보 가져오기) 
			placeDAO dao = new placeDAO(); 
			
			String idx = req.getParameter("placeID"); 
			
			//게시물의 자세한 정보 값 가져오기
			placeDTO dto = dao.selectView(idx); 
			dao.close();   //객체 반납 
			
			//DataBase 의  content 컬럼의 \r\n  <== <<Enter>>을 "<br /> 태그로 변환 
			dto.setPlaceTitle(dto.getPlaceTitle().replaceAll("\r\n", "<br/>"));
			dto.setPlaceIntroduce(dto.getPlaceIntroduce().replaceAll("\r\n", "<br/>"));
			dto.setPlaceRule(dto.getPlaceRule().replaceAll("\r\n", "<br/>"));
			//게시물 (dto) 객체를 view페이지로 전달하기 변수 값 저장 
			
			req.setAttribute("location", dto.getLocation());
			req.setAttribute("dto", dto); 
			req.getRequestDispatcher("/detail.jsp").forward(req, resp); 
			
			
			
			
			
			
			
			
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		}
		
		
}


