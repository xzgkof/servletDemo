package test.xzg.servlet.interfaces;
import java.util.List;
import test.xzg.servlet.entity.MyTable;
/**
 * title:ҵ��ӿ�
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
	    //��ҳ��ѯ
	    List queryInfo(int curPage,int rosPrePage);
	    //��ѯ�ܼ�¼
	    int queryCount();
	    //��ѯ����
	    MyTable getMytableById(int id);
}
