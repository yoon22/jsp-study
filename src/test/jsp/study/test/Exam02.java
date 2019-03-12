package test.jsp.study.test;

class Dog {
	String name;
}
class Cat {
	String name;
}
public class Exam02 {
	
	Dog d; //멤버변수(멤버필드) : 클래스 영역 안에 있으면서 다른 영역이 없어야함. 
	//static : class변수!!  안붙으면 인스턴스 변수!!!

	public Dog getDog() {
		if (d == null) {
			d = new Dog();
		}
		return d;
	}

	public static void main(String[] args) {
		Exam02 e = new Exam02();
		Dog d = e.getDog(); //지역변수(로컬변수)
		d.name = "퍼피";
		d = e.getDog();
		System.out.println(d.name);
	}
}
