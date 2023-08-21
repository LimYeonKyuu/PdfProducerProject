package com.example.pdfproducerproject.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CampVO  {
    private int campKey;
    private String name;
    private String startDate;
    private String endDate;
    private String content;
    private int student;
}
