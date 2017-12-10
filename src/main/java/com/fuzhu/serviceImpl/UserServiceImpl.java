package com.fuzhu.serviceImpl;

import com.fuzhu.dao.UserMapper;
import com.fuzhu.entity.User;
import com.fuzhu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 符柱成 on 2017/11/29.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    @Override
    public User selectByPrimaryKey(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User login(String account, String password) {
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("account", account);
        obj.put("password", password);
        User user = userMapper.selectByAccount(obj);
        return user;
    }

    public int insert(User record) {
        return userMapper.insert(record);
    }

    public User selectByAccount(Map userInfo) {
        return userMapper.selectByAccount(userInfo);
    }

    @Override
    public User getUserInfoByGoodsId(Integer bookId) {
        return userMapper.getUserInfoByGoodsId(bookId);
    }


}
