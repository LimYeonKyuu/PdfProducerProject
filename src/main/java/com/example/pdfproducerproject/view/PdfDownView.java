package com.example.pdfproducerproject.view;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

import com.example.pdfproducerproject.vo.CampVO;
import com.example.pdfproducerproject.vo.StudentVO;
import com.lowagie.text.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

@Component
public class PdfDownView extends AbstractPdfView {

    @Override
    protected void buildPdfDocument(
            Map<String, Object> model,
            Document doc,
            PdfWriter writer,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        List<StudentVO> studentList = (List<StudentVO>) model.get("list");
        CampVO campVO = (CampVO) model.get("c");
        // 기본 폰트 설정 - 폰트에 따라 한글 출력 여부가 결정된다.
        BaseFont bfKorea = BaseFont.createFont("/fonts/goongseo.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bfKorea,15);
        Font bigFont = new Font(bfKorea, 45);
        Font midFont = new Font(bfKorea, 25);

        // 수료증 제목 추가
        Paragraph subject = new Paragraph("수료증", bigFont);
        subject.setAlignment(Paragraph.ALIGN_CENTER);
        doc.add(subject);

        doc.add(new Paragraph("\n\n\n\n"));

        //이름 추가
        Paragraph name = new Paragraph("성명: " + studentList.get(0).getName(), font);
        name.setIndentationLeft(370);
        doc.add(name);

        //학번 추가
        Paragraph studentId = new Paragraph("학번: " + studentList.get(0).getStudentId(), font);
        studentId.setIndentationLeft(370);
        doc.add(studentId);

        //학부 추가
        Paragraph department = new Paragraph("학부: " + studentList.get(0).getDepartment(), font);
        department.setIndentationLeft(370);
        doc.add(department);

        doc.add(new Paragraph("\n"));
        //캠프명 추가
        Paragraph camp = new Paragraph("캠프명: " + campVO.getName(), font);
        camp.setIndentationLeft(40);
        doc.add(camp);

        //기간 추가
        Paragraph date = new Paragraph("기간: " + campVO.getFormatEndDate() + "~"+ campVO.getFormatEndDate(), font);
        date.setIndentationLeft(40);
        doc.add(date);

        doc.add(new Paragraph("\n\n\n\n\n"));

        //내용 추가
        Paragraph content = new Paragraph("위 사람은 "+campVO.getFormatStartDate()+ "부터 "+ campVO.getFormatEndDate()+"까지 진행되는 "+ campVO.getName() + " 과정을 성실히 이수하였음으로 이 증서를 드립니다.", midFont);
        content.setAlignment(Paragraph.ALIGN_CENTER);
        content.setIndentationLeft(45);
        content.setIndentationRight(45);
        doc.add(content);


        doc.add(new Paragraph("\n\n\n\n\n"));

        //오늘 날짜 추가
        LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String formattedDate = now.format(formatter);
        Paragraph nowDate = new Paragraph(formattedDate ,font);
        nowDate.setAlignment(Paragraph.ALIGN_CENTER);
        doc.add(nowDate);

        doc.newPage();
        doc.add(subject);

    }
}
