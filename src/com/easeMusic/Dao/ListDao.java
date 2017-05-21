package com.easeMusic.Dao;

import java.util.ArrayList;

import com.easeMusic.model.PlayList;

public interface ListDao {
	public ArrayList<PlayList> findHot();
	public void de(String no);
	public PlayList fd(String no);
}
