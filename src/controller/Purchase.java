package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import dto.CartProductDto;


@WebServlet("/Purchase")
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDao dao = new CartDao();
	
		try {
			 int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
			 ArrayList<CartProductDto> buyList = dao.getCartByUserId(userId, 1);
			 request.setAttribute("buyList", buyList);
			 request.getRequestDispatcher("/buyList.jsp").forward(request, response);
			 
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDao dao = new CartDao();
		String[] buyList = request.getParameterValues("buyList");
		try {
			 dao.updatePurchased(Integer.parseInt(request.getSession().getAttribute("uid").toString()), buyList);
			 request.getRequestDispatcher("/purchase").forward(request, response);
			 
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
