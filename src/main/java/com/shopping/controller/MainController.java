package com.shopping.controller;

import com.shopping.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @Autowired MemberService service;
    @GetMapping("/")
    public String getMain(){
        return "/index";
    }

    
}
