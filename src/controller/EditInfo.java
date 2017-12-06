package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;

/**
 * Servlet implementation class EditInfo
 */
@WebServlet("/EditInfo")
public class EditInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao;   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("uid")==null){
			request.getRequestDispatcher("/userInfo/login.jsp").forward(request, response);
			return;
		}
		int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		try {
			dao = new UserDao();
			UserDto userInfo = dao.selectByUserId(userId);
			request.setAttribute("email", userInfo.getEmail());
			request.setAttribute("phone", userInfo.getPhone());
			request.setAttribute("password", userInfo.getPassword());
			request.setAttribute("nickname", userInfo.getNickname());
			request.setAttribute("address", userInfo.getAddress());
			request.setAttribute("mileage", userInfo.getMileage());
			request.getRequestDispatcher("/userInfo/editInfo.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("uid")==null){
			request.getRequestDispatcher("/userInfo/login.jsp").forward(request, response);
			return;
		}
		request.setCharacterEncoding("UTF-8");
	
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String address = request.getParameter("address");
		String checkPassword = request.getParameter("checkPassword");
		
		//(키, 값)의 형태로 들어오는 값들을 저장.
		HashMap<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("닉네임", nickname);
		userInfo.put("이메일 주소", email);
		userInfo.put("비밀번호", password);
		userInfo.put("재확인용 비밀번호", checkPassword);
		userInfo.put("핸드폰 번호", phone);
		userInfo.put("주소", address);
	
		
		
		Iterator<String> keys = userInfo.keySet().iterator();
			//map을 순회하면서 null값(사용자가 입력하지 않은 값)이 있는지 확인하고, 있으면 에러 던짐.(사용자 입력값의 예)
		while(keys.hasNext()){
			String key = keys.next();
			if(userInfo.get(key)=="") {
				response.sendError(400, key+"를/을 입력하세요.");
				return;
			}
		}
		

		if(!password.equals(checkPassword)) {
			response.sendError(400, "비밀번호를 재확인해주세요.");
			return;
		}
		
		UserDto edited = new UserDto();
		int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		edited.setEmail(email);
		edited.setPhone(phone);
		edited.setNickname(nickname);
		edited.setPassword(password);
		edited.setAddress(address);
		
		dao = new UserDao();
		try {
			dao.update(edited, userId);
			request.getRequestDispatcher("/userInfo/editComplete.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
