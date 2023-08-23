package com.example.pdfproducerproject.controller;

import com.example.pdfproducerproject.service.CampService;
import com.example.pdfproducerproject.service.StudentService;
import com.example.pdfproducerproject.view.PdfDownView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;
import com.example.pdfproducerproject.vo.CampVO;
import com.example.pdfproducerproject.vo.StudentVO;

@Controller
public class PdfController {


    private final PdfDownView pdfDownView;

    @Autowired
    public PdfController(PdfDownView pdfDownView) {
        this.pdfDownView = pdfDownView;
    }
    @Autowired
    CampService campService;
    @Autowired
    StudentService studentService;
    @GetMapping("/pdf/{campKey}/{studentKey}")
    public ModelAndView showPdfView(Model model,@PathVariable("studentKey")int studentKey, @PathVariable("campKey")int campKey){
        ModelAndView modelAndView = new ModelAndView(pdfDownView);
        List<StudentVO> list = new ArrayList<StudentVO>();
        StudentVO studentVO = studentService.getStudent(studentKey);
        list.add(studentVO);
        CampVO campVO = campService.getCamp(campKey);
        //뷰에게 전달할 데이터 저장
        model.addAttribute("list",list);
        model.addAttribute("c",campVO);
        //출력할 뷰 이름 리턴
        return modelAndView;
    }

    @GetMapping(value = "/pdfSelectedStudents/{campKey}")
    public ModelAndView deleteSelectedStudents(Model model,@RequestParam("studentKeys") List<Integer> studentKeys, @PathVariable("campKey")int campKey) {
        ModelAndView modelAndView = new ModelAndView(pdfDownView);
        List<StudentVO> list = new ArrayList<StudentVO>();

        for (Integer studentKey : studentKeys) {
            StudentVO studentVO = studentService.getStudent(studentKey);
            list.add(studentVO);
        }
        CampVO campVO = campService.getCamp(campKey);
        //뷰에게 전달할 데이터 저장
        model.addAttribute("list",list);
        model.addAttribute("c",campVO);
        //출력할 뷰 이름 리턴
        return modelAndView;
    }
}
