package test.xzg.servlet.action;
/**
 * title:mytable action
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import test.xzg.servlet.common.PageBean;
import test.xzg.servlet.entity.MyTable;
import test.xzg.servlet.interfaces.MyInterface;
import test.xzg.servlet.interfaces.impl.MyInterfaceImpl;
public class ServletInAJAX extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MyInterface dao = new MyInterfaceImpl();
    private MyTable table = new MyTable();
    private PageBean pageBean= new PageBean();
	/**
	 * Constructor of the object.
	 */
	public ServletInAJAX() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		//添加
		if(request.getParameter("method").equals("add"))
		{	
		table.setMyname(request.getParameter("name"));
		table.setMyage(Integer.parseInt(request.getParameter("age")));
		table.setMysex(request.getParameter("sex"));
		table.setMyhobby(request.getParameter("hobby"));
		table.setMyinfo(request.getParameter("info"));
		boolean flag = dao.mytableAdd(table);
		String msg = "";
		if(flag){
			 msg ="添加成功";
			 request.setAttribute("msg", msg);
			 request.getRequestDispatcher("/index.jsp").include(request, response);
		}else{
			  msg = "添加失败";
			  request.setAttribute("msg", msg);
			  request.getRequestDispatcher("/index.jsp").include(request, response);
		}
		}
		//查询
		if(request.getParameter("method").equals("home")){
			   List<MyTable> list = (ArrayList<MyTable>) queryData(1);
			   Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", pageBean.getCurPage()+"");
   	           map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
			   List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
			   paglist.add(map);
			   response.getWriter().print(new JSONObject().element("root", list).element("paging", paglist));
			   
		}
		//上一页
		if(request.getParameter("method").equals("upPage")){
			   ArrayList  list = null;
			   if(pageBean.getCurPage() == 1){
				    list = (ArrayList) queryData(1);
				    //request.getRequestDispatcher("/test?method=query").include(request, response);
			   }else{
				 list = (ArrayList)queryData(pageBean.getCurPage()-1);
			   }
			   Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", pageBean.getCurPage()+"");
     	       map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
		       List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
			   paglist.add(map);
			   response.getWriter().print(new JSONObject().element("root", list).element("paging", paglist));
		}
		//下一页
		if(request.getParameter("method").equals("downPage")){
			 ArrayList list = null;
		     if(pageBean.getCurPage() == pageBean.getMaxPage()){
		    	  list = (ArrayList) queryData(pageBean.getMaxPage());
		     }else{
		    	 list = (ArrayList) queryData(pageBean.getCurPage()+1); 
		    	 Map<String,String> map = new HashMap<String,String>();
			       map.put("curPage", pageBean.getCurPage()+"");
	   	           map.put("maxPage", pageBean.getMaxPage()+"");
			       map.put("maxCount",pageBean.getMaxCount()+"");
			       List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
				   paglist.add(map);
			       //JSONArray ja = JSONArray.fromObject(list);
				   response.getWriter().print(new JSONObject().element("root", list).element("paging", paglist));
		     }	       
		}
		//尾页
		if(request.getParameter("method").equals("endPage")){
			List list = (ArrayList) queryData(pageBean.getMaxPage()); 
			Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", pageBean.getCurPage()+"");
	           map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
		       List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
			   paglist.add(map);
		       response.getWriter().print(new JSONObject().element("root", list).element("paging", paglist));
		      
		}
		//删除
		if(request.getParameter("method").equals("remove")){
		    boolean flag = dao.mytableDelete(Integer.parseInt(request.getParameter("id")));
		    String msg = "";
		    if(flag){
		    	msg = "删除成功";
		    }else{
		    	msg ="删除失败";
		    }
		    ArrayList list =  (ArrayList) queryData(pageBean.getCurPage()); 
		    Map<String,String> map = new HashMap<String,String>();
		      map.put("curPage", pageBean.getCurPage()+"");
	          map.put("maxPage", pageBean.getMaxPage()+"");
		      map.put("maxCount",pageBean.getMaxCount()+"");
		      List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
			  paglist.add(map);
			  Map<String,String> msgMap = new HashMap<String,String>();
			  msgMap.put("msg", msg);
			  List<Map<String,String>> msglist = new ArrayList<Map<String,String>>();
			  msglist.add(msgMap);
		      response.getWriter().print(new JSONObject().element("root", list).element("paging",paglist).element("msg", msglist));
		}
		//修改
		if(request.getParameter("method").equals("modify")){
			//System.out.println(request.getParameter("id"));
			MyTable  t =  new MyTable();
			t.setMyid(Integer.parseInt(request.getParameter("myid")));
			t.setMyname(request.getParameter("myname"));
			t.setMyage(Integer.parseInt(request.getParameter("myage")));
			t.setMysex(request.getParameter("mysex").equals("m")?"男":"女");
			t.setMyhobby(request.getParameter("myhobby"));
			t.setMyinfo(request.getParameter("myinfo"));
			System.out.println(t.toString());
			boolean flag = dao.mytabUpdate(t);
			String msg = "";
			if(flag){
				msg = "修改成功";
			}else{
				msg ="修改失败";
			}
			response.getWriter().print(new JSONObject().element("msg", msg));
			}
		if(request.getParameter("method").equals("upinfo")){
			request.setAttribute("id", request.getParameter("id"));
			request.setAttribute("name", new String(request.getParameter("name").getBytes("ISO-8859-1"),"GBK"));
			request.setAttribute("age", request.getParameter("age"));
			request.setAttribute("sex", new String(request.getParameter("sex").getBytes("ISO-8859-1"),"GBK"));
			request.setAttribute("hobby", new String(request.getParameter("hobby").getBytes("ISO-8859-1"),"GBK"));
			request.setAttribute("info", new String(request.getParameter("info").getBytes("ISO-8859-1"),"GBK"));
			request.getRequestDispatcher("/update.jsp").include(request,response);
		}
		//首页
		if(request.getParameter("method").equals("shouye")){
			   JSONObject json = new JSONObject();
			   ArrayList list = (ArrayList) queryData(1);
		       Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", "1");
     	       map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
		       list.add(map);
		       JSONArray  ja = JSONArray.fromObject(list);
		       json.element("root", ja);
		       response.getWriter().print(json);
		}
		//当前页(跳转到第几页)
		if(request.getParameter("method").equals("show")){
			//System.out.println("show");
			int jump = Integer.parseInt(request.getParameter("ym"));
			ArrayList list = (ArrayList) queryData(jump);
			Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", pageBean.getCurPage()+"");
  	           map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
		       List<Map<String,String>> paglist = new ArrayList<Map<String,String>>();
			   paglist.add(map);
			   response.getWriter().print(new JSONObject().element("root", list).element("paging", paglist));
		}
		if(request.getParameter("method").equals("testajax")){
			 /*response.getWriter().
			 print(new JSONObject().
		     element("root",JSONArray.
		     fromObject(new ArrayList().add(new HashMap().put("name", "fff")))));
		      */
			 ArrayList list = new ArrayList();
			 HashMap map = new HashMap();
			 map.put("name", "xiezengguang");
			 map.put("age", "27");
			 list.add(map);
			 response.getWriter().print(new JSONObject().element("root",
					 JSONArray.fromObject(list)));
		}
		
		if(request.getParameter("method").equals("getRecord")){
			   int id = Integer.parseInt(request.getParameter("id"));
			   MyTable table = dao.getMytableById(id);
			   //System.out.println("table:"+table.toString());
			   response.getWriter().print(new JSONObject().element("table",table));
		}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             this.doGet(request, response);
	}
    //查询
	private List queryData(int jumpPage){
		pageBean = new PageBean(dao.queryCount(),5);
		//处理页码
		if(jumpPage <= 1){
			 pageBean.setCurPage(1);
		}else if(jumpPage >=pageBean.getMaxPage()){
			 pageBean.setCurPage(pageBean.getMaxPage());
		}else{
			pageBean.setCurPage(jumpPage);
		}
		List list = dao.queryInfo(pageBean.getCurPage(), pageBean.getRowPrePage());
		return list;
	}
	/**
	 * json格式化公用方法
	 * @param key
	 * @param list
	 * @return
	 */
	public JSONObject formatJsonData(String key,List<?> list){
		JSONObject json = new JSONObject();
		JSONArray  ja = JSONArray.fromObject(list);
	     json.element(key, ja);
		  return json;
	} 
     /**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
