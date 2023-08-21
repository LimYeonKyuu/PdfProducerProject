package com.example.pdfproducerproject.controller;

import com.example.pdfproducerproject.service.CampService;
import com.example.pdfproducerproject.vo.CampVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    CampService campService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("list", campService.getCampList());
        return "index";
    }

    @GetMapping("/camp/{campKey}")
    public String camp(@PathVariable("campKey")int campKey, Model model) {
        CampVO campVO = campService.getCamp(campKey);
        model.addAttribute("c", campVO);
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
        campService.insertCamp(vo);
        return "redirect:/";
    }

    @GetMapping("/deleteCampOk/{campKey}")
    public String deleteCampOk(@PathVariable("campKey")int campKey){
        campService.deleteCamp(campKey);
        return "redirect:/";
    }

    @PostMapping("/updateCampOk")
    public String updateCampOk(CampVO vo) {
        campService.updateCamp(vo);
        return "redirect:/";
    }
}
