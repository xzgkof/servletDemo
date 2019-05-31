<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>modify page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
  <script>
      var id = window.location.search.split("=")[1];
      $.ajax({
          url:"/servletDemo/test?method=getRecord&id="+id,
          type:"post",
          dataType:"json",
          success:function(data,status){
               $.each(data.table,function(index,item){
                   if(index !== "mysex"){
                      $("input[name="+index+"]").val(item);
                   }
               });
          }
      });
      
      function updCallback(){ 
            var ajaxCallUrl = "/servletDemo/test?method=modify";
            var ym = window.opener.document.getElementById('ym').innerText;
            $.ajax({
                cache: true,
                type: "post",
                url:ajaxCallUrl,
                data:$('#form1').serialize(),// 你的formid
                async: false,
                error: function(data) {
                    alert("Connection error");
                },
                success: function(data) {
                    window.opener.show("show&ym="+ym);
                    window.close();
                }
            });
           
           
            
      }
      
      //alert(window.location.search);
      function t_focus(obj){    
            obj.style.borderColor="green";
            //console.log(obj.style);
      }
      
      function t_blur(obj){
            obj.style.borderColor="";
      }
      
      function test(obj){
             obj.style.color="pink";
             //console.log(obj.style);
      }
  </script>
  </head>
  
  <body id="mainBody">
           <center>
		      <form id="form1" action="" method="post">
				<table>
					<tr>
						<td></td>
						<td>
							<input name="myid" value="" type="hidden">
						</td>
					</tr>
					<tr>
						<td>
							name:
						</td>
						<td>
							<input name="myname" value="" onFocus="t_focus(this)" onblur="t_blur(this)">
						</td>
					</tr>
					<tr>
						<td>
							age:
						</td>
						<td>
							<input name="myage" value="">
						</td>
					</tr>
					<tr>
						<td>
							sex:
						</td>
						<td>
							<label>
								M
							</label>
							<input type="radio" name="mysex" value="m" checked="checked" />
							<label>
								W
							</label>
							<input type="radio" name="mysex" value="w" />
						</td>
					</tr>
					<tr>
						<td onclick="test(this)">
							hobby:
						</td>
						<td>
							<input name="myhobby" value="">
						</td>
					</tr>
					<tr>
						<td>
							info:
						</td>
						<td>
							<input name="myinfo" value="">
						</td>
					</tr>
					<tr>
						<td colspan="1">
							<input type="submit" id="modfiy" onclick="updCallback()" value="send">
						</td>
					</tr>
				</table>
			</form>
      </center>
  </body>
</html>
