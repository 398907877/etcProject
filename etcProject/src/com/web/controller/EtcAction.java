package com.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.bean.EtcBean;
import com.web.bean.User;

@Controller
@RequestMapping("etc")
public class EtcAction {
	
	@RequestMapping("/pushfile")
	public String pushFile(EtcBean  bean,HttpServletRequest request, 
			@RequestParam("picone") MultipartFile picone,
			@RequestParam("cardpic") MultipartFile cardpic,
			@RequestParam("pictwo") MultipartFile pictwo)
	{
		System.out.println("hanld  to  wujiajun");

		
		String  orgcode=(String) request.getParameter("orgcode");
		
		
		return "/ETC/moban";

	}
	
	

}
