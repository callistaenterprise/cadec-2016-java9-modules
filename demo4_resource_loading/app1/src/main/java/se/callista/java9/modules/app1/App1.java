package se.callista.java9.modules.app1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Iterator;

import se.callista.java9.modules.common.api.Echo;

public class App1 {

	public static void main(String[] args) {
		// make sure we have access to Echo in the common-lib module
		Echo echo = new Echo();
		echo.echo("echo still working!");
		
		// load resources
		try {
			App1 app = new App1();

			app.load("app1.properties");
			app.load("common.properties");
			
			app.tryLoadResourceAsUrl("app1.properties");
			app.tryLoadResourceAsUrl("common.properties");
			app.tryLoadResourceAsUrl("spring-context-example.xml");

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
		// also try *this* classloader ...
		//try (InputStream is = getClass().getClassLoader().getResourceAsStream(name)) {
			
			if (is == null) {
				System.out.println("Could not find resource!");
			}
			
			byte[] buf = new byte[8192];
			ByteArrayOutputStream bos = new ByteArrayOutputStream(buf.length);
			int n = 0;
			while ((n = is.read(buf)) != -1) {
				bos.write(buf, 0, n);
			}
			return bos.toByteArray();
		}
	}
	
	private void tryLoadResourceAsUrl(String name) {
		try {
			Enumeration<URL> urls = Thread.currentThread().getContextClassLoader().getResources(name);
			while (urls.hasMoreElements()) {
				System.out.println("URL: " + urls.nextElement());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
