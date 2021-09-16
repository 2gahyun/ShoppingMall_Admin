package com.shopping.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.shopping.mapper.MemberMapper;
import com.shopping.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired MemberMapper m_mapper;

    public Map<String, Object> insertMember(MemberVO vo){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        boolean duplicated = isDuplicateId(vo.getMi_id());
        if(duplicated) {
            // false - 회원가입에 실패했다.
            // 프론트나, arc 쪽에서 확인
            resultMap.put("status", false);
            resultMap.put("message", "아이디가 중복됩니다.");
            return resultMap;
        }

        boolean email_dup = isDuplicateEmail(vo.getMi_email());
        if(email_dup){
            resultMap.put("status", false);
            resultMap.put("message", "이메일 중복됩니다.");
            return resultMap;
        }

        // if(vo.getMi_id() == "" || vo.getMi_id() == null || vo.getMi_id().length() < 4){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "아이디가 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_pwd() == "" || vo.getMi_pwd() == null || vo.getMi_pwd().length() < 6){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "비밀번호가 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_name() == "" || vo.getMi_name() == null){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "이름이 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_email() == "" || vo.getMi_email() == null){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "이메일이 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_address() == "" || vo.getMi_address() == null){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "주소가 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_birth() == null){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "생년월일이 입력되지 않았습니다.");
        //     return resultMap;
        // }
        // if(vo.getMi_phone() == "" || vo.getMi_phone() == null){
        //     resultMap.put("status", false);
        //     resultMap.put("message", "전화번호가 입력되지 않았습니다.");
        //     return resultMap;
        // }
        m_mapper.insertMember(vo);

        resultMap.put("status", true);
        resultMap.put("message", "회원가입이 완료되었습니다.");

        return resultMap;
    }

    public boolean isDuplicateId(String id){
        return m_mapper.selectMemberById(id) > 0;
    }
    public boolean isDuplicateEmail(String email){
            return m_mapper.selectMemberByEmail(email) > 0;
    }

    public List<MemberVO> selectMemberAll(){
        return m_mapper.selectMemberAll();
    }

    public void deleteMember(Integer seq){
        m_mapper.deleteMember(seq);
    }

    public List<MemberVO> selectMembers(){
        List<MemberVO> list = m_mapper.selectMemberAll();
        for(int i=0; i<list.size(); i++){
            Integer mem_seq = list.get(i).getMi_seq();
            String mi_gen = m_mapper.selectMemberGen(mem_seq);
            list.get(i).setMember_gen(mi_gen);
        }
        return list;
    }

    // public List<MemberVO> memberLogin(){

    // }
}
