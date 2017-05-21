package com.easeMusic.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easeMusic.model.Music;
import com.easeMusic.model.PlayList;
 

@Repository
public class MusicDaoImpl implements MusicDao {
	
	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public ArrayList<Music> findHot(int no) {
		// TODO Auto-generated method stub
		
		Query query = sessionFactory.getCurrentSession().createQuery("from Music");  
        List list = query.list();
		
		ArrayList<Music> music = new ArrayList<Music>();
		for(int i = 0;i<list.size();i++){
			Music ms = new Music();
			ms = (Music)list.get(i);
			music.add(ms);
		}
		
		return music;
	}

	@Override
	public void de(String no) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession()
		.createQuery("delete Music where idno=:no")
		.setParameter("no", no).executeUpdate();
	}

	@Override
	public Music fd(String no) {
		// TODO Auto-generated method stub
		return (Music)sessionFactory.getCurrentSession()
		.createQuery("from Music p where p.idno= :no")
		.setParameter("no", no)
		.uniqueResult();
	}

	


}
