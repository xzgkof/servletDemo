<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
td { /**border:1px solid #c0c0c0;**/
	width: 50%;
	height: 20%;
	text-align: center;
	font-size: 200%;
	font-family: Georgia;
	color: #c0c0c0;
}

input {
	width: 98%;
	height: 100%;
	font-size: 150%;
	border: 1px solid #c0c0c0;
}

div#main {
	width: 35%;
	height: 65%;
	border: 1px solid #c0c0c0;
	margin: 0 auto;
}

h2 {
	padding-top: 3%;
	color: #c0c0c0;
	font-size: 150%;
	font-family: Georgia;
}

table { /**border:1px solid #c0c0c0;**/
	width: 100%;
	height: 50%;
}

body {
	text-align: center;
}
</style>
		<script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
	</head>

	<body>
		<div id="main">
			<h2>
				用户信息
			</h2>
			<table>
				<tr>
					<td>
						姓名:
					</td>
					<td>
						<input name="name" />
					</td>
				</tr>
				<tr>
					<td>
						年龄:
					</td>
					<td>
						<input name="age" onkeyup="this.value=value.replace(/[^\d]/g,'')" />
					</td>
				</tr>
				<tr>
					<td>
						性别:
					</td>
					<td>
						男:
						<input type="radio" name="sex" value="男"
							style="width: 20%; height: 50%;" />
						女:
						<input type="radio" name="sex" value="女"
							style="width: 20%; height: 50%;" />
					</td>
				</tr>
				<tr>
					<td>
						爱好:
					</td>
					<td>
						<input name="hobby" />
					</td>
				</tr>
				<tr>
					<td>
						信息:
					</td>
					<td>
						<input name="info" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="ADD" id="add"
							style="width: 20%; height: 90%; font-size: 90%;" />
						<input type="submit" value="SEL" id="query"
							style="width: 20%; height: 90%; font-size: 90%;" />
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript">
        $("#query").click(function(){
        window.location.href='/servletDemo/test?method=query';});
        $("#add").click(function (){
              $.post(
              "/servletDemo/test?method=add",
              {name:$('input[name=name]').val(),
               age:$('input[name=age]').val(),
               sex:$('input[name=sex]').val(),
               hobby:$('input[name=hobby]').val(),
               info:$('input[name=info]').val()},
              function(data,status){
                     console.info(data);
                      var len = 0;
                      var obj=eval("("+data+")");
					  for(var temp in obj.root){
						  len++;
					  }                    
                    alert(obj.root[0].msg);
                    location.href="/servletDemo/add.jsp";
              });
        });
        </script>
	</body>
</html>
