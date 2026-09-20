package com.demo.payload;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class StudentDto {
	
	private long id;
	
	@NotBlank(message = "Name cannot be empty")
	@Size(min = 3, max = 24, message = "Name should be between 3 and 24 characters")
	private String name;
	
	@NotBlank(message = "Course cannot be empty")
	private String course;
	
	@NotBlank(message = "Email cannot be empty")
	@Email(message = "Invalid email format")
	private String email;
	
	@NotBlank(message = "Mobile cannot be empty")
	@Size(min = 10, max = 10, message = "Mobile should be exactly 10 digits")
	private String mobile;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}