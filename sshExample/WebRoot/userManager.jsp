<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.web.bean.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(path);
System.out.println(basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
  function del(id)
  {
     var url="<%=path%>/user/delUser?id="+id;
     $.get(url,function(data){
      if("success"==data.info)
      {
        alert("成功删除！");
        window.location.reload();
      }
      else
      {
        alert("删除失败！");
      }
      
     });
  }
  
  $(function(){
   
   
  });

</script>
  </head>
  
  <body>
    <table border="1">
     <tbody>
       <tr>
       <th>姓名</th>
       <th>密码</th>
       <th>编辑</th>
       </tr>
       <%
         List<User> userList=( List<User>)request.getAttribute("userList");
         if(userList==null || userList.size()==0 )
         {
         
         }
         else
         {
         for(User user : userList)
         {
        %>
       <tr>
       <td><%=user.getUsername() %></td>
       <td><%=user.getPassword() %></td>
       <td>
         <a href="<%=path%>/user/getUser?id=<%=user.getID()%>">编辑</a>
         <a href="javascript:del('<%=user.getID() %>');">删除</a>
       </td>
       </tr>
       <%}} %>
     </tbody>
    
    </table>
  </body>
</html>
