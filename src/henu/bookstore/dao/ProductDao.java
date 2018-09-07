package henu.bookstore.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import henu.bookstore.domian.Order;
import henu.bookstore.domian.OrderItem;
import henu.bookstore.domian.Product;
import henu.bookstore.util.C3P0Util;
import henu.bookstore.util.ManagerThreadLocal;

public class ProductDao {
	/**
	 * 修改商品数量
	 * @param order
	 * @throws SQLException
	 */
	public void updateProductNum(Order order) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		Object[][] params = new Object[order.getOrderItems().size()][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[]{order.getOrderItems().get(i).getBuynum(),order.getOrderItems().get(i).getP().getId()};
		}
		qr.batch(ManagerThreadLocal.getConnection(),"update products set pnum=pnum-? where id=?", params );
	}
	/**
	 * 查找所有图书
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findAllBooks() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products", new BeanListHandler<Product>(Product.class));
	}
	
	/**
	 * 根据id查找图书信息
	 * @param id
	 * @return 
	 * @throws SQLException 
	 */
	public Product findBookById(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where id=?", new BeanHandler<Product>(Product.class),id);
	}
	
	/**
	 * 得到总记录数
	 * @return
	 * @throws SQLException
	 */
	public int count(String category) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql ="select count(*) from products";
		//如果category不是空，就把条件加上
		if(!"".equals(category)){
			sql+=" where category='"+category+"'";
		}
		long l =  (Long)qr.query(sql, new ScalarHandler(1));
		return (int)l;
	}
	
	/**
	 * 查找分页数据
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findBooks(int currentPage, int pageSize, String category) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from products where 1=1";
		List list = new ArrayList();
		if(!"".equals(category)){
			sql+=" and category=?";
			list.add(category);
		}
		sql+=" limit ?,?";
		list.add((currentPage-1)*pageSize);
		list.add(pageSize);
		return qr.query(sql, new BeanListHandler<Product>(Product.class),list.toArray());
		
	}
	
	/**
	 * 根据书名查找图书 模糊查询
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Product> searchBookByName(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where name like ?", new BeanListHandler<Product>(Product.class),"%"+name+"%");
	}

	/**
	 * 根据书名查找图书名称 模糊查询
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Object> searchBookByNames(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select name from products where name like ?",new ColumnListHandler(),"%"+name+"%");
	}
}
