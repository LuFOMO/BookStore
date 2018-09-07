package henu.bookstore.service;

import java.sql.SQLException;
import java.util.List;

import henu.bookstore.dao.OrderDao;
import henu.bookstore.dao.OrderItemDao;
import henu.bookstore.dao.ProductDao;
import henu.bookstore.domian.Order;
import henu.bookstore.exception.OrderException;
import henu.bookstore.util.ManagerThreadLocal;

public class OrderService {
	OrderDao orderDao = new OrderDao();
	OrderItemDao orderItem = new OrderItemDao();
	ProductDao productDao = new ProductDao();
	public void addOrder(Order order){
		try {
			ManagerThreadLocal.startTransacation();
			orderDao.addOrder(order);
			orderItem.addOrder(order);
			productDao.updateProductNum(order);
			ManagerThreadLocal.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			ManagerThreadLocal.rollback();
		}
	}
	public List<Order> findOrderByUserId(int id) {
		try {
			return orderDao.findOrderByUserId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public Order findOrderByOrderId(String id) {
		try {
			return orderDao.findOrderByOrderId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void modifyOrderState(String orderid) throws OrderException {
		try {
			orderDao.modifyOrderState(orderid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new OrderException("修改失败");
		}
	}
}
