$(document).ready(function (){
        //分页
        var table = document.getElementById("tab");
        $("#xyy,#wy,#sy,#syy").click(function (){
        	var url =null;
        	 if($(this).attr("id") == "xyy"){
        		url = "/ServletTest/test?method=downPage&time="+new Date().getTime();
        	 }else if($(this).attr("id") == "wy"){
        		url = "/ServletTest/test?method=endPage&time="+new Date().getTime();
        	 }else if($(this).attr("id") == "sy"){
        		url   = "/ServletTest/test?method=shouye&random="+Math.random();
        	 }else if($(this).attr("id") == "syy"){
        		url = "/ServletTest/test?method=upPage&math="+Math.random();
        	 }
		   $.get(url,function (data,status){
		         if(status=="success"){
		        	  var len = 0;
				      var msg=eval("("+data+")");
					  for(var temp in msg.root){
						  len++;
					  }
					  var flag = len-1;
					  switch(flag)
					  {
					  case 1:
						  $("td:eq(7)").html(msg.root[0].myid);
						  $("td:eq(8)").html(msg.root[0].myname);
						  $("td:eq(9)").html(msg.root[0].myage);
						  $("td:eq(10)").html(msg.root[0].mysex);
						  $("td:eq(11)").html(msg.root[0].myhobby);
						  $("td:eq(12)").html(msg.root[0].myinfo);
						  for(var i = 2 ; i <table.rows.length;i++){
							    if(i != table.rows.length-1){
	            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
	            					 table.rows[i].cells[j].innerHTML="";
	            				} 
	            			}
						  }
						  $("td:eq(43)").html("页 码:"+msg.root[1].curPage);
						  $("td:eq(47)").html("总记录数:"+msg.root[1].maxCount);
						  $("td:eq(48)").html("总页码:"+msg.root[1].maxPage);
						  break;
					  case 2:
						  $("td:eq(7)").html(msg.root[0].myid);
						  $("td:eq(8)").html(msg.root[0].myname);
						  $("td:eq(9)").html(msg.root[0].myage);
						  $("td:eq(10)").html(msg.root[0].mysex);
						  $("td:eq(11)").html(msg.root[0].myhobby);
						  $("td:eq(12)").html(msg.root[0].myinfo);
						  $("td:eq(14)").html(msg.root[1].myid);
						  $("td:eq(15)").html(msg.root[1].myname);
						  $("td:eq(16)").html(msg.root[1].myage);
						  $("td:eq(17)").html(msg.root[1].mysex);
						  $("td:eq(18)").html(msg.root[1].myhobby);
						  $("td:eq(19)").html(msg.root[1].myinfo);
						  for(var i = 3 ; i <table.rows.length;i++){
							  if(i != table.rows.length-1)
	            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
	            					 table.rows[i].cells[j].innerHTML="";
	            				}
	            			}
						  $("td:eq(43)").html("页 码:"+msg.root[2].curPage);
						  $("td:eq(47)").html("总记录数:"+msg.root[2].maxCount);
						  $("td:eq(48)").html("总页码:"+msg.root[2].maxPage);
						  break;
					  case 3:
						  $("td:eq(7)").html(msg.root[0].myid);
						  $("td:eq(8)").html(msg.root[0].myname);
						  $("td:eq(9)").html(msg.root[0].myage);
						  $("td:eq(10)").html(msg.root[0].mysex);
						  $("td:eq(11)").html(msg.root[0].myhobby);
						  $("td:eq(12)").html(msg.root[0].myinfo);
						  $("td:eq(14)").html(msg.root[1].myid);
						  $("td:eq(15)").html(msg.root[1].myname);
						  $("td:eq(16)").html(msg.root[1].myage);
						  $("td:eq(17)").html(msg.root[1].mysex);
						  $("td:eq(18)").html(msg.root[1].myhobby);
						  $("td:eq(19)").html(msg.root[1].myinfo);
						  $("td:eq(21)").html(msg.root[2].myid);
						  $("td:eq(22)").html(msg.root[2].myname);
						  $("td:eq(23)").html(msg.root[2].myage);
						  $("td:eq(24)").html(msg.root[2].mysex);
						  $("td:eq(25)").html(msg.root[2].myhobby);
						  $("td:eq(26)").html(msg.root[2].myinfo);
						  for(var i = 4 ; i <table.rows.length;i++){
							  if(i != table.rows.length-1)
	            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
	            					 table.rows[i].cells[j].innerHTML="";
	            				}
	            			}
						  $("td:eq(43)").html("页 码:"+msg.root[3].curPage);
						  $("td:eq(47)").html("总记录数:"+msg.root[3].maxCount);
						  $("td:eq(48)").html("总页码:"+msg.root[3].maxPage);
						  break;
					  case 4:
						  $("td:eq(7)").html(msg.root[0].myid);
						  $("td:eq(8)").html(msg.root[0].myname);
						  $("td:eq(9)").html(msg.root[0].myage);
						  $("td:eq(10)").html(msg.root[0].mysex);
						  $("td:eq(11)").html(msg.root[0].myhobby);
						  $("td:eq(12)").html(msg.root[0].myinfo);
						  $("td:eq(14)").html(msg.root[1].myid);
						  $("td:eq(15)").html(msg.root[1].myname);
						  $("td:eq(16)").html(msg.root[1].myage);
						  $("td:eq(17)").html(msg.root[1].mysex);
						  $("td:eq(18)").html(msg.root[1].myhobby);
						  $("td:eq(19)").html(msg.root[1].myinfo);
						  $("td:eq(21)").html(msg.root[2].myid);
						  $("td:eq(22)").html(msg.root[2].myname);
						  $("td:eq(23)").html(msg.root[2].myage);
						  $("td:eq(24)").html(msg.root[2].mysex);
						  $("td:eq(25)").html(msg.root[2].myhobby);
						  $("td:eq(26)").html(msg.root[2].myinfo);
						  $("td:eq(28)").html(msg.root[3].myid);
						  $("td:eq(29)").html(msg.root[3].myname);
						  $("td:eq(30)").html(msg.root[3].myage);
						  $("td:eq(31)").html(msg.root[3].mysex);
						  $("td:eq(32)").html(msg.root[3].myhobby);
						  $("td:eq(33)").html(msg.root[3].myinfo);
						  for(var i = 5 ; i <table.rows.length;i++){
							  if(i != table.rows.length-1)
	            				for(var j = 0;j < table.rows[i].cells.length-1;j++){
	            					 table.rows[i].cells[j].innerHTML="";
	            				}
	            			}
						  $("td:eq(43)").html("页 码:"+msg.root[4].curPage);
						  $("td:eq(47)").html("总记录数:"+msg.root[4].maxCount);
						  $("td:eq(48)").html("总页码:"+msg.root[4].maxPage);
						  break;
					  case 5:
						  $("td:eq(7)").html(msg.root[0].myid);
						  $("td:eq(8)").html(msg.root[0].myname);
						  $("td:eq(9)").html(msg.root[0].myage);
						  $("td:eq(10)").html(msg.root[0].mysex);
						  $("td:eq(11)").html(msg.root[0].myhobby);
						  $("td:eq(12)").html(msg.root[0].myinfo);
						  $("td:eq(14)").html(msg.root[1].myid);
						  $("td:eq(15)").html(msg.root[1].myname);
						  $("td:eq(16)").html(msg.root[1].myage);
						  $("td:eq(17)").html(msg.root[1].mysex);
						  $("td:eq(18)").html(msg.root[1].myhobby);
						  $("td:eq(19)").html(msg.root[1].myinfo);
						  $("td:eq(21)").html(msg.root[2].myid);
						  $("td:eq(22)").html(msg.root[2].myname);
						  $("td:eq(23)").html(msg.root[2].myage);
						  $("td:eq(24)").html(msg.root[2].mysex);
						  $("td:eq(25)").html(msg.root[2].myhobby);
						  $("td:eq(26)").html(msg.root[2].myinfo);
						  $("td:eq(28)").html(msg.root[3].myid);
						  $("td:eq(29)").html(msg.root[3].myname);
						  $("td:eq(30)").html(msg.root[3].myage);
						  $("td:eq(31)").html(msg.root[3].mysex);
						  $("td:eq(32)").html(msg.root[3].myhobby);
						  $("td:eq(33)").html(msg.root[3].myinfo);
						  $("td:eq(35)").html(msg.root[4].myid);
						  $("td:eq(36)").html(msg.root[4].myname);
						  $("td:eq(37)").html(msg.root[4].myage);
						  $("td:eq(38)").html(msg.root[4].mysex);
						  $("td:eq(39)").html(msg.root[4].myhobby);
						  $("td:eq(40)").html(msg.root[4].myinfo);
						  $("td:eq(43)").html("页 码:"+msg.root[5].curPage);
						  $("td:eq(47)").html("总记录数:"+msg.root[5].maxCount);
						  $("td:eq(48)").html("总页码:"+msg.root[5].maxPage);
						   break;
					  }        
				 }
		});
		});
   });