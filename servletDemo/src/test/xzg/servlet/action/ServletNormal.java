package test.xzg.servlet.action;
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
public class ServletNormal extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private MyInterface dao = new MyInterfaceImpl();
    private MyTable table = new MyTable();
    private PageBean pageBean= new PageBean();

	
	public void destroy() {
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		
		//���
		if(request.getParameter("method").equals("add"))
		{	
		table.setMyname(request.getParameter("name"));
		table.setMyage(Integer.parseInt(request.getParameter("age")));
		table.setMysex(request.getParameter("sex"));
		table.setMyhobby(request.getParameter("hobby"));
		table.setMyinfo(request.getParameter("info"));
		boolean flag = dao.mytableAdd(table);
		String msg = "";
		List list = new ArrayList();
		Map map = new HashMap();
		if(flag){
			 msg ="��ӳɹ�";
			 map.put("msg",msg);
		     list.add(map);
			
		}else{
			  msg = "���ʧ��";
			  map.put("msg",msg);
		      list.add(map);
		}
	    JSONArray ja = JSONArray.fromObject(list);
		response.getWriter().print(new JSONObject().element("root", ja));
		}
		
		//��ѯ
		if(request.getParameter("method").equals("query")){
			ArrayList<MyTable> list = (ArrayList) queryData(1);
			request.setAttribute("list", list);
			request.setAttribute("curPage", 1);
			request.setAttribute("maxPage", pageBean.getMaxPage());
			request.setAttribute("maxCount", pageBean.getMaxCount());
			request.getRequestDispatcher("/main.jsp").include(request, response);
		}
		
		//��һҳ
		if(request.getParameter("method").equals("upPage")){
			   ArrayList  list = null;
			   if(pageBean.getCurPage() == 1)
				    list = (ArrayList) queryData(1);
			   else
				    list = (ArrayList)queryData(pageBean.getCurPage()-1);
			   
				request.setAttribute("list", list);
				request.setAttribute("curPage", pageBean.getCurPage());
				request.setAttribute("maxPage", pageBean.getMaxPage());
				request.setAttribute("maxCount", pageBean.getMaxCount());
				request.getRequestDispatcher("/main.jsp").include(request, response);
			     
		}
		
		//��һҳ
		if(request.getParameter("method").equals("downPage")){
			 ArrayList list;
		     if(pageBean.getCurPage() == pageBean.getMaxPage())
		       list = (ArrayList) queryData(pageBean.getMaxPage());
		     else
		       list = (ArrayList) queryData(pageBean.getCurPage()+1);  
		     	
		     request.setAttribute("list", list);
	    	 request.setAttribute("curPage", pageBean.getCurPage());
			 request.setAttribute("maxPage", pageBean.getMaxPage());
			 request.setAttribute("maxCount", pageBean.getMaxCount());
		     request.getRequestDispatcher("/main.jsp").include(request, response);
		}
		
		//βҳ
		if(request.getParameter("method").equals("endPage")){
			ArrayList list = (ArrayList) queryData(pageBean.getMaxPage()); 
			request.setAttribute("list", list);
			request.setAttribute("curPage", pageBean.getCurPage());
			request.setAttribute("maxPage", pageBean.getMaxPage());
			request.setAttribute("maxCount", pageBean.getMaxCount());
			request.getRequestDispatcher("/main.jsp").include(request, response);
		}
		
		//ɾ��
		if(request.getParameter("method").equals("del")){
			boolean flag = dao.mytableDelete(Integer.parseInt(request.getParameter("id")));
		    String msg = "";
		    if(flag)
		    	msg = "ɾ���ɹ�";
		    else
		    	msg ="ɾ��ʧ��";

		     request.setAttribute("msg", msg);
		     ArrayList list =  (ArrayList) queryData(pageBean.getCurPage()); 
	    	 request.setAttribute("list", list);
	    	 request.setAttribute("curPage", pageBean.getCurPage());
			 request.setAttribute("maxPage", pageBean.getMaxPage());
			 request.setAttribute("maxCount", pageBean.getMaxCount());
		     request.getRequestDispatcher("/main.jsp").include(request, response);  
		}
		
		//�޸�
		if(request.getParameter("method").equals("modify")){
			MyTable  t =  new MyTable();
			t.setMyid(Integer.parseInt(request.getParameter("id")));
			t.setMyname(request.getParameter("name"));
			t.setMyage(Integer.parseInt(request.getParameter("age")));
			t.setMysex(request.getParameter("sex"));
			t.setMyhobby(request.getParameter("hobby"));
			t.setMyinfo(request.getParameter("info"));
			boolean flag = dao.mytabUpdate(t);
			String msg = "";
			if(flag){
				msg = "�޸ĳɹ�";
			}else{
				msg ="�޸�ʧ��";
			}
			 request.setAttribute("msg", msg);
			 ArrayList<MyTable> list = (ArrayList<MyTable>) queryData(pageBean.getCurPage()); 
	    	 request.setAttribute("list", list);
	    	 request.setAttribute("curPage", pageBean.getCurPage());
			 request.setAttribute("maxPage", pageBean.getMaxPage());
			 request.setAttribute("maxCount", pageBean.getMaxCount());
		     request.getRequestDispatcher("/main.jsp").include(request, response);
		     //response.getWriter().print(msg);
		}
		
		//��ǰҳ(��ת���ڼ�ҳ)
		if(request.getParameter("method").equals("show")){
			//System.out.println("show");
			int jump = Integer.parseInt(request.getParameter("ym"));
			ArrayList list = (ArrayList) queryData(jump);
			Map<String,String> map = new HashMap<String,String>();
		       map.put("curPage", pageBean.getCurPage()+"");
  	           map.put("maxPage", pageBean.getMaxPage()+"");
		       map.put("maxCount",pageBean.getMaxCount()+"");
		       list.add(map);
		   response.getWriter().print(new JSONObject().element("root", JSONArray.fromObject(list)));
		}
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             this.doGet(request, response);
	}
    //��ѯ
	private List queryData(int jumpPage){
		pageBean = new PageBean(dao.queryCount(),5);
		//����ҳ��
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
     
	public void init() throws ServletException {
		// Put your code here
		
	}
}
