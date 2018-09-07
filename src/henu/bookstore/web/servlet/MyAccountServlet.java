package henu.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.User;

public class MyAccountServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
			if("admin".equals(user.getRole())) {
				response.sendRedirect("http://localhost:8081/BookStoreManager/home.jsp");
			}else {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/jsp/myAccount.jsp").forward(request, response);
			}
		}else
			response.sendRedirect("jsp/login.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
