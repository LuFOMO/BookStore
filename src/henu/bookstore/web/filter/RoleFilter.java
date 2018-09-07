
package henu.bookstore.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.User;

public class RoleFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		//强转
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		//处理业务逻辑
		//从session中获取user对象
		User user = (User) req.getSession().getAttribute("user");
		if(user!=null){
			if(!"admin".equals(user.getRole())){
				res.getWriter().write("权限不足，无法访问");
				res.setHeader("refresh", "2;url="+req.getContextPath()+"/jsp/index.jsp");
				return;
			}
			chain.doFilter(req, res);
		}
		res.sendRedirect(req.getContextPath()+"/jsp/login.jsp");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
