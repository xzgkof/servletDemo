package test.xzg.servlet.common;
/**
 * title:
 * @author xiezg
 * 
 */
public interface SQLSentence {
           String oinsert="insert into mytable values(mytab_seq.nextval,?,?,?,?,?)";
           String minsert="insert into mytable values(null,?,?,?,?,?)";
           String update="update mytable  t set t.myname=? ,t.myage=?, t.mysex =? ,t.myhobby =?,t.myinfo=? where t.myid=?";
           String delete="delete from mytable where myid=?";
           String qcount="select count(*) from mytable";
           String Pagingfororacle="select * from(select T.*,ROWNUM RN from MyTable T where ROWNUM<=? order by T.myid) where RN>=?";
           String Pagingformysql=" select * from mytable limit ? , ?";
           String PagingforOracle2 = "select * from(select T.*,ROWNUM RN from MyTable T order by T.myid) where RN between ? and ?";
           String GetMyTableById = "select * from mytable where myid = ?"; 
        	   
}
