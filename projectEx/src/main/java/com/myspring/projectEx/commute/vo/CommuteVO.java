package com.myspring.projectEx.commute.vo;

import org.springframework.stereotype.Component;
import oracle.sql.NUMBER;
import java.sql.Timestamp;


@Component("commuteVO")
public class CommuteVO {
	private String id;
	private String name;
	private String job;
	private Timestamp attendance;
	private NUMBER workweek;

	public CommuteVO() {
		
	}

	public CommuteVO(String id, String name, String job, Timestamp attendance, Timestamp absent, NUMBER workweek) {
		this.id = id;
		this.name = name;
		this.job = job;
		this.attendance = attendance;
		this.workweek = workweek;
		
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Timestamp getAttendance() {
		return attendance;
	}

	public void setAttendance(Timestamp attendance) {
		this.attendance = attendance;
	}

	public NUMBER getWorkweek() {
		return workweek;
	}
	
	public void setWorkweek(NUMBER workweek) {
		this.workweek = workweek;
	}


}
