package com.myspring.projectEx.commute.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("articleeworkVO")
public class ArticleworkVO {
	private Timestamp  absent;
	
	public Timestamp getAbsent() {
		return absent;
	}

	public void setAbsent(Timestamp absent) {
		this.absent = absent;
	}



}
