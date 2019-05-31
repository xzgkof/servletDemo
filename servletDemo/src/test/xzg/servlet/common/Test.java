package test.xzg.servlet.common;

import java.io.UnsupportedEncodingException;

public class Test {
       public static void main(String[] args) throws UnsupportedEncodingException {
		        System.out.println(getEncoding("·¢·¢"));
	}
       
       
       public static String getEncoding(String str) {    
           String encode = "GB2312";    
          try {    
              if (str.equals(new String(str.getBytes(encode), encode))) {    
                   String s = encode;    
                  return s;    
               }    
           } catch (Exception exception) {    
           }    
           encode = "ISO-8859-1";    
          try {    
              if (str.equals(new String(str.getBytes(encode), encode))) {    
                   String s1 = encode;    
                  return s1;    
               }    
           } catch (Exception exception1) {    
           }    
           encode = "UTF-8";    
          try {    
              if (str.equals(new String(str.getBytes(encode), encode))) {    
                   String s2 = encode;    
                  return s2;    
               }    
           } catch (Exception exception2) {    
           }    
           encode = "GBK";    
          try {    
              if (str.equals(new String(str.getBytes(encode), encode))) {    
                   String s3 = encode;    
                  return s3;    
               }    
           } catch (Exception exception3) {    
           }    
          return "";    
       }    
}
