package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.PostDao;
import dto.PostDto;
import dto.UserPostDto;

/**
 * Servlet implementation class Post
 */
@WebServlet("/Post")
@MultipartConfig
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostDao dao;  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao = new PostDao();
		try {
			ArrayList<UserPostDto> list = dao.selectAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/postInfo/posts.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
			try {
				if(title=="" || content=="") throw new Error(400, "제목 또는 내용을 입력하세요");
				PostDto post = new PostDto();
				int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
				post.setUserId(userId);
				post.setCategory(category);
				post.setTitle(title);
				post.setContent(content);
	
				
				dao = new PostDao();
				dao.insert(post);
				doGet(request, response);
				
			} catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			}
			catch (Error e) {
				response.setCharacterEncoding("euc-kr");
				request.setAttribute("error", e);
				request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
				response.sendError(e.getStatus(), e.getMessage());
			}
		
	}

}
