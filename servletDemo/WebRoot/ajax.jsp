<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>******</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/normal.css" type="text/css">
    <script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="./js/operation.js"></script>
    <script type="text/javascript">
       $.ajax({
	           url:"/servletDemo/test?method=home",
	           type:"post",
	           dataType:"json",
	           success:function(data){ 
	               var htmlStr = 
	                     "<center>"+
	                     "<table id='tab' bgcolor='pink'>"+
	                     "<caption><div style='color:blue'>查询信息</div></caption>"+
	                     "<tr bgcolor='#E5E5E5'><td>ID</td>"+"<td>NAME</td>"+"<td>AGE</td>"+
						 "<td>SEX</td><td>HOBBY</td><td>INFO</td><td height='30px' width='150px'>操作</td>";
	                     $.each(data.root,function(i,item){ 
	                          htmlStr += "<tr bgcolor='#FAFAFA'><td>"+item.myid+"</td>";
	                          htmlStr += "<td>"+item.myname+"</td><td>"+item.myage+"</td>";
	                          htmlStr += "<td>"+item.mysex+"</td><td>"+item.myhobby+"</td>";
	                          htmlStr += "<td>"+item.myinfo+"</td>"+"<td height='30px' width='250px' nowrap='nowrap'>"; 
	                          htmlStr += "<a href='/servletDemo/update.jsp?id="+item.myid+"' target='_blank' onclick='';>update</a>|"; 
	                          htmlStr += "<a href='javascript:void(0)' onclick=delConfirm('remove&id="+item.myid+"')>delete</a></td></tr>";
	                          });
	                    $.each(data.paging,function(i,item){
	                            htmlStr += "<tr bgcolor='#FFFFF0'><td><a href='javascript:void(0)' onclick=show('home')>首 页</a></td>";
	                            htmlStr += "<td>页 码:<span id='ym'>"+item.curPage+"</span></td>";
	                            htmlStr += "<td><a href='javascript:void(0)' onclick=show('upPage')>上一页</a></td>";
	                            htmlStr += "<td><a href='javascript:void(0)' onclick=show('downPage')>下一页</a></td>";
	                            htmlStr += "<td><a href='javascript:void(0)' onclick=show('endPage')>尾  页</a></td>";
	                            htmlStr += "<td>总记录数:"+item.maxCount+"</td><td height='30px' width='150px'>总页数:"+item.maxPage+"</td></tr>";
	                    });      
	                      $("#mainBody").html(htmlStr);         
	                       //滑动变色
							 $("tr").mouseover(function (){
							 $(this).addClass("even");  
							 }).mouseout(function (){
							 $(this).removeClass("even");
							 });      
	           }
	       });
	               
    </script>
  </head>
  <body id="mainBody">
     
  </body>
</html>
