package com.easeMusic.Dao;

import com.easeMusic.model.User;

public interface UserDao {
	public void add(User user);	 
	public User findByNo(String no);
}
