package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import dto.CartDto;
import dto.CartProductDto;
import dto.ProductDto;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CartDao dao = new CartDao();
			int userId =  Integer.parseInt(request.getSession().getAttribute("uid").toString());
			ArrayList<CartProductDto> cartList = dao.getCartByUserId(userId, 0);
			
			int totalPrice = 0;
			for(CartProductDto element: cartList){
				totalPrice += element.getProduct().getPrice();
			}
			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
			int productCode = Integer.parseInt(request.getParameter("productCode"));
			try {
				
				CartDto newCart = new CartDto();
				newCart.setUserId(userId);
				newCart.setProductCode(productCode);
				
				CartDao dao = new CartDao();
				
				ArrayList<CartProductDto> cartList = dao.getCartByUserId(userId, 0);
				
				for(CartProductDto element: cartList){
					if(element.getProduct().getCode()==productCode) {
						response.sendError(400);
						return;
					}
				}
				dao.insert(newCart);
				
				response.sendRedirect(request.getRequestURI()+"?code="+productCode);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	}

}
