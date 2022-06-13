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
		// Get 방식 요청 처리
		
		//뷰페이지로 이동
		request.getRequestDispatcher("/detail.jsp").forward(request, response);		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post 방식 요청 처리 
		//Write.jsp 페이지에서 전송을 클릭했을때 form에서 넘어오는 변수의 값을 처리
		
		//form에서 파일을 전송하므로 cos.jar 라이브러리의 객체 생성후 변수의 값을 받아야 한다. 
		
		//1. 파일 업로드 처리 ===============================================
			//saveDirectory :  변수에 업로드할 파일을 저장할 서버의 물리적인 경로를 저장.
		
			String saveDirectory = request.getServletContext().getRealPath("/images/uploads"); 
			
			//maxPostSize : 업로드할 최대 용량 ( web.xml  <== 1MB ) 
			
			ServletContext application = getServletContext(); 
			int maxPostSize =102400000;
			
			//파일 업로드 객체 생성  
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
			//객체 생성 실패시 처리 할 내용 
			if (mr == null) {  // 객체 생성 실패 ( 1MB 이상의 용량의 파일 전송시 ) 
				JSFunction.alertLocation(response, "첨부 용량이 초과 되었습니다. ", "./write.do");
			
				return;		
			}
		
		
		//2.파일 업로드 외 처리 (Form의 변수 값 처리 )=============================
			//폼에서 넘겨받은 값을 받아서 DTO(VO) 에 Setter 주입을 하고 DAO에 Insert 메소드에 던져줌. 
			reviewDTO dto = new reviewDTO (); 
			dto.setReviewIndex(Integer.parseInt(mr.getParameter("reviewIndex"))); 
			dto.setReviewPlaceID(Integer.parseInt(mr.getParameter("reviewPlaceID"))); 
			dto.setReviewUserID(mr.getParameter("reviewText"));
			dto.setReviewDate(mr.getParameter("reviewText")); 
			dto.setReviewText(mr.getParameter("reviewText")); 
			
			//원본 파일 이름과 저장 파일이름 설정
									
			
			
			// DTO에 객체를 DAO의 insertWrite(dto) 메소드를 호출해서 DB에 저장 
			reviewDAO dao = new reviewDAO(); 
			
			int result = dao.insertWrite(dto); 
			
			//객체 종료 메소드 호출 (rs, stmt, psmt, con 모두 종료) 
			dao.close();  
			
			
			if (result == 1) {  
				response.sendRedirect("./view.do"); 
			}
			
			//글쓰기 실패일때 이동할 페이지 
			if (result == 0) {	//글쓰기 실패 일때 다시 글쓰기 페이지로 이동
				response.sendRedirect("./writereview.do"); 
			}
			
			
		
	}
}
