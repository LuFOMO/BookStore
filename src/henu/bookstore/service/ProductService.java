package henu.bookstore.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import henu.bookstore.dao.ProductDao;
import henu.bookstore.domian.PageBean;
import henu.bookstore.domian.Product;

public class ProductService {
	//创建一个Dao对象
		static ProductDao productDao = new ProductDao();
		
		public List<Product> findAllBooks(){
			try {
				return productDao.findAllBooks();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

		public Product findBookById(String id) {
			try {
				return productDao.findBookById(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

		//分页显示多条件查询图书信息
		public PageBean searchBooks(int currentPage, int pageSize, String name) {
			try {
				List<Product> books = ProductService.searchBookByName(name);
				
				int count = books.size();
				int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数

				//把5个变量封装到PageBean中，做为返回值
				PageBean pb = new PageBean();
				pb.setProducts(books);
				pb.setCount(count);
				pb.setCurrentPage(currentPage);
				pb.setPageSize(pageSize);
				pb.setTotalPage(totalPage);
				
				return pb;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
			
		}
		
		/**
		 * 根据书名查找图书 模糊查询
		 * @param name
		 * @return
		 * @throws SQLException
		 */
		public static List<Product> searchBookByName(String name) {
			try {
				return productDao.searchBookByName(name);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

		//分页查询
		public PageBean findBooks(int currentPage, int pageSize,String category) {
			
			try {
				int count  = productDao.count(category);//得到总记录数
				int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数
				List<Product> products= productDao.findBooks(currentPage,pageSize,category);
				
				//把5个变量封装到PageBean中，做为返回值
				PageBean pb = new PageBean();
				pb.setProducts(products);
				pb.setCount(count);
				pb.setCurrentPage(currentPage);
				pb.setPageSize(pageSize);
				pb.setTotalPage(totalPage);
				//在pageBean中添加属性，用于点击上一页或下一页时使用
				pb.setCategory(category);
				
				return pb;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		/**
		 * 根据书名查找图书名称 模糊查询
		 * @param name
		 * @return
		 */
		public List<Object> searchBookByNames(String name) {

			try {
				return productDao.searchBookByNames(name);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
