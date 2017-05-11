package com.sandesh.dao;

import org.springframework.data.repository.CrudRepository;

import com.sandesh.entities.Student;

public interface StudentRepository extends CrudRepository<Student, Integer>{

}
