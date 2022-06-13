package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	
	//��Ű ���� �޼ҵ� 
		//����� �̸�, ��, �����Ⱓ �� �������� ���ο� ��Ű�� ���� 
	public static void makeCookie(HttpServletResponse response, String cName,
			String cValue, int cTime) {
		
		Cookie cookie = new Cookie (cName, cValue); //��Ű ����
		cookie.setPath("/");     		//��� ���� 
		cookie.setMaxAge(cTime); 		//��Ű �����Ⱓ 
		response.addCookie(cookie); 	//��Ű ���� (Client HDD�� ���� )
		
	}
	
	//��Ű ������ �д� �޼ҵ� 
		//����� ��Ű �̸��� ã�� �� ���� ��ȯ�ϴ� �޼ҵ�
	public static String readCookie (HttpServletRequest request, String cName) {
		String  cookieValue = "";    //��ȯ �� 
		
		Cookie[] cookies = request.getCookies(); 
		if (cookies != null) {
			for (Cookie c : cookies) {
				String cookieName = c.getName(); 
				
				//�Ű������� ��ǲ�Ǵ� cName ������ �ش��ϴ� �̸��� value�� ���� 
				if (cookieName.equals(cName)) {
					cookieValue = c.getValue();   
				}												
			}
		}	
		return cookieValue; 	
	}
		
	
	//��Ű ���� �޼ҵ� 
		//����� �̸��� ��Ű�� �����ϴ� �޼ҵ� 
	
	public static void deleteCookie (HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0); 
	}
	

}
