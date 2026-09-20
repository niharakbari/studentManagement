package com.demo.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.LinkedHashMap;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entity.Student;
import com.demo.exception.ResourceNotfoundException;
import com.demo.payload.StudentDto;
import com.demo.repository.StudentRepository;

@Service
public class StudentService {
	
	private static final Logger log = LoggerFactory.getLogger(StudentService.class);
	
	@Autowired
	private StudentRepository repo;

	public StudentDto createStudent(StudentDto dto) {
		Student student = convertToEntity(dto);
		Student savedEntity = repo.save(student);
		return convertToDto(savedEntity);
	}

	public void deleteStudent(long id) {
		repo.deleteById(id);
	}

	public StudentDto updateStudent(StudentDto dto) {
		Student student = convertToEntity(dto);
		Student savedEntity = repo.save(student);
		return convertToDto(savedEntity);
	}

	public List<StudentDto> getStudents() {
		List<Student> students = repo.findAll();
		return students.stream()
				.map(this::convertToDto)
				.collect(Collectors.toList());
	}

	public StudentDto getStudentById(long id) {
		log.info("Fetching student by ID: {}", id);
		Student student = repo.findById(id).orElseThrow(
			() -> new ResourceNotfoundException("Record not found with id: " + id)
		);
		return convertToDto(student);
	}

	public StudentDto getStudentByEmail(String email) {
		return repo.searchByEmail(email)
				.map(this::convertToDto)
				.orElse(null);
	}

	public List<StudentDto> filterStudentByCourse(String course) {
		return repo.searchByCourse(course).stream()
				.map(this::convertToDto)
				.collect(Collectors.toList());
	}

	public StudentDto filterStudentByEmailAndMobile(String email, String mobile) {
		return repo.searchByEmailAndMobile(email, mobile)
				.map(this::convertToDto)
				.orElse(null);
	}

	public List<StudentDto> filterStudentByEmailOrMobile(String email, String mobile) {
		return repo.findByEmailOrMobile(email, mobile).stream()
				.map(this::convertToDto)
				.collect(Collectors.toList());
	}

	public List<StudentDto> filterStudentByContainingName(String name) {
		return repo.findByNameContainingIgnoreCase(name).stream()
				.map(this::convertToDto)
				.collect(Collectors.toList());
	}

	public boolean verifyStudentByEmail(String email) {
		return repo.existsByEmail(email);
	}

	public long countStudents() {
		return repo.count();
	}

	public Map<String, Long> getStudentCountByCourse() {
		List<Object[]> rows = repo.countStudentsByCourse();
		Map<String, Long> map = new LinkedHashMap<>();
		for (Object[] row : rows) {
			String course = (String) row[0];
			Long count = (Long) row[1];
			map.put(course, count);
		}
		return map;
	}

	// Utility methods for Entity <-> DTO conversion
	public StudentDto convertToDto(Student s) {
		StudentDto dto = new StudentDto();
		BeanUtils.copyProperties(s, dto);
		return dto;
	}

	public Student convertToEntity(StudentDto dto) {
		Student s = new Student();
		BeanUtils.copyProperties(dto, s);
		return s;
	}
}