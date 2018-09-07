package henu.bookstore.web.servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import henu.bookstore.domian.User;
import henu.bookstore.exception.UserException;
import henu.bookstore.service.UserService;

public class UserServlet extends BaseServlet {
	
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserService us = new UserService();
		try {
			User user = us.login(username,password);
			//如果是管理员则重定向到后台系统
			if("admin".equals(user.getRole())){
				response.sendRedirect("http://localhost:8087/BookStoreManager/");
			}else {
				request.getSession().setAttribute("user", user);
				request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
			}
		} catch (UserException e) {
			request.setAttribute("user_msg", e.getMessage());
			request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
		}
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//处理验证码
		String ckcode = request.getParameter("ckCode");
		String checkcode_session = (String) request.getSession().getAttribute("checkcode_session");
		if(!checkcode_session.equals(ckcode)){//如果两个验证码不一致，跳回注册面
			request.setAttribute("msg", "验证码错误！");
			request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
			return ;
		}
		//获取表单数据
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			//调用业务逻辑
			UserService us = new UserService();
			us.regist(user);
			//分发转向
			request.getSession().setAttribute("user", user);//把用户信息封装到session对象中
			request.getRequestDispatcher("jsp/registersuccess.jsp").forward(request, response);
		}catch(UserException e){
			request.setAttribute("user_msg", e.getMessage());
			request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
			return;
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	/**
	 * 用户退出
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();//使session销毁
		response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
	}
	
	/**
	 * 根据id查找用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		UserService us = new UserService();
		try {
			User user = us.findUser(id);
			request.setAttribute("u", user);
			request.getRequestDispatcher("jsp/modifyuserinfo.jsp").forward(request, response);
		} catch (UserException e) {
			response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
		}
	}

}
