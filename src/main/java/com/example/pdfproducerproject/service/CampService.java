package com.example.pdfproducerproject.service;

import com.example.pdfproducerproject.vo.CampVO;

import java.util.List;

public interface CampService {
    int insertCamp(CampVO vo);
    int deleteCamp(int campKey);
    int updateCamp(CampVO vo);
    CampVO getCamp(int campKey);
    List<CampVO> getCampList();
}
