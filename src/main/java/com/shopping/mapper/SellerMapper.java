package com.shopping.mapper;

import java.util.List;

import com.shopping.vo.SellerInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
    public void insertSeller(SellerInfoVO vo);
    public Integer selelctSellerById(String id);
    public List<SellerInfoVO> selectSellerAll();
    public void deleteSeller(Integer seq);
    public String selectSellerName(Integer seq);
    public Integer selectSellerCnt(Integer seq);
}
