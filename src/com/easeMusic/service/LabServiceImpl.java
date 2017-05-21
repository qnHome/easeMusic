package com.easeMusic.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easeMusic.Dao.MusicDao;
import com.easeMusic.Dao.ListDao;
import com.easeMusic.Dao.UserDao;
import com.easeMusic.Dao.RadioDao;
import com.easeMusic.model.Music;
import com.easeMusic.model.PlayList;
import com.easeMusic.model.Radio;
import com.easeMusic.model.User;


@Service
public class LabServiceImpl implements LabService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private MusicDao mDao;
	
	@Autowired
	private ListDao lDao;
	
	@Autowired
	private RadioDao rDao;
	
	@Override
	public User findUserByName(String no) {
		
		return userDao.findByNo(no);
	}

	@Override
	public ArrayList<Music> findMusicHot(int no) {
		// TODO Auto-generated method stub
		
		return mDao.findHot(no);
	}

	@Override
	public ArrayList<PlayList> findMusicList() {
		// TODO Auto-generated method stub
		return lDao.findHot();
	}

	@Override
	public ArrayList<Radio> findMusicRadio() {
		// TODO Auto-generated method stub
		return rDao.findHot();
	}

	@Override
	public void findListByNo(String no) {
		// TODO Auto-generated method stub
		lDao.de(no);
		
		
	}

	@Override
	public PlayList findLisByNo(String no) {
		// TODO Auto-generated method stub
		return lDao.fd(no);
	}

	@Override
	public Music findMusByNo(String no) {
		// TODO Auto-generated method stub
		return mDao.fd(no);
	}

	@Override
	public void findMusicByNo(String no) {
		// TODO Auto-generated method stub
		mDao.de(no);
		
	}

	@Override
	public Radio findradByNo(String no) {
		// TODO Auto-generated method stub
		return rDao.fd(no);
	}
	
	@Override
	public void findradioByNo(String no) {
		// TODO Auto-generated method stub
		rDao.de(no);
		
	}



}
