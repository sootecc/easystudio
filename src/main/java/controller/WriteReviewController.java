package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import review.reviewDAO;
import review.reviewDTO;
import utils.JSFunction;

@WebServlet("/writereview.do")
public class WriteReviewController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get ��� ��û ó��
		
		//���������� �̵�
		request.getRequestDispatcher("/detail.jsp").forward(request, response);		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post ��� ��û ó�� 
		//Write.jsp ���������� ������ Ŭ�������� form���� �Ѿ���� ������ ���� ó��
		
		//form���� ������ �����ϹǷ� cos.jar ���̺귯���� ��ü ������ ������ ���� �޾ƾ� �Ѵ�. 
		
		//1. ���� ���ε� ó�� ===============================================
			//saveDirectory :  ������ ���ε��� ������ ������ ������ �������� ��θ� ����.
		
			String saveDirectory = request.getServletContext().getRealPath("/images/uploads"); 
			
			//maxPostSize : ���ε��� �ִ� �뷮 ( web.xml  <== 1MB ) 
			
			ServletContext application = getServletContext(); 
			int maxPostSize =102400000;
			
			//���� ���ε� ��ü ����  
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
			//��ü ���� ���н� ó�� �� ���� 
			if (mr == null) {  // ��ü ���� ���� ( 1MB �̻��� �뷮�� ���� ���۽� ) 
				JSFunction.alertLocation(response, "÷�� �뷮�� �ʰ� �Ǿ����ϴ�. ", "./write.do");
			
				return;		
			}
		
		
		//2.���� ���ε� �� ó�� (Form�� ���� �� ó�� )=============================
			//������ �Ѱܹ��� ���� �޾Ƽ� DTO(VO) �� Setter ������ �ϰ� DAO�� Insert �޼ҵ忡 ������. 
			reviewDTO dto = new reviewDTO (); 
			dto.setReviewIndex(Integer.parseInt(mr.getParameter("reviewIndex"))); 
			dto.setReviewPlaceID(Integer.parseInt(mr.getParameter("reviewPlaceID"))); 
			dto.setReviewUserID(mr.getParameter("reviewText"));
			dto.setReviewDate(mr.getParameter("reviewText")); 
			dto.setReviewText(mr.getParameter("reviewText")); 
			
			//���� ���� �̸��� ���� �����̸� ����
									
			
			
			// DTO�� ��ü�� DAO�� insertWrite(dto) �޼ҵ带 ȣ���ؼ� DB�� ���� 
			reviewDAO dao = new reviewDAO(); 
			
			int result = dao.insertWrite(dto); 
			
			//��ü ���� �޼ҵ� ȣ�� (rs, stmt, psmt, con ��� ����) 
			dao.close();  
			
			
			if (result == 1) {  
				response.sendRedirect("./view.do"); 
			}
			
			//�۾��� �����϶� �̵��� ������ 
			if (result == 0) {	//�۾��� ���� �϶� �ٽ� �۾��� �������� �̵�
				response.sendRedirect("./writereview.do"); 
			}
			
			
		
	}
}
