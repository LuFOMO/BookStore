package henu.bookstore.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import henu.bookstore.domian.Product;
import henu.bookstore.service.ProductService;

public class AddCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		
		ProductService ps = new ProductService();
		Product book = ps.findBookById(id);
		//从session中把购物车取出来
		HttpSession session = request.getSession();
		Map<Product, String> cart = (Map<Product, String>) session.getAttribute("cart");
		int num = 1;
		//如何是第一次访问，没有购物车对象，我们就创建 一个购物车对象
		if(cart==null)
			cart = new HashMap<Product, String>();
		//查看当前集合中是否存在b这本书,如果有就把数据取出来加1;
		if(cart.containsKey(book)){
			num=Integer.parseInt(cart.get(book))+1;
		}
		//把图书放入购物车
		cart.put(book, num+"");
				
		//把cart对象放回到session作用域中
		session.setAttribute("cart", cart);
		
		response.getWriter().write("添加购物车成功！2秒后自动返回");
		response.setHeader("refresh", "2;url="+request.getContextPath()+"/pageServlet");		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
