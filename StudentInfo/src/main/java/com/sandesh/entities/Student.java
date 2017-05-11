package com.sandesh.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Student {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer studentId;
	private String studentName;
	private String branch;
	//@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date date;
	private boolean finished;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(String studentName, String branch, Date date, boolean finished) {
		super();
		this.studentName = studentName;
		this.branch = branch;
		this.date = date;
		this.finished = finished;
	}



	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isFinished() {
		return finished;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

}
