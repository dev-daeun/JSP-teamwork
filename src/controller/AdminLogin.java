package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dto.AdminDto;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/userInfo/adminLogin.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
			try {
				if(username=="" || password==""){
					throw new Error(400, "아이디와 비밀번호를 입력하세요.");
				}
				
				adminDao = new AdminDao();
				AdminDto admin = adminDao.selectByUsername(username);
				if(admin.getUsername()==null) {
					throw new Error(400, "입력하신 정보로 관리자 정보를 찾을 수 없습니다.");
				}
				else if(!admin.getPassword().equals(password)) {
					throw new Error(401, "잘못된 비밀번호 입니다.");
				}
				else{
					request.getSession().setAttribute("aid", admin.getId());
					request.getRequestDispatcher("/main").forward(request, response);
				}
			} catch (Error | ClassNotFoundException | SQLException e) {
				response.setCharacterEncoding("euc-kr");
				request.setAttribute("error", e);
				request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
			}
	}

}
