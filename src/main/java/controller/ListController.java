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
import utils.BoardPage;

@WebServlet("/list.do")
public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Get ������� ��û�� ������ �������� ó�� 
		
		//1. DAO ��ü ���� (Model : ����Ͻ� ���� ó�� ) 
		placeDAO dao = new placeDAO(); 
		
		//2.�信 ������ �Ű����� ����� �� ���� (Key,Value) 
	
        Map<String, Object> map = new HashMap<String, Object>();

        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        if (searchWord != null) {
            // ������Ʈ������ ���޹��� �Ű����� �� �˻�� �ִٸ� map�� ����
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount = dao.selectCount(map);  // �Խù� ���� (�Խù����� start, end) 
		
	/* ����¡ ó�� �κ� start */
		
			//web.xml �� ���õ� ������ �ҷ����� 
		ServletContext application = getServletContext(); 
		int pageSize = 20; 	//��� ���ڵ� ��
		int blockPage = 5;	//������ �� 
		
		//System.out.println(pageSize);
		//System.out.println(blockPage);
		
		//���� ������ Ȯ�� 
		int pageNum = 1; 
		String pageTemp = req.getParameter("pageNum");  
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
	
        List<placeDTO> boardLists = dao.selectListPage(map);  // �Խù� ��� �ޱ�
        dao.close(); // DB ���� �ݱ�
	
	//���������� ���� �� �Ű��������� �߰� 
        //utils.BoardPage : ����¡ ó���ϴ� Ŭ����, pagingStr �޼ҵ� : static �޼ҵ�
    String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
            blockPage, pageNum, "/list.do");  // �ٷΰ��� ���� HTML ���ڿ�
    
    //View�������� ������ ���� ���� 
    
    map.put("pagingImg", pagingImg);
    map.put("totalCount", totalCount);
    map.put("pageSize", pageSize);
    map.put("pageNum", pageNum); 
	
	//���������� ������ ����, request ������ ������ �����͸� ������ List.jsp (��������) �� ������ 
    
    req.setAttribute("boardLists", boardLists);  //DataBase���� Select�� �����
    req.setAttribute("map", map);
    req.getRequestDispatcher("./view.jsp").forward(req, resp);
	
	
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Post  ������� ��û�� ������ �������� ó�� 
	}
}
