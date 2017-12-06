package com.fuzhu.serviceImpl;

import com.fuzhu.dao.CategoryMapper;
import com.fuzhu.entity.Category;
import com.fuzhu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 符柱成 on 2017/12/6.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> getParentTypeList() {
        return categoryMapper.getParentTypeList();
    }
}
