package com.blog.backend.controller;

import com.blog.backend.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class TestController {
    @Autowired
    private TestService testService;

    @GetMapping("/kaoqing/getinfo")
    public Map<Object, Object> getinfo(@RequestParam Map<String, Object> data) {
        return testService.getinfo(data.get("currentPage"));
    }

    @GetMapping("/kaoqing/daka")
    public Map<String, String> daka(@RequestParam Map<String, Object> data) {
        return testService.daka(data);
    }

    @GetMapping("/kaoqing/chuqing")
    public Map<String, Object> chuqing() {
        return testService.chuqing();
    }
}
