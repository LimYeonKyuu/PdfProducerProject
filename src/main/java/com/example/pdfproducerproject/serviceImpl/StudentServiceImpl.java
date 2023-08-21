package com.example.pdfproducerproject.serviceImpl;

import com.example.pdfproducerproject.dao.StudentDAO;
import com.example.pdfproducerproject.service.StudentService;
import com.example.pdfproducerproject.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDAO studentDAO;

    @Override
    public int insertStudent(StudentVO vo) {
        return studentDAO.insertStudent(vo);
    }

    @Override
    public int deleteStudent(int studentKey) {
        return studentDAO.deleteStudent(studentKey);
    }

    @Override
    public int deleteAllStudent(int campKey) {
        return studentDAO.deleteAllStudent(campKey);
    }

    @Override
    public int updateStudent(StudentVO vo) {
        return studentDAO.updateStudent(vo);
    }

    @Override
    public StudentVO getStudent(int studentKey) {
        return studentDAO.getStudent(studentKey);
    }

    @Override
    public List<StudentVO> getStudentList(int campKey) {
        return studentDAO.getStudentList(campKey);
    }

}
