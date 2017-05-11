package com.sandesh.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sandesh.dao.StudentRepository;
import com.sandesh.entities.Student;

@Service
@Transactional
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;
	
	public Student getStudent(Integer studentId){
		return studentRepository.findOne(studentId);
	}
	
	public void saveStudent(Student student){
		studentRepository.save(student);
	}
	
	public List<Student> studentList(){
		return (List<Student>) studentRepository.findAll();
	}
	
	public void deleteStudent(Integer studentId){
		studentRepository.delete(studentId);
	}

}
