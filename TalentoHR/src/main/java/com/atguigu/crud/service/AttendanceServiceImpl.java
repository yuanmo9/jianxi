package com.atguigu.crud.service;

import com.atguigu.crud.dao.AttendanceMapper;
import com.atguigu.crud.dao.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttendanceServiceImpl implements AttendanceService {
    @Autowired
    private AttendanceMapper attendanceMapper;

    @Override
    public Object getUserInfo() {
        System.out.println("00000");
        Object userInfo = attendanceMapper.selectList(null);
        System.out.println(userInfo.toString());
        return userInfo;
    }
}
