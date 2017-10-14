package com.sandesh.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.sandesh.entities.Student;
import com.sandesh.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@GetMapping("/index")
	public String studentHome(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "student";
	}
	
	@GetMapping("/list")
	public String studentList(HttpServletRequest request){
		request.setAttribute("students",studentService.studentList());
		request.setAttribute("mode", "MODE_LIST");
		return "student";
	}
	
	@GetMapping("/new")
	public String newStudentForm(HttpServletRequest request,Map<String, Object> map){
		request.setAttribute("mode", "MODE_NEW");
		Student student = new Student();
		map.put("student", student);
		return "student";
	}
	
	@PostMapping("/save")
	public String saveStudent(@ModelAttribute Student student,HttpServletRequest request) {
		//student.setDate(new Date());
		studentService.saveStudent(student);
		request.setAttribute("students",studentService.studentList());
		request.setAttribute("mode", "MODE_LIST");
		
		System.out.println("Date updated :"+student.getDate());
		
		return "student";
	}
	
	@GetMapping("/update/{studentId}")
	public String updateStudent(HttpServletRequest request,@PathVariable Integer studentId){
		request.setAttribute("student", studentService.getStudent(studentId));
		request.setAttribute("mode", "MODE_UPDATE");
		return "student";
	}
	
	@GetMapping("/delete/{studentId}")
	public String deleteStudent(HttpServletRequest request,@PathVariable Integer studentId){
		studentService.deleteStudent(studentId);
		request.setAttribute("students",studentService.studentList());
		request.setAttribute("mode", "MODE_LIST");
		return "student";
	}
	
}
