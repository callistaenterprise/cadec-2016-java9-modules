package se.callista.java9.modules.appminimal;

public class App {

	public static void main(String[] args) {
		System.out.println("started minimal app: " + new java.util.Date());
		// wait to be terminated ...
		try {
		System.in.read();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
