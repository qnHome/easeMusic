package com.easeMusic.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easeMusic.model.Music;
import com.easeMusic.model.Radio;
 

@Repository
public class RadioDaoImpl implements RadioDao {
	
	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public ArrayList<Radio> findHot() {
		// TODO Auto-generated method stub
		
		Query query = sessionFactory.getCurrentSession().createQuery("from Radio");  
        List list = query.list();
		
		ArrayList<Radio> music = new ArrayList<Radio>();
		for(int i = 0;i<list.size();i++){
			Radio ms = new Radio();
			ms = (Radio)list.get(i);
			music.add(ms);
		}
		
		return music;
	}

	@Override
	public void de(String no) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession()
		.createQuery("delete Radio where id=:no")
		.setParameter("no", no).executeUpdate();
		
	}

	@Override
	public Radio fd(String no) {
		// TODO Auto-generated method stub
		return (Radio)sessionFactory.getCurrentSession()
				.createQuery("from Radio p where p.id= :no")
				.setParameter("no", no)
				.uniqueResult();
	}

	


}
