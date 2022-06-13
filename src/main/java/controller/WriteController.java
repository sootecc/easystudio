package controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import place.placeDAO;
import place.placeDTO;
import utils.JSFunction;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
		
		private static final long serialVersionUID = 1L;


		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// Get ��� ��û ó��
			//List.jsp (view ������) ���� �۾��⸦ Ŭ�� ������ �۾��� ��������(Write.jsp)
			
			//���������� �̵�
			request.getRequestDispatcher("/view.jsp").forward(request, response);		
			
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
				placeDTO dto = new placeDTO (); 
				dto.setPlaceTitle(mr.getParameter("placeTitle")); 
				dto.setUserID(mr.getParameter("userID")); 
				dto.setPlaceIntroduce(mr.getParameter("placeIntroduce"));
				dto.setPlaceRule(mr.getParameter("placeRule")); 
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
				dto.setLocation(mr.getParameter("address"));
				//���� ���� �̸��� ���� �����̸� ����
				String fileName = mr.getFilesystemName("ofile");  //clinet�� ÷�������� ������ �ּ� 
					System.out.println("ofile : " + fileName);  //�ּ� ó��
					
				if (fileName != null) {   //÷�� ������ ��� ���� �ʴٶ�� 
					
					//���ο� �����̸����� �����ؼ� ������ ������. (������ �ش������� ������ ��찡 �����Ƿ� )
					String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); 
						System.out.println("now:" + now);  //�ּ�ó�� 
					//Ȯ���ڸ� �߶� ����
					String ext = fileName.substring(fileName.lastIndexOf(".")); 
						System.out.println("ext : " +	ext);  //�ּ�ó�� 
					//������ ������ �����̸� ����
					String newFileName = now + ext; 
						System.out.println(newFileName);
					
					//���ϸ� ����
					File oldFile = new File(saveDirectory + File.separator + fileName); 
					File newFile = new File(saveDirectory + File.separator + newFileName);
						System.out.println("oldFile : " + oldFile);   //�ּ� ó��
						System.out.println("newFile : " + newFile);	  //�ּ� ó��
					oldFile.renameTo(newFile); 
					
					//DTO�� Setter ���� (���� : ������ ���ε� �Ѱ�� ���� )
					String realpath = saveDirectory + "\\"+newFileName;
					System.out.println(realpath);
					
					dto.setRealPath(realpath);
					dto.setOfile(fileName); 		//���� ���� �̸�
					dto.setSfile(newFileName); 		// ������ ����� �����̸� 								
				}
				
				// DTO�� ��ü�� DAO�� insertWrite(dto) �޼ҵ带 ȣ���ؼ� DB�� ���� 
				placeDAO dao = new placeDAO(); 
				
				int result = dao.insertWrite(dto); 
				
				//��ü ���� �޼ҵ� ȣ�� (rs, stmt, psmt, con ��� ����) 
				dao.close();  
				
				//�۾��� �����϶� �̵��� ������ 
				if (result == 1) {  //�۾��� ���� �ϴ� list �������� �̵�
					response.sendRedirect("./list.do"); 
				}
				
				//�۾��� �����϶� �̵��� ������ 
				if (result == 0) {	//�۾��� ���� �϶� �ٽ� �۾��� �������� �̵�
					response.sendRedirect("./write.do"); 
				}
				
				
			
		}

}

	
	

