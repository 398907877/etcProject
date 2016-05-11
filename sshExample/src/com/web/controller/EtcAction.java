package com.web.controller;

import java.io.ByteArrayOutputStream;
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
		
		try {
			

		
		
		String  publicFileNam= bean.getOrgcode()+"_"+bean.getDatetime().replace("-", "")+"_"+bean.getCardno()
		+"_"+bean.getCardtype()+"_"+bean.getIdcard();
		
		
	  
		
		
		//车身照片
		String  carPicfilename=publicFileNam+"_01_01.jpg";

		String carPicFilename = cardpic.getOriginalFilename(); 

		SshSftpUtil.sshSftp(host, user, passwsd, port, url,cardpic.getBytes() , carPicfilename);

		
		
		
		
		//证件照片1
		String  picOnefilename=publicFileNam+"_02_01.jpg";

		String piconeFilename = picone.getOriginalFilename(); 

		SshSftpUtil.sshSftp(host, user, passwsd, port, url,picone.getBytes() , picOnefilename);

		
		
		
		//证件照片2
		String  picTwofilename=publicFileNam+"_02_02.jpg";

		String picTwoFilename = pictwo.getOriginalFilename(); 

		SshSftpUtil.sshSftp(host, user, passwsd, port, url,pictwo.getBytes() , picTwofilename);

		
		} catch (Exception e) {
			return "/ETC/fail";
		}
		
		
		
		return "/ETC/success";

	}
	
	

}
