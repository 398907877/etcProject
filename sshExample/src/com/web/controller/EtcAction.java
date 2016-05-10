package com.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.bean.EtcBean;
import com.web.bean.User;
import com.web.service.SshSftpUtil;

@Controller
@RequestMapping("etc")
public class EtcAction {
	
	
	
	 @Value("#{configProperties['host']}")
	 private String host; 
	 
	 
	 @Value("#{configProperties['port']}")
	 private Integer port; 
	 
	 
	 @Value("#{configProperties['user']}")
	 private String user; 
	 
	 @Value("#{configProperties['passwsd']}")
	 private String passwsd; 
	 
	 @Value("#{configProperties['url']}")
	 private String url; 
	 
	 
	
	@RequestMapping("/pushfile")
	public String pushFile(EtcBean  bean,HttpServletRequest request, 
			@RequestParam("picone") MultipartFile picone,
			@RequestParam("cardpic") MultipartFile cardpic,
			@RequestParam("pictwo") MultipartFile pictwo) throws Exception
	{
		System.out.println("hanld  to  wujiajun");
		
		
		
		InputStream inPicone= picone.getInputStream();
		String  piconeName=picone.getName();
		String piconeType = picone.getContentType();
		String origin = picone.getOriginalFilename(); 
		
		String path=  request.getSession().getServletContext().getRealPath("/");
		
		
		
		
		File  filePicone  = new File(path+"/"+origin);
		
		OutputStream  outPicone  = new  FileOutputStream(filePicone);
		
		byte[] buffer = new byte[1024];
		int len=0;
		while ((len=inPicone.read(buffer))!=-1) {
			
			outPicone.write(buffer, 0, len);

		}
		
		outPicone.flush();
		outPicone.close();
		
		inPicone.close();
		
		 
		String  orgcode=(String) request.getParameter("orgcode");
		
		SshSftpUtil.sshSftp(host, user, passwsd, port, url,path+"/"+origin , origin);

		
		
		
		return "/ETC/moban";

	}
	
	

}
