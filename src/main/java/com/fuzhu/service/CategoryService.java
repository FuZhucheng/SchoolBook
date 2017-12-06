package com.fuzhu.service;

import com.fuzhu.entity.Category;

import java.util.List;

/**
 * Created by 符柱成 on 2017/12/6.
 */
public interface CategoryService {
    List<Category> getParentTypeList();

}
