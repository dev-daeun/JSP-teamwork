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
	private CartDao dao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao = new CartDao();
	
		try {
			 int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
			 ArrayList<CartProductDto> buyList = dao.getCartByUserId(userId, 1);
			 request.setAttribute("buyList", buyList);
			 request.getRequestDispatcher("/productInfo/buyList.jsp").forward(request, response);
			 
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		dao = new CartDao();
		int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		String value = request.getQueryString().substring(6);
		System.out.println(value);
		if(value.equals("delete")){
			int productCode = Integer.parseInt(request.getParameter("code"));
			try {
				dao.delete(userId, productCode, mileage);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			String[] buyList = request.getParameterValues("buyList");
			try {
				 dao.updatePurchased(userId, buyList, mileage);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
