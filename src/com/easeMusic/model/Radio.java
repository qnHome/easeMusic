package com.easeMusic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Radio",schema = "springdb")
public class Radio {

	@Id
	@Column(name="id")
	private String id;
	@Column(name="radioName")
	private String radioName;
	@Column(name="radioer")
	private String radioer;
	@Column(name="url")
	private String url;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRadioName() {
		return radioName;
	}
	public void setRadioName(String radioName) {
		this.radioName = radioName;
	}
	public String getRadioer() {
		return radioer;
	}
	public void setRadioer(String radioer) {
		this.radioer = radioer;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	

	
	
	
}
