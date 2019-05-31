package test.xzg.servlet.common;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
/*
 * ��˵�����ַ�������
 * */
public class CharacterEncodingFilter implements Filter{
    private String encode = "UTF-8"; //Ĭ��UTF-8����
    
    public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
        String encoding = filterConfig.getInitParameter("encode");
         if(encoding != null){
        	 encode = encoding;
        }
	}
    
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		      HttpServletRequest request  = (HttpServletRequest)req;
		      HttpServletResponse response = (HttpServletResponse)resp;
		      
		      request.setCharacterEncoding(encode);
		      response.setContentType("text/html;charset="+encode);
		      response.setCharacterEncoding(encode);
		      chain.doFilter(new CharacterEncodingRequest(request), response);
	}

   
	/*
	 * ��get��ʽ���ݵ�����������б���
	 * */
	 class CharacterEncodingRequest extends HttpServletRequestWrapper {
	    private HttpServletRequest request;
		
		public CharacterEncodingRequest(HttpServletRequest request) {
			super(request);
		    this.request = request;
		}
		/** 
	     * �Բ������±��� 
	     */ 
		 @Override
		public String getParameter(String name) {
			String value = super.getParameter(name);
			if(value == null)
				return null;
			 String method = request.getMethod();
			 if("post".equalsIgnoreCase(method)){
				  try {
					  value = new String(value.getBytes("ISO8859-1"),
							  request.getCharacterEncoding());
				} catch (Exception e) {
				     e.printStackTrace();
				}
			 }
			return value;
		}

	}

}

