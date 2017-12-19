package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.PostDao;
import dao.ProductDao;
import dto.PostDto;
import dto.ProductDto;
import util.AWSService;

/**
 * Servlet implementation class ProductRegister
 */
@WebServlet("/ProductRegister")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024, maxRequestSize = 1024 * 1024 * 20) 

public class ProductRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/productInfo/register.jsp").forward(request, response);
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
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String UPLOAD_DIC = "/opt/tomcat/webapps/ROOT/static";
		
		System.out.println("called");
		String name = null;
		String description = null;
		String category = null;
		int price = 0;
		Part file = null; 
		String fileName = null;
		String filePath = null;
		Random random = new Random();
		int randomNum = Math.abs(random.nextInt());
		
		
		try{
			for(Part part: request.getParts()){ //multipart는 구분자를 기준으로 여러개의 데이터 들어옴. 헤더도 여러개.
				for(String headerName: part.getHeaderNames()){
					System.out.println("each part's header : "+part.getHeader(headerName));
					if(part.getName().equals("name")) name = getStringFromStream(part.getInputStream());
					if(part.getName().equals("description")) description = getStringFromStream(part.getInputStream());
					if(part.getName().equals("category")) category = getStringFromStream(part.getInputStream());
					if(part.getName().equals("price")) {
						String priceString = (String)getStringFromStream(part.getInputStream());
						String extracted = priceString.substring(0, priceString.length()-1);
						price = Integer.parseInt(extracted);
					}
					if(part.getName().equals("file"))  {
							file = part; // 스트림 데이터가 파일인 경우 
							fileName = randomNum+"-"+part.getSubmittedFileName(); //파일의 이름
							filePath = UPLOAD_DIC+randomNum+"-"+fileName; //storage디렉토리에 저장될 때 파일의 이름
							file.write(filePath); //storage디렉토리에 파일 저장
//							AWSService aws = new AWSService();
//							aws.uploadFile(file, fileName);
					}
			            
				}
			}
			
			try {
				if(name=="" || description=="") throw new Error(400, "상품 이름 또는 설명을 입력하세요");
				ProductDto product = new ProductDto();
				int adminId = Integer.parseInt(request.getSession().getAttribute("aid").toString());
				product.setAdminId(adminId);
				product.setCategory(category);
				product.setName(name);
				product.setPrice(price);
				product.setDescription(description);
				product.setImagePath(filePath);
				
				dao = new ProductDao();
				dao.insert(product);
				request.getRequestDispatcher("/main").forward(request, response);
				
			} catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			} catch (Error e) {
				response.setCharacterEncoding("euc-kr");
				request.setAttribute("error", e);
				request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
				response.sendError(e.getStatus(), e.getMessage());
			} 
				
		}catch(NumberFormatException e){
			response.setCharacterEncoding("euc-kr");
			request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
			response.sendError(400, "가격 입력란에는 숫자만 입력하세요.");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
