package se.callista.java9.modules.app1;

import java.util.Date;

import se.callista.java9.modules.common.api.Echo;
import se.callista.java9.modules.common.internal.Formatter;

public class App1 {

	public static void main(String[] args) {
		Echo e = new Echo();
		e.echo("hello : " + new Formatter().formatDate(new Date()));
	}

}
