package com.fuzhu.serviceImpl;

import com.fuzhu.dao.OrderMapper;
import com.fuzhu.entity.Order;
import com.fuzhu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 符柱成 on 2017/12/4.
 */
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int insert(Order record) {
        return orderMapper.insert(record);
    }
}
