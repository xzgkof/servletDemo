package test.xzg.servlet.common;
/*
 *分页工具类
 */
public class PageBean {
         private int curPage; //页码
         private int rowPrePage; //每页显示的条数
         private int maxPage;//总页码
         private int maxCount;//总记录数
         
         public PageBean(int maxCount,int rowPrePage){
        	 this.maxCount=maxCount;
        	 this.rowPrePage = rowPrePage;
        	 maxPage();
         }
         
         public PageBean(){}
         
         //计算总页码
         public void maxPage(){
        	  if(maxCount % rowPrePage == 0){
        		   maxPage = maxCount / rowPrePage;
        	  }else{
        		   maxPage = maxCount / rowPrePage+1;
        	  }
         }

		public int getCurPage() {
			return curPage;
		}

		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}

		public int getRowPrePage() {
			return rowPrePage;
		}

		public void setRowPrePage(int rowPrePage) {
			this.rowPrePage = rowPrePage;
		}

		public int getMaxPage() {
			return maxPage;
		}

		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}

		public int getMaxCount() {
			return maxCount;
		}

		public void setMaxCount(int maxCount) {
			this.maxCount = maxCount;
		}
         
         
}
