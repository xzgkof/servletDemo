<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="test.xzg.servlet.entity.MyTable;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
		<link rel="stylesheet" href="./css/normal.css" type="text/css">
		<script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>	
		<script type="text/javascript" src="./js/normal.js"></script>
		<script>
		     if('${msg}'!=""){
                      alert('${msg}');
              }
		</script>
 </HEAD>
 <body id=bd1> 
           <jsp:include page="modfiy.jsp" flush="true"/>
          <center>
                 <table id=tab bgcolor=pink>
				       <caption><div style="color:blue">查询信息</div></caption>
                       <tr bgcolor="#E5E5E5">
					       <td>ID</td>
						   <td>NAME</td>
						   <td>AGE</td>
						   <td>SEX</td>
						   <td>HOBBY</td>
						   <td>INFO</td>
						   <td height=30px width=150px>
						   ORDER
						   </td>   
					   </tr>
					   <c:forEach items="${list}" var="items" varStatus="it">
					          <tr bgcolor="#CDCDB4">
					               <td>${items.myid}</td>
					               <td>${items.myname}</td>
					               <td>${items.myage}</td>
					               <td>${items.mysex}</td>
					               <td>${items.myhobby}</td>
					               <td>${items.myinfo}</td>
					               <td height=30px width=250px nowrap="nowrap">
						          <a href="javascript:void(0)" name="upd">update</a>|
						          <a href="javascript:void(0)" onclick="$(function(){window.location='/servletDemo/test?method=del&id='+${items.myid};})">delete</a>
						          </td> 
					          </tr>
					   </c:forEach>
					   <tr bgcolor="#CDC8B1">
					       <td><a id=sy href="/servletDemo/test?method=query">首 页</a></td>
						   <td>页 码: ${curPage}</td>
						   <td><a id=syy href="/servletDemo/test?method=upPage">上一页</a></td>
						   <td><a id=xyy href="/servletDemo/test?method=downPage">下一页</a></td>
						   <td><a id=wy href="/servletDemo/test?method=endPage">尾  页</a></td>
						   <td>总记录数: ${maxCount}</td>
						   <td height=30px width=150px>
						       总页数: ${maxPage}
						   </td>   
					   </tr>
					   <a href=add.jsp>return add jsp</a>
				 </table>
		  </center>
 </BODY>
</html>
