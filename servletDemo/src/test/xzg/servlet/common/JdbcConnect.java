package test.xzg.servlet.common;
import java.util.*;
import java.sql.*;
/**
 * title:�������ݿ⹤����
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
	    		System.out.println("�Ҳ������� OR ���������󣡣�");
				e.printStackTrace();
			}
	    	 
	    }
	    //���һ�����ݿ�����
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
	    // �رղ�������
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
