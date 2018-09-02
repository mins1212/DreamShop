package com.portfolio.dreamshop.vo;

import java.util.Date;

public class Board {
    private Integer boardCd;

    private String userId;

    private Date regDtm;

    private Integer readCount;

    private Integer goodCount;

    private String boardPicture;

    private String content;

    public Integer getBoardCd() {
        return boardCd;
    }

    public void setBoardCd(Integer boardCd) {
        this.boardCd = boardCd;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getRegDtm() {
        return regDtm;
    }

    public void setRegDtm(Date regDtm) {
        this.regDtm = regDtm;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    public Integer getGoodCount() {
        return goodCount;
    }

    public void setGoodCount(Integer goodCount) {
        this.goodCount = goodCount;
    }

    public String getBoardPicture() {
        return boardPicture;
    }

    public void setBoardPicture(String boardPicture) {
        this.boardPicture = boardPicture;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}