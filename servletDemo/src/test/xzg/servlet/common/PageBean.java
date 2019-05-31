package test.xzg.servlet.common;
/*
 *��ҳ������
 */
public class PageBean {
         private int curPage; //ҳ��
         private int rowPrePage; //ÿҳ��ʾ������
         private int maxPage;//��ҳ��
         private int maxCount;//�ܼ�¼��
         
         public PageBean(int maxCount,int rowPrePage){
        	 this.maxCount=maxCount;
        	 this.rowPrePage = rowPrePage;
        	 maxPage();
         }
         
         public PageBean(){}
         
         //������ҳ��
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
