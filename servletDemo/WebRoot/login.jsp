<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
	           
  </head>
  
  <script type="text/javascript">
  		 $(function(){
  		 		var msgA = "<span id='msgA' style='color:red'>用户名不能为空</span>";  
  		 		var msgB = "<span id='msgB' style='color:red'>密码不能为空</span>";  
  		 		
  		 		var domA = $("div input[name=username]");
  		 		var domB = $("div input[name=password]");
  		 		
  		 		$("#btn").click(function(){
  		 			 var url = $("#myForm").attr("action");
  		 			 var data = $("#myForm").serialize();
  		 			 
  		 			 $.ajax({
  		 				 type:'post',
  		 				 url:url,
  		 				 cache:false,
  		 				 data:data,
  		 				 dataType:'json',
  		 				 success:function(data){
  		 					 alert(data);
  		 				 },
  		 				 error:function(){
  		 					 alert("error");
  		 				 }
  		 			 });
  		 		});
  		 		
  		 			 
  		 
	            
	            //use the blur or mouseout
	            domA.blur(function(){
	             		var value = $(this).val();
	             		if("" == value){			
	             				if($("#msgA").html() != undefined){
	             					 $("#msgA").remove();
	             				}
	             				$(this).after(msgA);		
	                   }else{
	                   		if($("#msgA").html() != undefined) $("#msgA").remove();
	                   }    
	             });	
	             
	             domB.blur(function(){
	             		var value = $(this).val();
	             		if("" == value){
	             			if($("#msgB").html() != undefined){
	             					 $("#msgB").remove();
	             				}
	             			 $(this).after(msgB);
	             		}else{
	             			if($("#msgB").html() != undefined) $("#msgB").remove();
	             		}
	             });
  		 });
  </script>
  
  <body>
            <div align="center">
            	<form id="myForm" action="/servletDemo/test?method=home">
            		userName:<input name="username"  /> <br>
            		password:<input name="password"  type="password"/> <br>
            	</form>
            	<button type="button" id="btn">send</button>
            </div>
            
           
  </body>
</html>
