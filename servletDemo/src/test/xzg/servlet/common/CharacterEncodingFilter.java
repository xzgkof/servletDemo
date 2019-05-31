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
 * 类说明：字符过滤器
 * */
public class CharacterEncodingFilter implements Filter{
    private String encode = "UTF-8"; //默认UTF-8编码
    
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
	 * 对get方式传递的请求参数进行编码
	 * */
	 class CharacterEncodingRequest extends HttpServletRequestWrapper {
	    private HttpServletRequest request;
		
		public CharacterEncodingRequest(HttpServletRequest request) {
			super(request);
		    this.request = request;
		}
		/** 
	     * 对参数重新编码 
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

