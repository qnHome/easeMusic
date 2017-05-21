package com.easeMusic.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easeMusic.model.Music;
import com.easeMusic.model.PlayList;
import com.easeMusic.model.Radio;
import com.easeMusic.model.User;

@Service
public interface LabService {
	@Transactional
	User findUserByName(String no);
	@Transactional
	ArrayList<Music> findMusicHot(int no);
	@Transactional
	ArrayList<PlayList> findMusicList();
	@Transactional
	ArrayList<Radio> findMusicRadio();
	@Transactional
	void findListByNo(String no);
	@Transactional
	PlayList findLisByNo(String no);
	@Transactional
	Music findMusByNo(String no);
	@Transactional
	void findMusicByNo(String no);
	@Transactional
	Radio findradByNo(String no);
	@Transactional
	void findradioByNo(String no);


}
