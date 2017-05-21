package com.easeMusic.Dao;

import java.util.ArrayList;

import com.easeMusic.model.Music;

public interface MusicDao {
	public ArrayList<Music> findHot(int no);
	public void de(String no);
	public Music fd(String no);
}
