package henu.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.PageBean;
import henu.bookstore.service.ProductService;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//初始化每页显示的记录数
		int pageSize = 4;
		//当前页
		int currentPage = 1;
		
		String category = request.getParameter("category");
		String currPage = request.getParameter("currentPage");
		if(category==null)
			category = "";
		if(currPage!=null&&!"".equals(currPage)){//第一次访问资源时，currPage可能是null
			currentPage = Integer.parseInt(currPage);
		}
		//查询分页
		ProductService ps = new ProductService();
		PageBean pb = ps.findBooks(currentPage,pageSize,category);
		request.setAttribute("pb", pb);
		request.setAttribute("bcategory", category);
		request.getRequestDispatcher("jsp/product_list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
