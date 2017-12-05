package com.fuzhu.service;

import com.fuzhu.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by 符柱成 on 2017/11/29.
 */
public interface UserService {
    List<User> getAllUser();

    int deleteByPrimaryKey(Long id);

    int updateByPrimaryKey(User record);

    User selectByPrimaryKey(Long id);

    User login(String account,String password);

    int insert(User record);

    User selectByAccount(Map userInfo);

}
