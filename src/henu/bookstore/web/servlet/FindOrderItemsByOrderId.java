package henu.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.bookstore.domian.Order;
import henu.bookstore.service.OrderService;

public class FindOrderItemsByOrderId extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("orderid");
		OrderService os = new OrderService();
		Order order = os.findOrderByOrderId(id);
		
		request.setAttribute("order", order);
		request.getRequestDispatcher("jsp/orderInfo.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
