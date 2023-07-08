package com.atguigu.crud.controller;

import com.atguigu.crud.dao.AttendanceMapper;
import com.atguigu.crud.dao.AttendanceService;
import com.atguigu.crud.service.AttendanceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private AttendanceMapper attendanceMapper;

    private AttendanceServiceImpl attendanceServiceimpl;

    @RequestMapping("/kaoqing")
    public String money() {
        return "money";
    }

    @RequestMapping(value="/getinfo",method= RequestMethod.GET)
    @ResponseBody
    public Object getinfo() {
        Object userInfo = attendanceMapper.selectList(null);
        System.out.println(userInfo.toString());
        return userInfo;
    }
}
