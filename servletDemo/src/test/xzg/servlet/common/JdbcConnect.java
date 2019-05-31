package test.xzg.servlet.common;
import java.util.*;
import java.sql.*;
/**
 * title:链接数据库工具类
 * @author king
 *
 */
public class JdbcConnect {
        private static Properties prop = new Properties();
	    static{
	    	  
	    	  try {
	    	    //Properties prop = new Properties();
				prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties"));
			    Class.forName(prop.getProperty("driver"));
				//Class.forName(prop.getProperty("mysqlDriver"));
	    	  } catch (Exception e) {
				// TODO Auto-generated catch block
	    		System.out.println("找不到驱动 OR 驱动名错误！？");
				e.printStackTrace();
			}
	    	 
	    }
	    //获得一个数据库链接
	    public static Connection getConn(){
	        Connection conn =null;
		    try {
		    	//Oracle
		      	conn = DriverManager.getConnection(prop.getProperty("url"),
			    prop.getProperty("username"),prop.getProperty("password"));
		    	//Mysql
		    	//conn = DriverManager.getConnection(prop.getProperty("mysqlUrl"));
		    	//System.out.println(conn);
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
	     return conn;   
		   
	    	
	    }
	    // 关闭操作对象
	    public static void  close(Connection conn,PreparedStatement pstmt,ResultSet rs){
	    	 try {
				 if(pstmt != null)
					 pstmt.close();
				 if(rs != null)
					 rs.close();
				 if(conn != null)
					 conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
	    	 
	    }
//	    public static void main(String[] args) {
//			 new JdbcConnect().getConn();
//		}
}
