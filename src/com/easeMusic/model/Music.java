package com.easeMusic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Music",schema = "springdb")
public class Music {
	@Id
	@Column(name="idno")
	private String idno;
	@Column(name="name")
	private String name;
	@Column(name="songSinger")
	private String songSinger;
	@Column(name="playurl")
	private String url1;
	@Column(name="downloadurl")
	private String url2;

	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl1() {
		return url1;
	}
	public void setUrl1(String url1) {
		this.url1 = url1;
	}
	public String getUrl2() {
		return url2;
	}
	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	public String getSongSinger() {
		return songSinger;
	}
	public void setSongSinger(String songSinger) {
		this.songSinger = songSinger;
	}
	
	
	
	
}
