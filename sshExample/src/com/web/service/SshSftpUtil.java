package com.web.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Vector;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class SshSftpUtil {
	/**
	 * wujiajun   create
	 * @param ip 主机IP
	 * @param user 主机登陆用户名
	 * @param psw  主机登陆密码
	 * @param port 主机ssh2登陆端口，如果取默认值，传-1
	 */
	public static void sshSftp(String ip, String user, String psw ,int port,String sftpuri,byte[] pusfile,String  sftpfilename) throws Exception{
	    Session session = null;
	    Channel channel = null;
	 
	     
	    JSch jsch = new JSch();
	     
	     
	    if(port <=0){
	        //连接服务器，采用默认端口
	        session = jsch.getSession(user, ip);
	    }else{
	        //采用指定的端口连接服务器
	        session = jsch.getSession(user, ip ,port);
	    }
	 
	    //如果服务器连接不上，则抛出异常
	    if (session == null) {
	        throw new Exception("session is null");
	    }
	     
	    //设置登陆主机的密码
	    session.setPassword(psw);//设置密码   
	    //设置第一次登陆的时候提示，可选值：(ask | yes | no)
	    session.setConfig("StrictHostKeyChecking", "no");
	    //设置登陆超时时间   
	    session.connect(30000);
	         
	    try {
	        //创建sftp通信通道
	        channel = (Channel) session.openChannel("sftp");
	        channel.connect(1000);
	        ChannelSftp sftp = (ChannelSftp) channel;
	         
	         
	        //进入服务器指定的文件夹
	        sftp.cd(sftpuri);
	         
	        //列出服务器指定的文件列表
	        Vector v = sftp.ls("*");
	        for(int i=0;i<v.size();i++){
	            System.out.println(v.get(i));
	           
	        }
	         
	        //以下代码实现从本地上传一个文件到服务器，如果要实现下载，对换以下流就可以了
	        OutputStream outstream = sftp.put(sftpfilename);
	        InputStream instream = new ByteArrayInputStream(pusfile);
	         
	        byte b[] = new byte[1024];
	        int n;
	        while ((n = instream.read(b)) != -1) {
	            outstream.write(b, 0, n);
	        }
	         
	        outstream.flush();
	        outstream.close();
	        instream.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        session.disconnect();
	        channel.disconnect();
	    }
	}
	
	
	public static void main(String[] args) {
		try {
		//	sshSftp("127.0.0.1", "git", "admin", 22, "SuperXM", "D:/print.txt", "JUN.TXT");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
