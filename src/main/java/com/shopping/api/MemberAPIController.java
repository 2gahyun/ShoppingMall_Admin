package com.shopping.api;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.shopping.service.MemberService;
import com.shopping.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberAPIController {
    @Autowired MemberService m_service;

    @PostMapping("/member/api/add")
    public Map<String, Object> postMemberAdd(@RequestBody MemberVO vo){
        // Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        return m_service.insertMember(vo);
    }

    @GetMapping("/member/checkId")
    public Map<String, Object> isDuplicateId(@RequestParam String id){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        // isDuplicateId (아이디가 중복이 되는가?) - true그렇다 / false아니다
        if(m_service.isDuplicateId(id) == true){
            // 중복체크 - 실패(false)
            // if(!r.status) {사용가능}
            resultMap.put("status", false);
            resultMap.put("message", "["+id+"]는 중복되는 아이디입니다.");
        } else {
            resultMap.put("status", true);
            resultMap.put("message", "["+id+"]는 가입 가능한 아이디입니다.");
        }
        return resultMap;
    }

    @GetMapping("/member/checkEmail")
    public Map<String, Object> isDuplicateEmail(@RequestParam String email){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        if(m_service.isDuplicateEmail(email)==true){
            resultMap.put("status", false);
            resultMap.put("message", "["+email+"]는 중복되는 아이디입니다.");
        } else {
            resultMap.put("status", true);
            resultMap.put("message", "["+email+"]는 가입 가능한 이메일입니다.");
        }
        return resultMap;
    }

    @DeleteMapping("/member/api/delete")
    public Map<String, Object> deleteMember(@RequestParam Integer seq){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        m_service.deleteMember(seq);
        resultMap.put("status", true);
        resultMap.put("message", "삭제되었습니다.");

        return resultMap;
    }

    @GetMapping("/member/api/list")
    public Map<String, Object> getMember(){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        List<MemberVO> mlist = m_service.selectMemberAll();
        resultMap.put("data", mlist);

        List<MemberVO> list = m_service.selectMembers();
        resultMap.put("data", list);

        return resultMap;
    }
}
