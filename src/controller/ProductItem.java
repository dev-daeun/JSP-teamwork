package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.ProductDto;

/**
 * Servlet implementation class ProductItem
 */
@WebServlet("/ProductItem")
public class ProductItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ProductDao dao = new ProductDao();
			int code = Integer.parseInt(request.getQueryString().substring(5));
			ProductDto item = dao.getProductByCode(code);
			if(item.getName()==null){
				response.sendError(404, "해당 품목을 찾을 수 없습니다.");
				return;
			}
			request.setAttribute("item", item);
			request.getRequestDispatcher("/productInfo/item.jsp?code="+code).forward(request, response);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
