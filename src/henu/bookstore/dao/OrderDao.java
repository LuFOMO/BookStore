package henu.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import henu.bookstore.domian.Order;
import henu.bookstore.domian.OrderItem;
import henu.bookstore.domian.Product;
import henu.bookstore.util.C3P0Util;
import henu.bookstore.util.ManagerThreadLocal;

public class OrderDao {
	/**
	 * 添加订单
	 * @param order
	 * @throws SQLException
	 */
	public void addOrder(Order order) throws SQLException {
		QueryRunner qr = new QueryRunner();
		qr.update(ManagerThreadLocal.getConnection(),"insert into orders values(?,?,?,?,?,?,?,?) ", order.getId(), order.getMoney(),
				order.getReceiverAddress(), order.getReceiverName(), order.getReceiverPhone(),
				order.getPaystate(), order.getOrdertime(), order.getUser().getId());
	}

	/**
	 * 根据用户id查询订单
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public List<Order> findOrderByUserId(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from orders where user_id=?", new BeanListHandler<Order>(Order.class),id);	
	}

	public Order findOrderByOrderId(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		//得到一个订单
		Order order = qr.query("select * from orders where id=?", new BeanHandler<Order>(Order.class),id);
		//
		List<OrderItem> orderItems = qr.query("select * from OrderItem o,products p where p.id = o.product_id and o.order_id=?", new ResultSetHandler<List<OrderItem>>() {

			@Override
			public List<OrderItem> handle(ResultSet rs) throws SQLException {
				List<OrderItem> orderItems = new ArrayList<OrderItem>();

				while(rs.next()){
					//封装orderItem对象
					OrderItem oi = new OrderItem();
					oi.setBuynum(rs.getInt("buynum"));
					//封装product对象
					Product p = new Product();
					p.setName(rs.getString("name"));
					p.setPrice(rs.getDouble("price"));
					
					oi.setP(p);
					orderItems.add(oi);
				}
				
				return orderItems;
			}
		},id);
		order.setOrderItems(orderItems);
		return order;
	}
/**
 * 修改订单支付状态
 * @param orderid
 * @throws SQLException 
 */
	public void modifyOrderState(String orderid) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update orders set paystate=1 where id=?",orderid);
	}
}
