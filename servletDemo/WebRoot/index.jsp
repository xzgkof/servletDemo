<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<base target="_self" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	    a:link {color:#c0c0c0;}
	    a:visited {color:#00FF00;} /* 已被访问的链接 */
        a:hover {color:#FF00FF;}   /* 鼠标指针移动到链接上 */
        a:active {color:#0000FF;}  /* 正在被点击的链接 */
        a {font-size:30px;}
	</style>
  </head>

  <script type="text/javascript">
      if("${msg}" != null && "${msg}" != "" ){
        alert("${msg}");
      } 
      
      function getHPR(){
          window.location.href='/servletDemo/test?method=query';
      }      
  </script>
  <body>
      <center>
      <form action="/servletDemo/test?method=add" method=post>
      <caption>基本信息</caption><br>
      <tr bgcolor=yellow>
         <td width="100px">姓名:<input type="text" name="name"></td>
         <td width="100px">年龄:<input type="text" name="age" onkeyup="this.value=value.replace(/[^\d]/g,'')"></td><br>
         <td width="100px">性别:男：<input type="radio" name="sex" value=男> 女：<input type="radio" name="sex" value=女>
         <td width="100px">hobby:<input type="text" name="hobby"></td><br>
         <td>info:<input type="text" name="info"></td>
      </tr>    
      <br>
      <input type=submit value=添加 name=add/>
      </form>
      <input type=submit value=查询 name=query onclick="getHPR()"/>
      <a href="/servletDemo/test?method=query">Jquery</a>
      </center>
  </body>
  
</html>
