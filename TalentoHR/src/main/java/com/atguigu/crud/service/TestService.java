package com.blog.backend.service;


import java.util.Map;

public interface TestService {
    public Map<Object, Object> getinfo(Object pageNum);
    Map<String, String> daka(Map<String, Object> data);
    Map<String, Object> chuqing();
}
