package henu.bookstore.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.service.ProductService;

public class SearchBookNamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		ProductService ps = new ProductService();
		List<Object> list = ps.searchBookByNames(name);
		
		//把集合中的数据转换为字符串返回到网页
		String str = "";
		for (int i = 0; i < list.size(); i++) {
			if(i>0){
				str+=",";
			}
			str+=list.get(i);
		}

		System.out.println(str);
		//把数据响应到客户端
		response.getWriter().write(str);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String name = request.getParameter("name");
		ProductService ps = new ProductService();
		List<Object> list = ps.searchBookByNames(name);
		
		//把集合中的数据转换为字符串返回到网页
		String str = "";
		for (int i = 0; i < list.size(); i++) {
			if(i>0){
				str+=",";
			}
			str+=list.get(i);
		}

		//把数据响应到客户端
		response.getWriter().write(str);
	}

}
