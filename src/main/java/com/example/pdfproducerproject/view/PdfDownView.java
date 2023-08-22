package com.example.pdfproducerproject.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.pdfproducerproject.vo.CampVO;
import com.example.pdfproducerproject.vo.StudentVO;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
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
        Font font = new Font(bfKorea);

        // 캠프 정보 추가
        Paragraph campInfo = new Paragraph("캠프 정보", font);
        campInfo.setAlignment(Paragraph.ALIGN_CENTER);
        doc.add(campInfo);

        Paragraph campName = new Paragraph("캠프명: " + campVO.getName(), font);
        doc.add(campName);

        Paragraph campStartDate = new Paragraph("시작일: " + campVO.getStartDate(), font);
        doc.add(campStartDate);

        Paragraph campEndDate = new Paragraph("종료일: " + campVO.getEndDate(), font);
        doc.add(campEndDate);

        // 학생 정보 추가
        Paragraph studentInfo = new Paragraph("학생 정보", font);
        studentInfo.setAlignment(Paragraph.ALIGN_CENTER);
        doc.add(studentInfo);

        // 테이블을 생성
        Table table = new Table(3);
        table.setWidths(new float[]{2, 1, 1});
        table.setPadding(5);

        // 테이블 헤더 추가
        Cell studentNameHeader = new Cell(new Paragraph("학생 이름", font));
        table.addCell(studentNameHeader);

        Cell studentIdHeader = new Cell(new Paragraph("학번", font));
        table.addCell(studentIdHeader);

        Cell studentDepartmentHeader = new Cell(new Paragraph("학과", font));
        table.addCell(studentDepartmentHeader);

        // 학생 데이터 추가
        for (StudentVO student : studentList) {
            Cell studentNameCell = new Cell(new Paragraph(student.getName(), font));
            table.addCell(studentNameCell);

            Cell studentIdCell = new Cell(new Paragraph(student.getStudentId(), font));
            table.addCell(studentIdCell);

            Cell studentDepartmentCell = new Cell(new Paragraph(student.getDepartment(), font));
            table.addCell(studentDepartmentCell);
        }

        // 문서에 테이블 추가
        doc.add(table);
    }
}
