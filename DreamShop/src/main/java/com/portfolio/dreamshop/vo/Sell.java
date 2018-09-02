package com.portfolio.dreamshop.vo;

public class Sell {
    private Integer pictureCd;

    private String userId;

    private Integer sales;

    private String pictureExp;

    public Integer getPictureCd() {
        return pictureCd;
    }

    public void setPictureCd(Integer pictureCd) {
        this.pictureCd = pictureCd;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public String getPictureExp() {
        return pictureExp;
    }

    public void setPictureExp(String pictureExp) {
        this.pictureExp = pictureExp;
    }
}