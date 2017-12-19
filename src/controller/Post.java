package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

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
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024, maxRequestSize = 1024 * 1024 * 20) 

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final String UPLOAD_DIC = "/home/kde6260/jsp/ShoppingMall/WebContent/static/";
		
		Part file = null; 
		String title = null;
		String content = null;
		String category = null;
		String fileName = null;
		String filePath = null;
		Random random = new Random();
		int randomNum = Math.abs(random.nextInt());
		
		try{
			for(Part part: request.getParts()){ //multipart는 구분자를 기준으로 여러개의 데이터 들어옴. 헤더도 여러개.
				for(String headerName: part.getHeaderNames()){
					System.out.println("each part's header : "+part.getHeader(headerName));
					if(part.getName().equals("title")) title = getStringFromStream(part.getInputStream());
					if(part.getName().equals("content")) content = getStringFromStream(part.getInputStream());
					if(part.getName().equals("category")) category = getStringFromStream(part.getInputStream());
					if(part.getName().equals("file"))  {
							file = part; // 스트림 데이터가 파일인 경우 
							fileName = part.getSubmittedFileName(); //파일의 이름
							filePath = UPLOAD_DIC+randomNum+"-"+fileName; //storage디렉토리에 저장될 때 파일의 이름
							file.write(filePath); //storage디렉토리에 파일 저장
					}
			            
				}
			}
			
			try {
				if(title=="" || content=="") throw new Error(400, "제목 또는 내용을 입력하세요");
				PostDto post = new PostDto();
				int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());
				post.setUserId(userId);
				post.setCategory(category);
				post.setTitle(title);
				post.setContent(content);
				post.setFilePath(filePath);
				
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
				
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
		//텍스트 타입의 멀티파트 데이터를 스트림에서 읽어오는 함수
	    public String getStringFromStream(InputStream stream) throws IOException { 
	        BufferedReader br = new BufferedReader(new InputStreamReader(stream, "UTF-8")); 
	        StringBuilder sb = new StringBuilder(); 
	        String line = null; 

	        try { 
	            while ((line = br.readLine()) != null) { 
	                sb.append(line + "\n"); 
	            } 
	        } catch (IOException e) { 
	            e.printStackTrace(); 
	        } finally { 
	            try { 
	                stream.close(); 
	            } catch (IOException e) { 
	                e.printStackTrace(); 
	            } 
	        } 
	        return sb.toString(); 
	    } 
	

		
	}

