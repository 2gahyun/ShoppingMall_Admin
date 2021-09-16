package com.shopping.controller;

import java.util.List;

import com.shopping.service.MemberService;
import com.shopping.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
    @Autowired MemberService m_service;

    @GetMapping("/member/add")
    public String getMemberAdd(){
        return "/member/add";
    }

    @GetMapping("/member/member_list")
    public String getMemberList(Model model){
        
        List<MemberVO> resultlist = m_service.selectMemberAll();
        model.addAttribute("list", resultlist);

        return "/member/member_list";
    }

    @GetMapping("/member/login")
    public String getMemberLogin(){
        return "member/login";
    }


}
