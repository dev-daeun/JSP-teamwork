package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;
import service.UserService;


public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	   request.getRequestDispatcher("/userInfo/signup.jsp").forward(request, response);
   }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		request.setCharacterEncoding("UTF-8");
		//(키, 값)의 형태로 들어오는 값들을 저장.
		HashMap<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("닉네임", request.getParameter("nickname"));
		userInfo.put("이메일 주소", request.getParameter("email"));
		userInfo.put("비밀번호", request.getParameter("password"));
		userInfo.put("재확인용 비밀번호", request.getParameter("checkPassword"));
		userInfo.put("핸드폰 번호", request.getParameter("phone"));
		userInfo.put("시/도", request.getParameter("add1"));
		userInfo.put("군/구", request.getParameter("add2"));
		userInfo.put("상세 주소", request.getParameter("add3"));
		try{
			Iterator<String> keys = userInfo.keySet().iterator();
			//map을 순회하면서 null값(사용자가 입력하지 않은 값)이 있는지 확인하고, 있으면 에러 던짐.(사용자 입력값의 예)
			while(keys.hasNext()){
				String key = keys.next();
				if(userInfo.get(key)=="") {
					response.sendError(400, key+"를/을 입력하세요.");
					return;
				}
			}

			if(!request.getParameter("password").equals(request.getParameter("checkPassword"))) {
				response.sendError(400, "비밀번호를 재확인해주세요.");
				return;
			}
			
			UserDao dao = new UserDao();
			UserDto user = new UserDto();		
			String address = request.getParameter("add1")+" "+request.getParameter("add2")+" "+request.getParameter("add3");
			user.setEmail(request.getParameter("email"));
			user.setNickname(request.getParameter("nickname"));
			user.setPassword(request.getParameter("password"));
			user.setPhone(request.getParameter("phone"));
			user.setAddress(address);
			
			dao.insert(user);
			request.getRequestDispatcher("/userInfo/signUpComplete.jsp").forward(request, response);
			
		}catch(ServletException e){
			
		}catch(IOException e){
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			response.setCharacterEncoding("euc-kr");
			response.sendError(500, e.getMessage());
		}finally{
			
		}

		
	}
	

}
