package com.example.pdfproducerproject.dao;

import com.example.pdfproducerproject.vo.CampVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class CampDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertCamp(CampVO vo) {
        System.out.println("abc");
        int result = sqlSession.insert("Camp.insertCamp", vo);
        return result;
    }

    public int updateCamp(CampVO vo) {
        int result = sqlSession.update("Camp.updateCamp", vo);
        return result;
    }

    public int deleteCamp(int campKey) {
        int result = sqlSession.delete("Camp.deleteCamp", campKey);
        return result;
    }

    public CampVO getCamp(int campKey) {
        CampVO result = sqlSession.selectOne("Camp.getCamp", campKey);
        return result;
    }

    public List<CampVO> getCampList() {
        List<CampVO> result = sqlSession.selectList("Camp.getCampList");
        return result;
    }
}
