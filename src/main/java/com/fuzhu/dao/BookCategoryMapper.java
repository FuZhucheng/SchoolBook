package com.fuzhu.dao;


import com.fuzhu.entity.BookCategory;

public interface BookCategoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BookCategory record);

    int insertSelective(BookCategory record);

    BookCategory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BookCategory record);

    int updateByPrimaryKey(BookCategory record);
}