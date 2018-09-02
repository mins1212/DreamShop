package com.portfolio.dreamshop.vo;

import java.util.Date;

public class Picture {
    private Integer pictureCd;

    private String pictureNm;

    private Integer picturePrice;

    private Date regDtm;

    private String picturePro;

    private Integer readCount;

    private String categoryCd;

    public Integer getPictureCd() {
        return pictureCd;
    }

    public void setPictureCd(Integer pictureCd) {
        this.pictureCd = pictureCd;
    }

    public String getPictureNm() {
        return pictureNm;
    }

    public void setPictureNm(String pictureNm) {
        this.pictureNm = pictureNm;
    }

    public Integer getPicturePrice() {
        return picturePrice;
    }

    public void setPicturePrice(Integer picturePrice) {
        this.picturePrice = picturePrice;
    }

    public Date getRegDtm() {
        return regDtm;
    }

    public void setRegDtm(Date regDtm) {
        this.regDtm = regDtm;
    }

    public String getPicturePro() {
        return picturePro;
    }

    public void setPicturePro(String picturePro) {
        this.picturePro = picturePro;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    public String getCategoryCd() {
        return categoryCd;
    }

    public void setCategoryCd(String categoryCd) {
        this.categoryCd = categoryCd;
    }
}