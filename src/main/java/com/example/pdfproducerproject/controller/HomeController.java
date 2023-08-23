package com.example.pdfproducerproject.controller;

import com.example.pdfproducerproject.service.CampService;
import com.example.pdfproducerproject.service.StudentService;
import com.example.pdfproducerproject.vo.CampVO;
import com.example.pdfproducerproject.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    CampService campService;
    @Autowired
    StudentService studentService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("campList", campService.getCampList());
        return "index";
    }

    @GetMapping("/camp/{campKey}")
    public String camp(@PathVariable("campKey")int campKey, Model model) {
        CampVO campVO = campService.getCamp(campKey);
        model.addAttribute("c", campVO);
        model.addAttribute("studentList",studentService.getStudentList(campKey));
        return "camp";
    }

    @GetMapping("/addCamp")
    public String addCamp() {
        return "addCamp";
    }

    @PostMapping("/addStudentOk")
    public String addStudentOk(StudentVO vo) {
        studentService.insertStudent(vo);
        campService.studentUp(vo.getCampKey());
        return "redirect:/camp/"+ vo.getCampKey();
    }

    @GetMapping("/deleteStudentOk/{campKey}/{studentKey}")
    public String deleteStudentOk(@PathVariable("studentKey")int studentKey, @PathVariable("campKey")int campKey){
        studentService.deleteStudent(studentKey);
        campService.studentDown(campKey);
        return "redirect:/camp/"+campKey;
    }

    @PostMapping("/addCampOk")
    public String addCampOk(CampVO vo) {
        campService.insertCamp(vo);
        return "redirect:/";
    }

    @GetMapping("/deleteCampOk/{campKey}")
    public String deleteCampOk(@PathVariable("campKey")int campKey){
        studentService.deleteAllStudent(campKey);
        campService.deleteCamp(campKey);
        return "redirect:/";
    }

    @PostMapping("/updateCampOk")
    public String updateCampOk(CampVO vo) {
        campService.updateCamp(vo);
        return "redirect:/";
    }

    @PostMapping("/updateCampOkInPage")
    public String updateCampOkInPage(CampVO vo) {
        campService.updateCamp(vo);
        return "redirect:/camp/"+vo.getCampKey();
    }

    @PostMapping("/updateStudentOk")
    public String updateStudentOk(StudentVO vo) {
        studentService.updateStudent(vo);
        return "redirect:/camp/"+vo.getCampKey();
    }

    @GetMapping(value = "/deleteSelectedStudents/{campKey}")
    public String deleteSelectedStudents(@RequestParam("studentKeys") List<Integer> studentKeys,@PathVariable("campKey")int campKey) {

        for (Integer studentKey : studentKeys) {
            studentService.deleteStudent(studentKey);
            campService.studentDown(campKey);
        }
        return "redirect:/camp/"+campKey;
    }
}
