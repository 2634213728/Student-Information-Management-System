package com.wenr.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.wenr.model.*;
import com.wenr.model.Student;
import com.wenr.util.DBUtil;
public class function {
    public ArrayList<Student> SearchID(Student student1) {
        ArrayList<Student> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select Student.sid,Student.spwd,Student.sname,Student.ssex,Student.sbri,Grade.sclass,Grade.sgrade from Student LEFT OUTER JOIN Grade on Student.sid = Grade.sid where Student.sid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student1.getSid());
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                Student student = new Student();
                student.setSid(rs.getInt(1));
                student.setSpwd(rs.getString(2));
                student.setSname(rs.getString(3));
                student.setSex(rs.getString(4));
                student.setBri(rs.getString(5));
                student.setCla(rs.getString(6));
                student.setGrade(rs.getInt(7));
                list.add(student);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    public Map<String ,Object> findInfo(Student student1) {
        Map<String, Object> map = new HashMap<>();
        List<String> clist1 = new ArrayList<String>();
        List<Integer> clist2 = new ArrayList<Integer>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select Student.sid,Student.spwd,Student.sname,Student.ssex,Student.sbri,Grade.sclass,Grade.sgrade from Student LEFT OUTER JOIN Grade on Student.sid = Grade.sid where Student.sid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student1.getSid());
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                clist1.add(rs.getString(6));
                clist2.add(rs.getInt(7));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return map;
    }

}



