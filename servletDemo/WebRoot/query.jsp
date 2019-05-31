<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'query.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
       .odd {background:#FFF38F;}
       .even {background:#FFFFEE;}
       .selected		{ background:#FF6500;color:#fff;}
    </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./jquery/jquery-1.4.4.min.js"></script>
	<script>
	 function add(){
          var obj = {};
          window.showModalDialog("index.jsp",obj,"dialogHeight:250px;dialogWidth:450px");
        }
	</script>
  </head>
  
   <body bgcolor="pink">
          <center>
          <div>
          <table border="1" bordercolor="#009999">
		   <caption>查询结果</caption>
                    <tr bgcolor=#CDC5BF>
					    <td width=150px>编&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号</td>
						<td width=150px>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名</td>
						<td width=150px>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄</td>
						<td width=150px>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别</td>
						<td width=150px>爱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp好</td>
						<td width=150px>其他信息</td>
						<td width=150px>操&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp作</td>
					<tr>
		 </table>
         <table id=tab border="1" bgcolor="#CCFF00">
		 </table>
		 <table id=tab2 border="1" bgcolor="black">
				<tr bgcolor=#CDC5BF id="t"></tr>	
		 </table>
		 </div>
		 <a href="/servletDemo/index.jsp" >返回添加页面</a>
		 <a href="javascript:add();" >添加</a>
		 </center>
  </body>
  <script type="text/javascript">
   var tab2 = document.getElementById('tab2');
        //alert(table2);
        //动态构造表格
        var table = document.getElementById('tab');
		//table.setAttribute('border','0');
		//table.createCaption().innerHTML='查询结果';
		table.border='0';
        var tbdy = document.createElement('tbody');
        tbdy.id="tbdy1";
		for (var i = 0; i < 5; i++) {
         var tr = document.createElement('tr');
         for (var j = 0; j < 7; j++) {
		  if(j != 6){
          var td = document.createElement('td');
		  td.width='150px';
          var m  = document.createTextNode(i + ',' + j);
          td.appendChild(m);
          tr.appendChild(td);
		  }else if(j ==6){
		     var td1 = document.createElement('td');
		     td1.width='150px';
		     var a = document.createElement('a');
			 a.href='#';
			 a.innerHTML='修改    ';
			 var a1= document.createElement('a');
			 a1.href='#';
			 a1.innerHTML='   删除';
			 td1.appendChild(a);
			 td1.appendChild(a1);
             tr.appendChild(td1);
		  }
         }
         tbdy.appendChild(tr);
        }
        table.appendChild(tbdy);
        //操作栏
        var tbd = document.createElement('tbody');
        tbd.id="tbdy2";
        var tr2 = document.getElementById('t');
        //tr2.bgcolor="red";
        //tr2.setAttribute("bgcolor", "red");
        var td1 = document.createElement('td');
        td1.width='150px';
        var a1 = document.createElement('a');
        a1.style.color="red";
        a1.href="javascript:showPage('shouye');";
        a1.innerHTML='首    页';
        td1.appendChild(a1);
        var td2 = document.createElement('td');
        td2.width='150px';
        //td2.innerHTML='页  码&nbsp&nbsp ${curPage}';
        var h_1 =document.createElement('h');
        h_1.id = "ym";
        h_1.innerHTML="当前页码:"+${curPage};
        td2.appendChild(h_1);
        var td3 = document.createElement('td');
        td3.width='150px';
        //td3.innerHTML='总 页 数&nbsp&nbsp ${maxPage}';
        var h_2 = document.createElement('h');
        h_2.innerHTML="总页码:"+${maxPage};
        td3.appendChild(h_2);
        var td4 = document.createElement('td');
        td4.width='150px';
        var a2 = document.createElement('a');
        a2.innerHTML='上    一    页';
        a2.href="javascript:showPage('upPage');";
        td4.appendChild(a2);
        var td5 = document.createElement('td');
        td5.width='150px';
        var a3 = document.createElement('a');
        a3.innerHTML='下    一    页';
        a3.href="javascript:showPage('downPage');";
        td5.appendChild(a3);
        var td6 = document.createElement('td');
        td6.width='150px';
        var a4 = document.createElement('a');
        a4.innerHTML='尾        页';
        a4.href="javascript:showPage('endPage');";
        var td7 = document.createElement('td');
        td7.width='150px';
        //td7.innerHTML='总   条   数&nbsp&nbsp ${maxCount}';
        var h_3 = document.createElement('h');
        h_3.innerHTML="总记录数:"+${maxCount};
        td7.appendChild(h_3);
        td6.appendChild(a4);
        tr2.appendChild(td1);
        tr2.appendChild(td2);
        tr2.appendChild(td3);
        tr2.appendChild(td4);
        tr2.appendChild(td5);
        tr2.appendChild(td7);
        tr2.appendChild(td6);
        tbd.appendChild(tr2);
        tab2.appendChild(tbd);
         //AJAX初始化
         var xhr =null;
         function createXHR(){
         if(window.XMLHttpRequest){
        	 xhr = new XMLHttpRequest();
         } else{
        	 xhr = new ActiveXObject("Microsoft.XMLHTTP");
         }
            return xhr;
         }
         //分页
            function  showPage(input){
        	 xhr = createXHR();
        	 var url="/servletDemo/test?method="+input+"&"+"time="+new Date().getTime();
        	 xhr.onreadystatechange = function (){
        		 if(xhr.readyState == 4 && xhr.status == 200){
        			 //获取服务端返回的数据构造成JSON格式数据
        			var len = 0;
        			var msg = xhr.responseText;
        			var data = eval("("+msg+")");
                    for (var i in data.root){
                    	len++;
                    }
                    var flag = len-1;
                    switch(flag)
                    {
                    case 1:
                    	table.rows[0].cells[0].innerHTML=data.root[0].myid;
            			table.rows[0].cells[1].innerHTML=data.root[0].myname;
            			table.rows[0].cells[2].innerHTML=data.root[0].myage;
            			table.rows[0].cells[3].innerHTML=data.root[0].mysex;
            			table.rows[0].cells[4].innerHTML=data.root[0].myhobby;
            			table.rows[0].cells[5].innerHTML=data.root[0].myinfo;
            			for(var i = 1 ; i <table.rows.length;i++){
            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
            					 table.rows[i].cells[j].innerHTML="";
            				}
            			}
            			document.getElementsByTagName('h')[0].innerHTML="当前页码:"+data.root[1].curPage;
            			document.getElementsByTagName('h')[1].innerHTML="总页码:"+data.root[1].maxPage;
            			document.getElementsByTagName('h')[2].innerHTML="总记录数:"+data.root[1].maxCount;
            			break;
                    case 2:
                    	table.rows[0].cells[0].innerHTML=data.root[0].myid;
            			table.rows[0].cells[1].innerHTML=data.root[0].myname;
            			table.rows[0].cells[2].innerHTML=data.root[0].myage;
            			table.rows[0].cells[3].innerHTML=data.root[0].mysex;
            			table.rows[0].cells[4].innerHTML=data.root[0].myhobby;
            			table.rows[0].cells[5].innerHTML=data.root[0].myinfo;
                    	table.rows[1].cells[0].innerHTML=data.root[1].myid;
            			table.rows[1].cells[1].innerHTML=data.root[1].myname;
            			table.rows[1].cells[2].innerHTML=data.root[1].myage;
            			table.rows[1].cells[3].innerHTML=data.root[1].mysex;
            			table.rows[1].cells[4].innerHTML=data.root[1].myhobby;
            			table.rows[1].cells[5].innerHTML=data.root[1].myinfo;
            			for(var i = 2 ; i <table.rows.length;i++){
            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
            					 table.rows[i].cells[j].innerHTML="";
            				}
            			}
            			document.getElementsByTagName('h')[0].innerHTML="当前页码:"+data.root[2].curPage;
            			document.getElementsByTagName('h')[1].innerHTML="总页码:"+data.root[2].maxPage;
            			document.getElementsByTagName('h')[2].innerHTML="总记录数:"+data.root[2].maxCount;
            			break;
                    case 3:
                    	table.rows[0].cells[0].innerHTML=data.root[0].myid;
            			table.rows[0].cells[1].innerHTML=data.root[0].myname;
            			table.rows[0].cells[2].innerHTML=data.root[0].myage;
            			table.rows[0].cells[3].innerHTML=data.root[0].mysex;
            			table.rows[0].cells[4].innerHTML=data.root[0].myhobby;
            			table.rows[0].cells[5].innerHTML=data.root[0].myinfo;
                    	table.rows[1].cells[0].innerHTML=data.root[1].myid;
            			table.rows[1].cells[1].innerHTML=data.root[1].myname;
            			table.rows[1].cells[2].innerHTML=data.root[1].myage;
            			table.rows[1].cells[3].innerHTML=data.root[1].mysex;
            			table.rows[1].cells[4].innerHTML=data.root[1].myhobby;
            			table.rows[1].cells[5].innerHTML=data.root[1].myinfo;
                    	table.rows[2].cells[0].innerHTML=data.root[2].myid;
            			table.rows[2].cells[1].innerHTML=data.root[2].myname;
            			table.rows[2].cells[2].innerHTML=data.root[2].myage;
            			table.rows[2].cells[3].innerHTML=data.root[2].mysex;
            			table.rows[2].cells[4].innerHTML=data.root[2].myhobby;
            			table.rows[2].cells[5].innerHTML=data.root[2].myinfo;
            			for(var i = 3 ; i <table.rows.length;i++){
            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
            					 table.rows[i].cells[j].innerHTML="";
            				}
            			}
            			document.getElementsByTagName('h')[0].innerHTML="当前页码:"+data.root[3].curPage;
            			document.getElementsByTagName('h')[1].innerHTML="总页码:"+data.root[3].maxPage;
            			document.getElementsByTagName('h')[2].innerHTML="总记录数:"+data.root[3].maxCount;
            			break;
                    case 4:
                    	table.rows[0].cells[0].innerHTML=data.root[0].myid;
            			table.rows[0].cells[1].innerHTML=data.root[0].myname;
            			table.rows[0].cells[2].innerHTML=data.root[0].myage;
            			table.rows[0].cells[3].innerHTML=data.root[0].mysex;
            			table.rows[0].cells[4].innerHTML=data.root[0].myhobby;
            			table.rows[0].cells[5].innerHTML=data.root[0].myinfo;
                    	table.rows[1].cells[0].innerHTML=data.root[1].myid;
            			table.rows[1].cells[1].innerHTML=data.root[1].myname;
            			table.rows[1].cells[2].innerHTML=data.root[1].myage;
            			table.rows[1].cells[3].innerHTML=data.root[1].mysex;
            			table.rows[1].cells[4].innerHTML=data.root[1].myhobby;
            			table.rows[1].cells[5].innerHTML=data.root[1].myinfo;
                    	table.rows[2].cells[0].innerHTML=data.root[2].myid;
            			table.rows[2].cells[1].innerHTML=data.root[2].myname;
            			table.rows[2].cells[2].innerHTML=data.root[2].myage;
            			table.rows[2].cells[3].innerHTML=data.root[2].mysex;
            			table.rows[2].cells[4].innerHTML=data.root[2].myhobby;
            			table.rows[2].cells[5].innerHTML=data.root[2].myinfo;
                    	table.rows[3].cells[0].innerHTML=data.root[3].myid;
            			table.rows[3].cells[1].innerHTML=data.root[3].myname;
            			table.rows[3].cells[2].innerHTML=data.root[3].myage;
            			table.rows[3].cells[3].innerHTML=data.root[3].mysex;
            			table.rows[3].cells[4].innerHTML=data.root[3].myhobby;
            			table.rows[3].cells[5].innerHTML=data.root[3].myinfo;
            			for(var i = 4 ; i <table.rows.length;i++){
            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
            					 table.rows[i].cells[j].innerHTML="";
            				}
            			}
            			document.getElementsByTagName('h')[0].innerHTML="当前页码:"+data.root[4].curPage;
            			document.getElementsByTagName('h')[1].innerHTML="总页码:"+data.root[4].maxPage;
            			document.getElementsByTagName('h')[2].innerHTML="总记录数:"+data.root[4].maxCount;
            			break;
                    case 5:
                    	table.rows[0].cells[0].innerHTML=data.root[0].myid;
            			table.rows[0].cells[1].innerHTML=data.root[0].myname;
            			table.rows[0].cells[2].innerHTML=data.root[0].myage;
            			table.rows[0].cells[3].innerHTML=data.root[0].mysex;
            			table.rows[0].cells[4].innerHTML=data.root[0].myhobby;
            			table.rows[0].cells[5].innerHTML=data.root[0].myinfo;
                    	table.rows[1].cells[0].innerHTML=data.root[1].myid;
            			table.rows[1].cells[1].innerHTML=data.root[1].myname;
            			table.rows[1].cells[2].innerHTML=data.root[1].myage;
            			table.rows[1].cells[3].innerHTML=data.root[1].mysex;
            			table.rows[1].cells[4].innerHTML=data.root[1].myhobby;
            			table.rows[1].cells[5].innerHTML=data.root[1].myinfo;
                    	table.rows[2].cells[0].innerHTML=data.root[2].myid;
            			table.rows[2].cells[1].innerHTML=data.root[2].myname;
            			table.rows[2].cells[2].innerHTML=data.root[2].myage;
            			table.rows[2].cells[3].innerHTML=data.root[2].mysex;
            			table.rows[2].cells[4].innerHTML=data.root[2].myhobby;
            			table.rows[2].cells[5].innerHTML=data.root[2].myinfo;
                    	table.rows[3].cells[0].innerHTML=data.root[3].myid;
            			table.rows[3].cells[1].innerHTML=data.root[3].myname;
            			table.rows[3].cells[2].innerHTML=data.root[3].myage;
            			table.rows[3].cells[3].innerHTML=data.root[3].mysex;
            			table.rows[3].cells[4].innerHTML=data.root[3].myhobby;
            			table.rows[3].cells[5].innerHTML=data.root[3].myinfo;
                    	table.rows[4].cells[0].innerHTML=data.root[4].myid;
            			table.rows[4].cells[1].innerHTML=data.root[4].myname;
            			table.rows[4].cells[2].innerHTML=data.root[4].myage;
            			table.rows[4].cells[3].innerHTML=data.root[4].mysex;
            			table.rows[4].cells[4].innerHTML=data.root[4].myhobby;
            			table.rows[4].cells[5].innerHTML=data.root[4].myinfo;
            			document.getElementsByTagName('h')[0].innerHTML="当前页码:"+data.root[5].curPage;
            			document.getElementsByTagName('h')[1].innerHTML="总页码:"+data.root[5].maxPage;
            			document.getElementsByTagName('h')[2].innerHTML="总记录数:"+data.root[5].maxCount;
            			break;
                    }
        		 }
        	 }
        	 xhr.open("GET", url, true);
        	 xhr.setRequestHeader("If-Modified-Since","0");
        	 xhr.send(null);
         }
           //初始化数据
           for(var i = 0 ;i<table.rows.length;i++){
		     for(var j = 0;j <table.rows[i].cells.length-1;j++){
		         if(i==0 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[0].myid}";
		         if(i==0 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[0].myname}";
		         if(i==0 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[0].myage}";
		         if(i==0 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[0].mysex}";
		         if(i==0 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[0].myhobby}";
		         if(i==0 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[0].myinfo}";
		         if(i==1 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[1].myid}";
		         if(i==1 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[1].myname}";
		         if(i==1 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[1].myage}";
		         if(i==1 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[1].mysex}";
		         if(i==1 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[1].myhobby}";
		         if(i==1 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[1].myinfo}";
		         if(i==2 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[2].myid}";
		         if(i==2 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[2].myname}";
		         if(i==2 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[2].myage}";
		         if(i==2 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[2].mysex}";
		         if(i==2 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[2].myhobby}";
		         if(i==2 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[2].myinfo}";
		         if(i==3 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[3].myid}";
		         if(i==3 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[3].myname}";
		         if(i==3 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[3].myage}";
		         if(i==3 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[3].mysex}";
		         if(i==3 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[3].myhobby}";
		         if(i==3 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[3].myinfo}";
		         if(i==4 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[4].myid}";
		         if(i==4 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[4].myname}";
		         if(i==4 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[4].myage}";
		         if(i==4 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[4].mysex}";
		         if(i==4 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[4].myhobby}";
		         if(i==4 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[4].myinfo}";
		         if(5==0 && j==0)
		         table.rows[i].cells[j].innerHTML="${list[5].myid}";
		         if(5==0 && j==1)
		         table.rows[i].cells[j].innerHTML="${list[5].myname}";
		         if(5==0 && j==2)
		         table.rows[i].cells[j].innerHTML="${list[5].myage}";
		         if(5==0 && j==3)
		         table.rows[i].cells[j].innerHTML="${list[5].mysex}";
		         if(5==0 && j==4)
		         table.rows[i].cells[j].innerHTML="${list[5].myhobby}";
		         if(5==0 && j==5)
		         table.rows[i].cells[j].innerHTML="${list[5].myinfo}";
          }
		}
        //链接按钮事件
        var a =document.getElementsByTagName('a');
   		a[0].href='javascript:update(0);';
   		a[1].href='javascript:del(0);';
        a[2].href='javascript:update(1);';
   		a[3].href='javascript:del(1);';
   		a[4].href='javascript:update(2);';
   		a[5].href='javascript:del(2);';
   		a[6].href='javascript:update(3);';
   		a[7].href='javascript:del(3);';
   		a[8].href='javascript:update(4);';
   		a[9].href='javascript:del(4);';
   		//修改
       	function update(index){
       		 var obj = new Object();
       		 obj.id = document.getElementById('tab').rows[index].cells[0].innerHTML;
		     obj.name=document.getElementById('tab').rows[index].cells[1].innerHTML;
		     obj.age =document.getElementById('tab').rows[index].cells[2].innerHTML;
		     obj.sex =document.getElementById('tab').rows[index].cells[3].innerHTML;
		     obj.hobby=document.getElementById('tab').rows[index].cells[4].innerHTML;
		     obj.info=document.getElementById('tab').rows[index].cells[5].innerHTML;
			 //alert(obj.sex);
			 window.showModalDialog("xiugai.jsp",obj,"dialogHeight:250px;dialogWidth:450px");
		     //alert(document.getElementById("ym").innerHTML);
		     var ym = document.getElementById("ym").innerHTML.substr(5,1);
		     //this.location.href="/servletDemo/test?method=show&ym="+ym;
		     showPage("show&ym="+ym);
		     //this.location.href='/servletDemo/test?method=upinfo&id='+obj.id+'&name='+obj.name+'&age='+obj.age+'&sex='+obj.sex+'&hobby='+obj.hobby+'&info='+obj.info;
		     //this.location.href='/servletDemo/test?method=upinfo&id='+obj.id;
       	}
       	//删除
       	function del(index){
       		if(window.confirm('你确定要删除数据吗？')){
       			var id = document.getElementById('tab').rows[index].cells[0].innerHTML;
       			//this.location.href='/servletDemo/test?method=del&id='+id;
       		    showPage("del&id="+id);
       		}
       	}
       	
       	$(document).ready(function (){
                  $("tbody>tr:odd").addClass("odd");
                  $("tbody>tr:even").addClass("even");      
         });      
  </script>
  
    
</html>
