package com.wenr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wenr.model.Course;
import com.wenr.model.Grade;
import com.wenr.model.Student;
import com.wenr.util.DBUtil;
public class GradeDao {
    public boolean isValid(Student student) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            //建立数据库DButil连接~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            String sql = "select * from student where sid=? and spwd=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student.getSid());
            pstmt.setString(2, student.getSpwd());
            rs = pstmt.executeQuery();
            if (rs != null && rs.next()) {
                student.setSname(rs.getString("sname"));
                return true;
            } else {
                return false;
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
        return false;
    }
    public ArrayList<Course> getSelectedCourse(Student student) {
        ArrayList<Course> list = new ArrayList<Course>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select course.cid, cname, credit, score from student, course, optcou where student.sid = optcou.sid and course.cid = optcou.cid and student.sid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student.getSid());
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                Course course = new Course();
                course.setCid(rs.getInt(1));
                course.setCname(rs.getString("cname"));
                course.setCredit(rs.getInt("credit"));
                course.setScore(rs.getDouble("score"));
                list.add(course);
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
    public ArrayList<Student> getAllStudent() {
        ArrayList<Student> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select * from student";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                Student student = new Student();
                student.setSid(rs.getInt(1));
                student.setSpwd(rs.getString(2));
                student.setSname(rs.getString(3));
                student.setSex(rs.getString(4));
                student.setBri(rs.getString(5));
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
    public boolean deleteCourse(Student student, int cid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select score from optcou where sid=? and cid=? and score > 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student.getSid());
            pstmt.setInt(2, cid);
            rs = pstmt.executeQuery();
            if (rs != null && rs.next()) {
                // 存在成绩 不可以删除
                return false;
            } else {
                // 成绩不存在，可以删除
                if (pstmt != null) pstmt.close();
                sql = "delete from optcou where sid=? and cid=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, student.getSid());
                pstmt.setInt(2, cid);
                pstmt.executeUpdate();
                return true;
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
        return false;
    }
    public boolean addCourse(Student student, int cid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select * from optcou where sid=? and cid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, student.getSid());
            pstmt.setInt(2, cid);
            rs = pstmt.executeQuery();
            if (rs != null && rs.next()) {
                // 该同学已经选过该门课 不能重复选择
                return false;
            } else {
                // 没选过 可以选择
                sql = "insert into optcou(sid, cid) values(?, ?)";
                if (pstmt != null) pstmt.close();
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, student.getSid());
                pstmt.setInt(2, cid);
                pstmt.executeUpdate();
                return true;
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

        return false;
    }
    public void addGrade(Grade grade) {

        Connection conn = null;

        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "insert into grade (sid, sclass, sgrade) values(?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, grade.getSid());
            pstmt.setString(2, grade.getCla());
            pstmt.setInt(3, grade.getGrade());
            pstmt.executeUpdate();
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
        }
    }
    public static void main(String[] args) {
        StudentDao dao = new StudentDao();
        Student student = new Student();
        student.setSid(1001);
        student.setSpwd("1001");
        dao.isValid(student);
        System.out.println(student.getSname());
        ArrayList<Course> list = dao.getSelectedCourse(student);
        for (Course course: list) {
            System.out.println(course.getCname() + "," + course.getCredit() + "," + course.getScore());
        }
        dao.deleteCourse(student, 100000003);
    }
}
