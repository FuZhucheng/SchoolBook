package com.fuzhu.service;

import com.fuzhu.entity.Order;

import java.util.List;

/**
 * Created by 符柱成 on 2017/12/3.
 */
public interface OrderService {
    int insert(Order record);

    List<Order> getMyOrder(Long userId);
}

