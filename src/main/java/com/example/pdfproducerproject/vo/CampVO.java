package com.example.pdfproducerproject.vo;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CampVO  {
    private int campKey;
    private String name;
    private Date startDate;
    private Date endDate;
    private String content;
    private int student;
}
