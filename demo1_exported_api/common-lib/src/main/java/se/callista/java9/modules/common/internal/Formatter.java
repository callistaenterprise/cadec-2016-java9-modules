package se.callista.java9.modules.common.internal;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Formatter {

	public String formatDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return sdf.format(date);
	}

}
