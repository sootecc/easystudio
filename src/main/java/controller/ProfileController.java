package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import place.placeDAO;
import place.placeDTO;
import user.userDAO;
import user.userDTO;

@WebServlet("/profile.do")
public class ProfileController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userDAO udao = new userDAO();
		String uid = req.getParameter("userID");
		userDTO udto = udao.getuserDTO(uid);
		udao.close();
		
		placeDAO pdao = new placeDAO();
		String puid = uid;
		placeDTO pdto = pdao.selectView_user(puid);
		
		
		//ÇÁ·ÎÇÊ
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<placeDTO> boardLists = pdao.selectListPage(map);
		pdao.close();
		
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("udto", udto);
		req.setAttribute("pdto", pdto);
		
		req.getRequestDispatcher("/hostprofile.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
