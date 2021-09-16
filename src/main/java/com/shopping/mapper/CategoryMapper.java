package com.shopping.mapper;

import java.util.List;

import com.shopping.vo.CategoryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
    public void insertCategory(String name);
    public Integer isDuplicateCategory(String name); // 중복카테고리명 걸러내기 위함
    public List<CategoryVO> selectCategoryAll();
    public void deleteCategory(Integer seq);
    public String selectCategoryName(Integer seq);
    public Integer selectCateProdCnt(Integer seq);
}
