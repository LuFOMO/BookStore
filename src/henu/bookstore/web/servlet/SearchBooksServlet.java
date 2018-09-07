package henu.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.PageBean;
import henu.bookstore.service.ProductService;

public class SearchBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//初始化每页显示的记录数
		int pageSize = 4;
		//当前页
		int currentPage = 1;
		String name = request.getParameter("name");
		
		//查询分页
		ProductService ps = new ProductService();
		PageBean pb = ps.searchBooks(pageSize, currentPage, name);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("jsp/product_list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
