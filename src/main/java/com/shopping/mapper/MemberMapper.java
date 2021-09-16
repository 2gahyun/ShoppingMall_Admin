package com.shopping.mapper;

import java.util.List;

import com.shopping.vo.MemberVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    public void insertMember(MemberVO vo);
    public Integer selectMemberById(String id);
    public Integer selectMemberByEmail(String email);
    public void deleteMember(Integer seq);
    public List<MemberVO> selectMemberAll();
    public String selectMemberGen(Integer seq);
    public Integer memberLogin(MemberVO vo);
}
