package com.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
	
	Optional<Student> findByEmail(String email);
	
	List<Student> findByCourse(String course);
	
    Optional<Student> findByEmailAndMobile(String email, String mobile);
    
    List<Student> findByEmailOrMobile(String email, String mobile);
    
    List<Student> findByNameContainingIgnoreCase(String name);
   
    @Query("select s from Student s where s.email= ?1")
    Optional<Student> searchByEmail(String email);    

    @Query("Select s from Student s where s.course=?1")
    List<Student> searchByCourse(String course);   

    @Query("Select s from Student s where s.email=?1 and s.mobile=?2")
    Optional<Student> searchByEmailAndMobile(String email, String mobile);   
    
    boolean existsByEmail(String email);

    @Query("select s.course, count(s) from Student s group by s.course")
    List<Object[]> countStudentsByCourse();
}
