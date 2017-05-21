package com.easeMusic.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easeMusic.model.Music;
import com.easeMusic.model.PlayList;
import com.easeMusic.model.Radio;
import com.easeMusic.service.LabService;

import test.test;

@Controller
@RequestMapping("/Home")
public class EaseHomeController {
	
	@Autowired
	private LabService labService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/")
	public String admin(){
		return "admin";
	}
	@RequestMapping("/login")
	public String Login(){
		return "login";
	}
	
	@RequestMapping("/music")
	public String music(){
		ArrayList<Music> music = labService.findMusicHot(1);
		request.setAttribute("Music", music);
		return "music";
	}
	
	@RequestMapping("/user")
	public String user(){
		ArrayList<PlayList> pl = labService.findMusicList();
		request.setAttribute("pl", pl);
		return "user";
	}
	
	@RequestMapping("/radio")
	public String radio(){
		ArrayList<Radio> rd = labService.findMusicRadio();
		request.setAttribute("rd", rd);
		return "radio";
	}
	
	@RequestMapping("/updata")
	public String updata(){
		return "updata";
	}
	
	@RequestMapping("/de_m")
	public String de_m(){
		String no = (String)request.getParameter("no");
		labService.findListByNo(no);
		ArrayList<PlayList> pl = labService.findMusicList();
		request.setAttribute("pl", pl);
		//System.out.println(no);
		return "user";
	}
	
	@RequestMapping("/de_mm")
	public String de_mm(){
		String no = (String)request.getParameter("no");
		labService.findMusicByNo(no);
		ArrayList<Music> music = labService.findMusicHot(1);
		request.setAttribute("Music", music);
		//System.out.println(no);
		return "music";
	}
	
	@RequestMapping("/fd_m")
	public String fd_m(String no){
		PlayList pll = labService.findLisByNo(no);
		request.setAttribute("plt", pll);
		System.out.println(pll);
		return "user";
	}
	
	@RequestMapping("/fd_mm")
	public String fd_mm(String no){
		Music pll = labService.findMusByNo(no);
		request.setAttribute("plt", pll);
		System.out.println(pll);
		return "music";
	}
	@RequestMapping("/fd_r")
	public String fd_r(String no){
		System.out.println(no);
		Radio pll = labService.findradByNo(no);
		request.setAttribute("plt", pll);
		System.out.println(pll);
		return "radio";
	}
	@RequestMapping("/de_r")
	public String de_r(){
		String no = (String)request.getParameter("no");
		labService.findradioByNo(no);
		ArrayList<Radio> rd = labService.findMusicRadio();
		request.setAttribute("rd", rd);
		//System.out.println(no);
		return "radio";
	}
	
	@RequestMapping("/start")
	public String start(){
		test.go();
		return "updata";
	}
	
	
}
