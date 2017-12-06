package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/SignOut")
public class SignOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao;
    
	/* 로그아웃 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("uid", null);
		request.getRequestDispatcher("/main").forward(request, response);
	}

	/* 회원탈퇴 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao = new UserDao();
		int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		try {
			dao.delete(userId);
			request.getSession().setAttribute("uid", null);
			request.getRequestDispatcher("/main").forward(request, response);

		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
