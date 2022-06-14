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
			
			
			
			//�Խù� ���� �ҷ� ���� ( 1. ��ȸ�� ����, 2.�Խù� ���� ��������) 
			placeDAO dao = new placeDAO(); 
			
			String idx = req.getParameter("placeID"); 
			
			//�Խù��� �ڼ��� ���� �� ��������
			placeDTO dto = dao.selectView(idx); 
			dao.close();   //��ü �ݳ� 
			
			//DataBase ��  content �÷��� \r\n  <== <<Enter>>�� "<br /> �±׷� ��ȯ 
			dto.setPlaceTitle(dto.getPlaceTitle().replaceAll("\r\n", "<br/>"));
			dto.setPlaceIntroduce(dto.getPlaceIntroduce().replaceAll("\r\n", "<br/>"));
			dto.setPlaceRule(dto.getPlaceRule().replaceAll("\r\n", "<br/>"));
			//�Խù� (dto) ��ü�� view�������� �����ϱ� ���� �� ���� 
			
			req.setAttribute("location", dto.getLocation());
			req.setAttribute("dto", dto); 
			req.getRequestDispatcher("/detail.jsp").forward(req, resp); 
			
			
			
			
			
			
			
			
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		}
		
		
}


