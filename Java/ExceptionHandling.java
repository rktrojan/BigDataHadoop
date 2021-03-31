package analytics;

public class ExceptionHandling {
	
	public static void main(String [] args) {
		
int x[]= {2,3,4,55};

for (int i=0; i<x.length; i++) {
	
	try {
	 System.out.println(x[i]);
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		System.out.println("final block");
		
	}
	
	
//	catch(ArrayIndexOutOfBoundsException e) {
//		//e.printStackTrace();
//		System.out.println("out of bound error occured");
//	}catch(Exception e) {
//		//e.printStackTrace();
//		System.out.println("error occured");
//	}
	
	
	
}

	System.out.println("running program");	
	}

}
