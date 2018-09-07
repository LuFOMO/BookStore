package henu.bookstore.service;

import java.sql.SQLException;

import henu.bookstore.dao.UserDao;
import henu.bookstore.domian.User;
import henu.bookstore.exception.UserException;

public class UserService {

	UserDao ud = new UserDao();
	/**
	 * 注册账号
	 * @param user
	 * @throws UserException
	 */
	public void regist(User user) throws UserException {
		try {
			ud.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("注册失败");
		}
	}
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 * @throws UserException
	 */
	public User login(String username, String password) throws UserException {
		User user = null;
		try {
			user = ud.findUserByUsernameAndPsw(username,password);
			if(user==null){
				throw new UserException("用户名或密码错误");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("用户名或密码错误");
		}
		return user;
	}
	
	/**
	 * 根据id查找用户
	 * @param id
	 * @return
	 * @throws UserException 
	 */
	public User findUser(String id) throws UserException {
		try {
			return ud.findUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("用户查找失败");
		}
	}
	
	/**
	 * 修改账号信息
	 * @param user
	 * @throws UserException
	 */
	public void modifyUser(User user) throws UserException {
		try {
			ud.modify(user);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("用户信息修改失败");
		}
	}

}
