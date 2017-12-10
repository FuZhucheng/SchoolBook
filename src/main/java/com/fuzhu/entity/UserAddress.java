package com.fuzhu.entity;


/**
 * Created by 符柱成 on 2017/12/10.
 */
public class UserAddress {//额外的功能表，提供记录用户地址，方便用户选择
    private Long id;

    private Long userId;

    private String receiver;//收货人

    private String fullAddress;//全地址

    private String productCode;//订单编码

    private String phone;//电话

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
