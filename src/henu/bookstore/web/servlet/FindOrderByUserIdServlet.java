package henu.bookstore.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.Order;
import henu.bookstore.domian.User;
import henu.bookstore.service.OrderService;

public class FindOrderByUserIdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("user");
		OrderService os = new OrderService();
		List<Order> order = os.findOrderByUserId(user.getId());
		request.setAttribute("order", order);
		
		request.getRequestDispatcher("jsp/orderlist.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
