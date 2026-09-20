package com.demo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class StudentManager {
    private List<Student> students;
    private int nextId;

    public StudentManager() {
        this.students = new ArrayList<>();
        this.nextId = 1;
    }

    public void createStudent(String name, String course, String email, String mobile) {
        Student student = new Student(nextId++, name, course, email, mobile);
        students.add(student);
        System.out.println("Student created successfully: " + student.getName());
    }

    public void readAllStudents() {
        if (students.isEmpty()) {
            System.out.println("No students found.");
            return;
        }
        System.out.println("--- Student Records ---");
        for (Student student : students) {
            System.out.println(student);
        }
        System.out.println("-----------------------");
    }

    public void updateStudent(int id, String name, String course, String email, String mobile) {
        Optional<Student> studentOpt = students.stream().filter(s -> s.getId() == id).findFirst();
        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();
            if (name != null && !name.isEmpty()) student.setName(name);
            if (course != null && !course.isEmpty()) student.setCourse(course);
            if (email != null && !email.isEmpty()) student.setEmail(email);
            if (mobile != null && !mobile.isEmpty()) student.setMobile(mobile);
            System.out.println("Student updated successfully.");
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
    }

    public void deleteStudent(int id) {
        boolean removed = students.removeIf(s -> s.getId() == id);
        if (removed) {
            System.out.println("Student deleted successfully.");
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
    }
}
