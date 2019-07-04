package test.xzg.servlet.interfaces;
import java.util.List;
import test.xzg.servlet.entity.MyTable;
/**
 * title:业务接口
 * @author xiezengguang
 *
 */
public interface MyInterface {
        
	    boolean mytableAdd(MyTable t);
	    //update
	    boolean mytabUpdate(MyTable t);
	    //delete
	    boolean mytableDelete(int id);
	    //query all 
	    boolean query();
	    //分页查询
	    List queryInfo(int curPage,int rosPrePage);
	    //查询总记录
	    int queryCount();
	    //查询单个
	    MyTable getMytableById(int id);
}
