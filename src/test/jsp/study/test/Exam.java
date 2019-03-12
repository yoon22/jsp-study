package test.jsp.study.test;

public class Exam {
public static void main(String[] args) {
	for(int i =1;i<=100;i++) {	
		String numStr = i+"";
		numStr =  numStr.substring(numStr.length()-1);		
		int num = Integer.parseInt(numStr);
		
		if (num!=0 && num%3 == 0) {			
			System.out.println("짝!");
		}else {
			System.out.println(i);
		}
	}
	
	
}
}
