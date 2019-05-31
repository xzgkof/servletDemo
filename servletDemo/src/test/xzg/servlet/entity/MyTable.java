package test.xzg.servlet.entity;
/**
 * title: µÃÂ¿‡
 * @author king
 *
 */
public class MyTable {
	     private int myid;
         private String myname;
         private int myage;
         private String mysex;
         private String myhobby;
         private String myinfo;
		public String getMyname() {
			return myname;
		}
		public void setMyname(String myname) {
			this.myname = myname;
		}
		public int getMyage() {
			return myage;
		}
		public void setMyage(int myage) {
			this.myage = myage;
		}
		public String getMysex() {
			return mysex;
		}
		public void setMysex(String string) {
			this.mysex = string;
		}
		public String getMyhobby() {
			return myhobby;
		}
		public void setMyhobby(String myhobby) {
			this.myhobby = myhobby;
		}
		public String getMyinfo() {
			return myinfo;
		}
		public void setMyinfo(String myinfo) {
			this.myinfo = myinfo;
		}
		public int getMyid() {
			return myid;
		}
		public void setMyid(int myid) {
			this.myid = myid;
		}
         
         @Override
        public String toString() {
        	// TODO Auto-generated method stub
        	return 
        	"myid:"+myid+",myname:"+myname+",myinfo:"+myinfo+
        	",myage"+myage+",myhobby:"+myhobby+",mysex:"+mysex;
        }
}
