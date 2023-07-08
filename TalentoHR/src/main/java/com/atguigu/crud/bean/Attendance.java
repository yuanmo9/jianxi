package com.blog.backend.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attendance {
    private String name;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    private Date data;
    @JsonFormat(pattern = "HH:mm:ss", timezone = "Asia/Shanghai")
    private Date workHours;
    @JsonFormat(pattern = "HH:mm:ss", timezone = "Asia/Shanghai")
    private Date closingTime;
    private String status;
}
