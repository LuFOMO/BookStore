package henu.bookstore.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import henu.bookstore.domian.Order;
import henu.bookstore.util.C3P0Util;
import henu.bookstore.util.ManagerThreadLocal;

public class OrderItemDao {
	//添加订单项
	public void addOrder(Order order) throws SQLException{
		QueryRunner qr = new QueryRunner();
		Object[][] params = new Object[order.getOrderItems().size()][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[]{order.getId(),order.getOrderItems().get(i).getP().getId(),order.getOrderItems().get(i).getBuynum()}; 
		}
		qr.batch(ManagerThreadLocal.getConnection(),"insert into orderItem values(?,?,?)", params );
	}
}
