package com.easeMusic.Dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easeMusic.model.User;
 

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	@Override
	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public User findByNo(String no) {
		System.out.println(no);
		return (User)sessionFactory.getCurrentSession()
			.createQuery("from User u where u.name = :name")
			.setParameter("name", no)
			.uniqueResult();
	}

}
