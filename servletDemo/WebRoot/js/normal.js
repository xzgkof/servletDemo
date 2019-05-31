$(document).ready(function (){
                  $("tbody>tr:odd").addClass("odd");
                  $("tbody>tr:even").addClass("even");
                  $('tbody>tr').click(function() {
			     //判断当前是否选中
			     var hasSelected=$(this).hasClass('selected');
			    //如果选中，则移出selected类，否则就加上selected类
			     $(this)[hasSelected?"removeClass":"addClass"]('selected')
				//查找内部的checkbox,设置对应的属性。
				  .find(':checkbox').attr('checked',!hasSelected);
		});
		// 如果复选框默认情况下是选择的，则高色.
		      $('tbody>tr:has(:checked)').addClass('selected'); 
         });     
         
         $('#close').click(function(){
            //document.getElementById('light').style.display='none';
            //document.getElementById('fade').style.display='none';
            $("#light").css("display","none");
            $("#fade").css("display","none");
         });
         
         $('[name=upd]').bind('click',function(){
          //console.log($(this).parent().parent().find('td:eq(0)').html());
         //document.getElementById('light').style.display='block';
         //document.getElementById('fade').style.display='block';
          $("#light").css("display","block");
          $("#fade").css("display","block");
          $('[name=id]').val($(this).parent().parent().find('td:eq(0)').html());
          $('[name=name]').val($(this).parent().parent().find('td:eq(1)').html());
          $('[name=age]').val($(this).parent().parent().find('td:eq(2)').html());
          //$('[name=sex]').val($(this).parent().parent().find('td:eq(3)').html());
          $('[name=hobby]').val($(this).parent().parent().find('td:eq(4)').html());
          $('[name=info]').val($(this).parent().parent().find('td:eq(5)').html());
         }); 