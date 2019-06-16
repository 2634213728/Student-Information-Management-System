package com.wenr.model;

public class Student {
    private int sid;		// 学号
    private String spwd;	// 密码
    private String sname;	// 姓名
    private String ssex;	// 性别
    private String sbri;	// 生日
    private String sclass;	// 科目名
    private int sgrade;	// 分数

    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSpwd() {
        return spwd;
    }
    public void setSpwd(String spwd) {
        this.spwd = spwd;
    }

    public String getSname() {
        return sname;
    }
    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSex() {
        return ssex;
    }
    public void setSex(String ssex) {
        this.ssex = ssex;
    }

    public String getBri() {
        return sbri;
    }
    public void setBri (String sbri) { this.sbri = sbri;}

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