package henu.bookstore.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import henu.bookstore.domian.Order;
import henu.bookstore.domian.OrderItem;
import henu.bookstore.domian.Product;
import henu.bookstore.domian.User;
import henu.bookstore.service.OrderService;

public class CreateOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.封装order对象
		Order order =  new Order();
		try {
			BeanUtils.populate(order, request.getParameterMap());
			order.setId(UUID.randomUUID().toString());
			order.setUser((User) request.getSession().getAttribute("user"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//2.获取session对象中的购物车数据
		HttpSession session = request.getSession();
		Map<Product,String> cart = (Map<Product, String>) session.getAttribute("cart");
		
		//3.遍历购物车中的数据，添加到OrderItem对象中,同时把orderItem添加到list集合中
		List<OrderItem> list = new ArrayList<OrderItem>();
		for (Product product : cart.keySet()) {
			OrderItem oi = new OrderItem();
			oi.setOrder(order);
			oi.setP(product);
			oi.setBuynum(Integer.parseInt(cart.get(product)));
			list.add(oi);
		}
		
		//调用业务逻辑
		//4.把集合放到order对象中
		order.setOrderItems(list);
		OrderService os = new OrderService();
		os.addOrder(order);
		
		request.setAttribute("orderid", order.getId());
		request.setAttribute("money", order.getMoney());
		//分发转向
		request.getRequestDispatcher("jsp/pay.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
