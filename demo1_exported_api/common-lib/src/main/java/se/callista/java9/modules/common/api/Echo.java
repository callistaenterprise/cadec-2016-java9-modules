package se.callista.java9.modules.common.api;

import java.util.Date;
import java.sql.Timestamp;

import se.callista.java9.modules.common.internal.Formatter;

public class Echo {

	public void echo(String s) {
		System.out.println(s);
	}

	public void echo(String s, Date d) {
		System.out.println(s + " at " + new Formatter().formatDate(d));
	}

	public void echo(String s, Timestamp ts) {
		System.out.println(s + " at " + new Formatter().formatDate(ts));
	}

}
