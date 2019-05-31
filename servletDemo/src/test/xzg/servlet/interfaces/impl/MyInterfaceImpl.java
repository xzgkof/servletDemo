package test.xzg.servlet.interfaces.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import test.xzg.servlet.common.JdbcConnect;
import test.xzg.servlet.common.SQLSentence;
import test.xzg.servlet.entity.MyTable;
import test.xzg.servlet.interfaces.MyInterface;

/**
 * title:业务接口实现类
 * @author king
 *
 */
public class MyInterfaceImpl implements MyInterface{
    private  Connection conn = null;
    private  PreparedStatement pstmt = null;
    private  ResultSet  rs = null;
    
    public MyInterfaceImpl(){}
    //修改
	public boolean mytabUpdate(MyTable t) {
		// TODO Auto-generated method stub
		boolean flag = true;
		try {
			conn = JdbcConnect.getConn();
			pstmt= conn.prepareStatement(SQLSentence.update);
			pstmt.setString(1, t.getMyname());
			pstmt.setInt(2, t.getMyage());
			pstmt.setString(3, t.getMysex());
			pstmt.setString(4, t.getMyhobby());
			pstmt.setString(5, t.getMyinfo());
			pstmt.setInt(6, t.getMyid());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return flag;
	}
    //添加
	public boolean mytableAdd(MyTable t) {
		boolean flag = true;
		try {
			conn = JdbcConnect.getConn();
			pstmt=conn.prepareStatement(SQLSentence.oinsert);
			int index=1;
			pstmt.setString(index++, t.getMyname());
			pstmt.setInt(index++, t.getMyage());
			pstmt.setString(index++,(t.getMysex()));
			pstmt.setString(index++, t.getMyhobby());
			pstmt.setString(index++, t.getMyinfo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return flag;
	}
    //删除
	public boolean mytableDelete(int id) {
		boolean flag = true;
		try {
			conn = JdbcConnect.getConn();
			pstmt = conn.prepareStatement(SQLSentence.delete);
			pstmt.setInt(1, id);
			pstmt.execute();
		} catch (Exception e) {
			 flag = false;
	         e.printStackTrace();
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return flag;
	}

	public boolean query() {
		// TODO Auto-generated method stub
		return false;
	}
	//查询总记录
	public int queryCount() {
		int count =0;
		try {
			conn = JdbcConnect.getConn();
			pstmt = conn.prepareStatement(SQLSentence.qcount);
			rs = pstmt.executeQuery();
			if(rs.next()){
				 count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return count;
	}
	//分页查询
	public ArrayList<MyTable> queryInfo(int curPage, int rowsPrePage) {
		// TODO Auto-generated method stub
		ArrayList<MyTable> list = new ArrayList<MyTable>();
		try {
			conn = JdbcConnect.getConn();
			pstmt = conn.prepareStatement(SQLSentence.Pagingfororacle);
			pstmt.setInt(1, curPage*rowsPrePage);
			pstmt.setInt(2, (curPage-1)*rowsPrePage+1);
//			pstmt.setInt(1, (curPage-1)*rowsPrePage);
//			pstmt.setInt(2, rowsPrePage);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MyTable   mb = new MyTable();
				mb.setMyid(Integer.parseInt(rs.getString("myid")));
				mb.setMyname(rs.getString("myname"));
				mb.setMyage(Integer.parseInt(rs.getString("myage")));
				mb.setMysex(rs.getString("mysex"));
				mb.setMyhobby(rs.getString("myhobby"));
				mb.setMyinfo(rs.getString("myinfo"));
				list.add(mb);
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	public MyTable getMytableById(int id) {
		MyTable   mytable = new MyTable();
		try {
			conn = JdbcConnect.getConn();
			pstmt = conn.prepareStatement(SQLSentence.GetMyTableById);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				mytable.setMyid(rs.getInt("myid"));
				mytable.setMyage(rs.getInt("myage"));
				mytable.setMyname(rs.getString("myname"));
				mytable.setMyhobby(rs.getString("myhobby"));
				mytable.setMysex(rs.getString("mysex"));
				mytable.setMyinfo(rs.getString("myinfo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcConnect.close(conn, pstmt, rs);
		}
		return mytable;
	}

}
