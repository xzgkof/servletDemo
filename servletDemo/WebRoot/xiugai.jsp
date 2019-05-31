<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xiugai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<base target="_self" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
       var obj = window.dialogArguments;
       $(function (){
           $("input[name='name']").val(obj.name);
           $("input[name='age']").val(obj.age);
           $("input[name='hobby']").val(obj.hobby);
           $("input[name='info']").val(obj.info); 
           $("input[name='id']").val(obj.id); 
           //alert($("input[name='id']").val());  
                  //var name = $("input[name='name']").val();
                  //var age = $("input[name='age']").val();
                  //var sex = $("input[name='sex']").val();
                  //var hobby = $("input[name='hobby']").val();
                 // var info = $("input[name='info']").val();
                  //var url ="/ServletTest/test?method=upd&myid="+obj.id+"&name="+name+"&age="+age+"&sex="+sex+"&hobby="+hobby+"&info="+info+"&time="+Math.random();
       });
       function tj(){
            document.frm1.action = "/ServletTest/test?method=upd";
            document.frm1.submit();
            window.close();
       }
    </script>
  </head>
  
   <body>
      <center>
      <form action="" method=post name=frm1>
      <caption>基本信息</caption><br>
      <tr bgcolor=yellow> 
         <td width="100px">姓名:<input type="text" name="name"></td>
         <td width="100px">年龄:<input type="text" name="age" onkeyup="this.value=value.replace(/[^\d]/g,'')"></td><br>
         <td width="100px">性别:男：<input type="radio" name="sex" value=男 checked="checked"> 女：<input type="radio" name="sex" value=女>
         <td width="100px">hobby:<input type="text" name="hobby"></td><br>
         <td>info:<input type="text" name="info"></td>
      </tr>    
      <br>
      <input type="hidden" value="" name="id" />
      <input type=submit value=update name=upd onclick="tj();"/>
      </form>
      </center>
  </body>
</html>
