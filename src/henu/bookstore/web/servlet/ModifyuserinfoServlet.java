package henu.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import henu.bookstore.domian.User;
import henu.bookstore.service.UserService;

public class ModifyuserinfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//封装表单数据
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			UserService us = new UserService();
			us.modifyUser(user);
			request.getSession().invalidate();//注销登录
			response.sendRedirect(request.getContextPath()+"/jsp/modifyUserInfoSuccess.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write(e.getMessage());
			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
