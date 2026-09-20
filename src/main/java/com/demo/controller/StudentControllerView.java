package com.demo.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.payload.StudentDto;
import com.demo.service.StudentService;

@Controller
public class StudentControllerView {

	private static final Logger log = LoggerFactory.getLogger(StudentControllerView.class);

	@Autowired
	private StudentService service;

	// Landing page
	@GetMapping("/")
	public String landingPage() {
		return "landing";
	}

	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		long totalStudents = service.countStudents();
		Map<String, Long> countsByCourse = service.getStudentCountByCourse();
		model.addAttribute("totalStudents", totalStudents);
		model.addAttribute("countsByCourse", countsByCourse);
		return "dashboard";
	}

	@GetMapping("/search")
	public String searchStudents(@RequestParam(required = false) String name,
								 @RequestParam(required = false) String course,
								 @RequestParam(required = false) String email,
								 @RequestParam(required = false) String mobile,
								 Model model) {

		List<StudentDto> results = null;

		if (name != null && !name.isEmpty()) {
			results = service.filterStudentByContainingName(name);
		} else if (course != null && !course.isEmpty()) {
			results = service.filterStudentByCourse(course);
		} else if (email != null && !email.isEmpty() && mobile != null && !mobile.isEmpty()) {
			StudentDto dto = service.filterStudentByEmailAndMobile(email, mobile);
			if (dto != null) {
				results = Collections.singletonList(dto);
			}
		} else if (email != null && !email.isEmpty()) {
			StudentDto dto = service.getStudentByEmail(email);
			if (dto != null) {
				results = Collections.singletonList(dto);
			}
		}

		model.addAttribute("results", results);
		return "search_students";
	}

	@RequestMapping("/view")
	public String viewRegistrationPage() {
		return "create_registration";
	}

	@PostMapping("/createReg")
	public String createStudent(@Valid @ModelAttribute StudentDto dto, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			model.addAttribute("msg", "Error: " + result.getAllErrors().get(0).getDefaultMessage());
			return "create_registration";
		}
		
		service.createStudent(dto);
		model.addAttribute("msg", "Record is saved successfully.");
		return "create_registration";
	}

	@RequestMapping("/deleteReg")
	public String deleteStudent(@RequestParam long id, Model model) {
		service.deleteStudent(id);
		List<StudentDto> dtos = service.getStudents();
		model.addAttribute("students", dtos);
		return "list_registration";
	}

	@PostMapping("/updateReg")
	public String updateStudent(@Valid @ModelAttribute StudentDto dto, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("msg", "Error: " + result.getAllErrors().get(0).getDefaultMessage());
			return "update_registration";
		}
		
		service.updateStudent(dto);
		List<StudentDto> dtos = service.getStudents();
		model.addAttribute("students", dtos);
		return "list_registration";
	}

	@GetMapping("/findReg")
	public String getAllStudents(Model model) {
		List<StudentDto> dtos = service.getStudents();
		model.addAttribute("students", dtos);
		return "list_registration";
	}

	@RequestMapping("/studentByIdReg")
	public String getStudentsById(@RequestParam long id, Model model) {
		log.info("Inside getStudentById() method for id: {}", id);
		StudentDto dto = service.getStudentById(id);
		model.addAttribute("dto", dto);
		return "update_registration";
	}

	@GetMapping("/studentByEmailReg")
	public ResponseEntity<?> getStudentByEmail(@RequestParam String email) {
		log.info("Search record by email id: {}", email);
		StudentDto dto = service.getStudentByEmail(email);
		if (dto == null) {
			return new ResponseEntity<>("No Record found", HttpStatus.OK);
		}
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

	@GetMapping("/filterStudentByCourseReg")
	public ResponseEntity<List<StudentDto>> filterStudentByCourse(@RequestParam String course) {
		List<StudentDto> dtos = service.filterStudentByCourse(course);
		return new ResponseEntity<>(dtos, HttpStatus.OK);
	}

	@GetMapping("/filterStudentByEmailAndMobileReg")
	public ResponseEntity<?> filterStudentByEmailAndMobile(@RequestParam String email, @RequestParam String mobile) {
		StudentDto dto = service.filterStudentByEmailAndMobile(email, mobile);
		if (dto == null) {
			return new ResponseEntity<>("No Record found", HttpStatus.OK);
		}
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

	@GetMapping("/filterStudentByEmailOrMobileReg")
	public ResponseEntity<?> filterStudentByEmailOrMobile(@RequestParam String email, @RequestParam String mobile) {
		List<StudentDto> dtos = service.filterStudentByEmailOrMobile(email, mobile);
		return new ResponseEntity<>(dtos, HttpStatus.OK);
	}

	@GetMapping("/filterStudentByContainingNameReg")
	public ResponseEntity<?> filterStudentByContainingName(@RequestParam String name) {
		List<StudentDto> dtos = service.filterStudentByContainingName(name);
		return new ResponseEntity<>(dtos, HttpStatus.OK);
	}
}