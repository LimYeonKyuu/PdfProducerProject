package com.example.pdfproducerproject.controller;

import com.example.pdfproducerproject.service.CampService;
import com.example.pdfproducerproject.vo.CampVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    CampService campService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/camp")
    public String camp() {
        return "camp";
    }

    @GetMapping("/addCamp")
    public String addCamp() {
        return "addCamp";
    }
    @PostMapping("/addStudentOk")
    public String addStudentOk() {
        return "redirect:/camp";
    }

    @PostMapping("/addCampOk")
    public String addCampOk(CampVO vo) {
        System.out.print(vo.getName());
        System.out.print(vo.getStartDate());
        System.out.print(vo.getEndDate());
        System.out.print(vo.getContent());
        campService.insertCamp(vo);
        return "redirect:/";
    }
}
