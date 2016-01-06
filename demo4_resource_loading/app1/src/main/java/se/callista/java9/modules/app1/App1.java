package se.callista.java9.modules.app1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class App1 {

	public static void main(String[] args) {
		// load resources
		try {
			App1 app = new App1();

			app.load("app1.properties");
			app.load("common.properties");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void load(String name) throws IOException {
		System.out.println("loading resource: " + name);
		System.out.println(loadResourceAsString(name, "UTF-8"));
	}

	private String loadResourceAsString(String name, String encoding) throws IOException {
		byte[] r = loadResource(name);
		return new String(r, encoding);
	}

	private byte[] loadResource(String name) throws IOException {
		try (InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(name)) {
			byte[] buf = new byte[8192];
			ByteArrayOutputStream bos = new ByteArrayOutputStream(buf.length);
			int n = 0;
			while ((n = is.read(buf)) != -1) {
				bos.write(buf, 0, n);
			}
			return bos.toByteArray();
		}
	}

}
