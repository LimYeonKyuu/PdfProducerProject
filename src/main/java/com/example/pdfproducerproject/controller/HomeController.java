package com.example.pdfproducerproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

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
}
