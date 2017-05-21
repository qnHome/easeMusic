package com.easeMusic.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easeMusic.model.Music;
import com.easeMusic.model.PlayList;
import com.easeMusic.model.Radio;
import com.easeMusic.model.User;
import com.easeMusic.service.LabService;


@Controller
public class EaseController{
	
	@Autowired
	private LabService labService;
	
	@Autowired
	private HttpServletRequest request;
		
	@RequestMapping("/")
	public String index(){
		ArrayList<Music> music = labService.findMusicHot(1);
		ArrayList<PlayList> pl = labService.findMusicList();
		ArrayList<Radio> rd = labService.findMusicRadio();
		//System.out.println(rd.get(0));
		request.getSession().setAttribute("Music", music);
		request.getSession().setAttribute("pl", pl);
		request.getSession().setAttribute("rd", rd);
		return "index";
	}
	
	@RequestMapping("/login")
	public String Login(String u,String p) {
		System.out.println(u+"/"+p);
		User user = labService.findUserByName(u);
		System.out.println(user.getName()+"/"+user.getPwd());
		if(user.getPwd().equals(p)){
			request.getSession().setAttribute("User", user);
//			ArrayList<Music> music = labService.findMusicHot(1);
//			ArrayList<PlayList> pl = labService.findMusicList();
//			//System.out.println(pl.get(0).getListname());
//			request.setAttribute("Music", music);
//			request.setAttribute("pl", pl);
			return "index";
		}
		else{
			return "index";
		}
	}
}
