package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("/userInfo/login.jsp").forward(request, response);
	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if(email=="" || password == ""){
			response.sendError(400, "이메일과 비밀번호를 입력하세요");
			return;
		}
		
		try {
			UserDao dao = new UserDao();
			UserDto userInfo = dao.selectByEmail(email);
			
			if(userInfo.getEmail()==null) {
				response.sendError(401, "입력하신 이메일로 회원정보를 찾을 수 없습니다.");
				return;
			}

			if(!userInfo.getPassword().equals(password)){
				response.sendError(401, "비밀번호가 일치하지 않습니다.");
				return;
			}
			
			response.sendRedirect("/ShoppingMall/main");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
