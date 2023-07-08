package com.blog.backend.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.blog.backend.mapper.AttendanceMapper;
import com.blog.backend.pojo.Attendance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private AttendanceMapper attendanceMapper;

    @Override
    public Map<Object, Object> getinfo(Object pageNum) {
        Map<Object, Object> map = new HashMap<>();

        Integer page = Integer.parseInt(pageNum.toString());
        IPage<Map<String, Object>> iPage = new Page<>(page, 5);

        List<Map<String, Object>> list = new ArrayList<>();
        list = attendanceMapper.selectMapsPage(iPage, null).getRecords();
        Long count = attendanceMapper.selectCount(null);

        System.out.println(list.toString());

        map.put("list", list);
        map.put("count", count);
        map.put("result", "success");
        return map;
    }

    @Override
    public Map<String, String> daka(Map<String, Object> data) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sti = new SimpleDateFormat("HH:mm:ss");

        String name = data.get("name").toString();
        String status = data.get("status").toString();
        Date date = null;
        Date time = null;
        try {
            date = sdf.parse(data.get("date").toString());
            time = sti.parse(data.get("currentTime").toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Map<String, String> map = new HashMap<>();

        if ("上班".equals(data.get("type").toString())) {
            Attendance attendance = new Attendance(name, date, time, null, status);
            attendanceMapper.insert(attendance);
            map.put("result", "success");
        } else {
            Attendance attendance = new Attendance(name, date, null, time, null);

            QueryWrapper<Attendance> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", name).eq("data", date);

            if (attendanceMapper.selectObjs(queryWrapper).isEmpty()) {
                map.put("result", "error");
                map.put("info", "用户不存在，下班打卡失败");
            } else {
                attendanceMapper.update(attendance, queryWrapper);
                map.put("result", "success");
            }

        }

        return map;
    }

    @Override
    public Map<String, Object> chuqing() {

        List<Attendance> list = attendanceMapper.selectList(null);

        List<Map<String, Object>> map = new ArrayList<>();
        Integer k = 0;

        for (Attendance attendance : list) {
            String name = attendance.getName();
            String status = attendance.getStatus();

            if (k == 0) {
                Map<String, Object> news = new HashMap<>();
                news.put("name", name);
                news.put("count", 1);
                if ("正常".equals(status)) {
                    news.put("chuqing", 1);
                } else {
                    news.put("chuqing", 0);
                }

                map.add(news);
                k ++;
            }
            else {
                Boolean flag = false;
                Integer p = 0;
                for (Integer i = 0; i < k; i ++) {
                    if (name.equals(map.get(i).get("name").toString())) {
                        flag = true;
                        p = i;
                        break;
                    }
                }

                if (flag) {
                    map.get(p).put("count", Integer.parseInt(map.get(p).get("count").toString()) + 1);
                    if ("正常".equals(status)) {
                        map.get(p).put("chuqing", Integer.parseInt(map.get(p).get("chuqing").toString()) + 1);
                    }
                }
                else {
                    Map<String, Object> news = new HashMap<>();
                    news.put("name", name);
                    news.put("count", 1);
                    if ("正常".equals(status)) {
                        news.put("chuqing", 1);
                    } else {
                        news.put("chuqing", 0);
                    }

                    map.add(news);
                    k ++;
                }
            }


        }

        Map<String, Object> result = new HashMap<>();
        result.put("result", "success");
        result.put("list", map);

        return result;
    }
}
