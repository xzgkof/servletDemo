<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
  <script>
           function test(a){
        	   //console.log(a);
        	   //console.log($(a).parent().parent().find("td").length);
        	   var width = window.screen.width / 4;
        	   var height = window.screen.height /4;
        	   window.open("dialog.jsp?a="+a, "dialog","width="+width+"height="+height);
           }
  </script>
  <body>
  
        <div>
        	<table align="center">
        	    <th>
        	    	<tr>
        	    		<td>1</td>
        	    		<td>1</td>
        	    		<td>1</td>
        	    		<td>1</td>
        	    		<td>1</td>
        	    	</tr>
        	    </th>
        		<tr>
        			<td>wer</td>
        			<td>ff</td>
        			<td>as</td>
        			<td>afaf</td>
        			<td>
        			<a href="javascript:void(0)" onclick="test(this)">test</a>
        			</td>
        		</tr>
        	</table>
        </div>
        
  </body>
</html>
