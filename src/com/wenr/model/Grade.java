package com.wenr.model;

public class Grade {
    private int sid;		// 学号
    private String sclass;	// 科目名
    private int sgrade;	// 分数

    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getCla() {
        return sclass;
    }
    public void setCla(String sclass) {
        this.sclass = sclass;
    }

    public int getGrade() { return sgrade; }
    public void setGrade(int sgrade) {
        this.sgrade = sgrade;
    }
}
