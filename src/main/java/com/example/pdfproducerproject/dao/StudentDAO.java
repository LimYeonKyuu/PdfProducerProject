package com.example.pdfproducerproject.dao;

import com.example.pdfproducerproject.vo.StudentVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class StudentDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertStudent(StudentVO vo) {
        int result = sqlSession.insert("Student.insertStudent", vo);
        return result;
    }

    public int updateStudent(StudentVO vo) {
        int result = sqlSession.update("Student.updateStudent", vo);
        return result;
    }

    public int deleteStudent(int studentKey) {
        int result = sqlSession.delete("Student.deleteStudent", studentKey);
        return result;
    }

    public int deleteAllStudent(int campKey) {
        int result = sqlSession.delete("Student.deleteAllStudent", campKey);
        return result;
    }

    public StudentVO getStudent(int studentKey) {
        StudentVO result = sqlSession.selectOne("Student.getStudent", studentKey);
        return result;
    }

    public List<StudentVO> getStudentList(int campKey) {
        List<StudentVO> result = sqlSession.selectList("Student.getStudentList",campKey);
        return result;
    }
}
