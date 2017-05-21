package com.easeMusic.Dao;

import java.util.ArrayList;

import com.easeMusic.model.Radio;

public interface RadioDao {
	public ArrayList<Radio> findHot();
	public void de(String no);
	public Radio fd(String no);
}
