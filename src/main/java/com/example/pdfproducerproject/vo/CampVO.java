package com.example.pdfproducerproject.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

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
    private int students;
    public String getFormatStartDate(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        return simpleDateFormat.format(this.startDate);
    }
    public String getFormatEndDate(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        return simpleDateFormat.format(this.endDate);
    }
}
