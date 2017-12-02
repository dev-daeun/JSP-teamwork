package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.ProductDto;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDao dao = new ProductDao();
			String category = request.getQueryString().substring(9);
			ArrayList<ProductDto> products = dao.getProductsByCategory(category);
			request.setAttribute("productList", products);
			switch(category){
				case "perl": request.setAttribute("category", "진주"); break; 
				case "sand": request.setAttribute("category", "색모래"); break;
				case "etc": request.setAttribute("category", "기타");
			}
			request.getRequestDispatcher("/productInfo/list.jsp?category="+category).forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
