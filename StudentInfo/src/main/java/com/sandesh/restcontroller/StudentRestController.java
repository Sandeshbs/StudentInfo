package com.sandesh.restcontroller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.sandesh.entities.Student;
import com.sandesh.service.StudentService;

@RestController
public class StudentRestController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/")
	public String showHome(){
		return "welcome To Spring boot project";
	}

	@GetMapping("/save-student")
	public String saveStudent(){
		Student student = new Student("Sandesh", "ComputerScience", new Date(), false);
		studentService.saveStudent(student);
		return "Student Info Saved";
	}
	
	@GetMapping("/student/{studentId}")
	public Student getStudent(@PathVariable Integer studentId){
		return studentService.getStudent(studentId);
	}
	
	@GetMapping("/list-student")
	public List<Student> getStudentList(){
		return studentService.studentList();
	}
}










