package com.example.pdfproducerproject.service;

import com.example.pdfproducerproject.vo.StudentVO;

import java.util.List;

public interface StudentService {
    int insertStudent(StudentVO vo);
    int deleteStudent(int studentKey);
    int deleteAllStudent(int CampKey);
    int updateStudent(StudentVO vo);
    StudentVO getStudent(int studentKey);
    List<StudentVO> getStudentList(int campKey);
}
