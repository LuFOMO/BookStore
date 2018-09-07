package henu.bookstore.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import henu.bookstore.domian.User;
import henu.bookstore.util.C3P0Util;

public class UserDao {

	/**
	 * 注册账号
	 * @param user
	 * @throws SQLException
	 */
	public void regist(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "INSERT INTO USER(username,PASSWORD,gender,email,telephone,introduce,registtime) VALUES (?,?,?,?,?,?,?)";
		qr.update(sql,user.getUsername(),user.getPassword(),user.getGender(),
				user.getEmail(),user.getTelephone(),user.getIntroduce(),user.getRegistTime());
	}


	/**
	 * 根据用户名和密码查找账户信息
	 * @param username
	 * @param password
	 * @return 
	 * @throws SQLException 
	 */
	public User findUserByUsernameAndPsw(String username, String password) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from user where username=? and password=?",new BeanHandler<User>(User.class),username,password);
		 
	}


	public User findUser(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from user where id=?", new BeanHandler<User>(User.class),id);
	}
	
	
	public void modify(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update user set password=?, gender=?,telephone=?where id=?",user.getPassword(),user.getGender(),user.getTelephone(),user.getId());
	}
}
