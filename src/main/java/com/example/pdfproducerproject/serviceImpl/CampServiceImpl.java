package com.example.pdfproducerproject.serviceImpl;

import com.example.pdfproducerproject.dao.CampDAO;
import com.example.pdfproducerproject.service.CampService;
import com.example.pdfproducerproject.vo.CampVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CampServiceImpl implements CampService {
    @Autowired
    CampDAO campDAO;

    @Override
    public int insertCamp(CampVO vo) {
        return campDAO.insertCamp(vo);
    }

    @Override
    public int deleteCamp(int seq) {
        return campDAO.deleteCamp(seq);
    }

    @Override
    public int updateCamp(CampVO vo) {
        return campDAO.updateCamp(vo);
    }

    @Override
    public CampVO getCamp(int campKey) {
        return campDAO.getCamp(campKey);
    }

    @Override
    public List<CampVO> getCampList() {
        return campDAO.getCampList();
    }

}
