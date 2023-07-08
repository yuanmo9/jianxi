package com.blog.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.blog.backend.pojo.Attendance;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceMapper extends BaseMapper<Attendance> {
}
