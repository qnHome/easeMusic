package com.easeMusic.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easeMusic.model.PlayList;
 

@Repository
public class ListDaoImpl implements ListDao {
	
	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public ArrayList<PlayList> findHot() {
		// TODO Auto-generated method stub
		
		Query query = sessionFactory.getCurrentSession().createQuery("from PlayList");  
        List list = query.list();
		
		ArrayList<PlayList> music = new ArrayList<PlayList>();
		for(int i = 0;i<list.size();i++){
			PlayList ms = new PlayList();
			ms = (PlayList)list.get(i);
			music.add(ms);
		}
		
		return music;
	}

	@Override
	public void de(String no) {
		// TODO Auto-generated method stub
				sessionFactory.getCurrentSession()
				.createQuery("delete PlayList where id=:no")
				.setParameter("no", no).executeUpdate();
		
	}

	@Override
	public PlayList fd(String no) {
		// TODO Auto-generated method stub
		System.out.println(no);
		return (PlayList)sessionFactory.getCurrentSession()
		.createQuery("from PlayList p where p.id = :no")
		.setParameter("no", no)
		.uniqueResult();
	}

	


}
