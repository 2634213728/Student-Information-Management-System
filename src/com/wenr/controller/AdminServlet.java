package com.wenr.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wenr.dao.CourseDao;
import com.wenr.dao.GradeDao;
import com.wenr.dao.StudentDao;
import com.wenr.model.Course;
import com.wenr.model.Grade;
import com.wenr.model.Student;

public class AdminServlet extends HttpServlet {
	/**
		 * Constructor of the object.对象的构造函数
		 */
	public AdminServlet() {
		super();
	}

	/**
		 * Destruction of the servlet.servlet的销毁。
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");//捕捉动作
		String path = request.getContextPath();		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		CourseDao courseDao = new CourseDao();

		/*________________分割线________________*/

		if ("delete".equals(action)) {
			// 删除课程
			courseDao.deleteCourseById(Integer.parseInt(request.getParameter("cid")));
	  		response.sendRedirect("../adminSearchCourse.jsp");

		} else if ("deletestudent".equals(action)) {
			// 删除学生
			StudentDao studentDao =new StudentDao();
			studentDao.deleteStudentById(Integer.parseInt(request.getParameter("sid")));
			response.sendRedirect("../adminSearchStudent.jsp");

		}
		else if ("update".equals(action)) {
			// 更新课程
			Course course = new Course();
			course.setCid(Integer.parseInt(request.getParameter("cid")));
			course.setCname(request.getParameter("cname"));
			course.setCredit(Integer.parseInt(request.getParameter("credit")));
			courseDao.updateCourse(course);
	  		response.sendRedirect("../adminSearchCourse.jsp");
		}
		else if ("updateStudent".equals(action)) {
			// 更新学生
			Student student = new Student();
			StudentDao studentDao=new StudentDao();
			student.setSid(Integer.parseInt(request.getParameter("sid")));
			student.setSname(request.getParameter("sname"));
			student.setSex(request.getParameter("ssex"));
			student.setBri(request.getParameter("sbri"));
			studentDao.updateStudent(student);
			response.sendRedirect("../adminSearchStudent.jsp");
		}else if ("Search".equals(action)) {
			//搜索
			if("sid".equals(request.getParameter("cradit"))){
				Student student = new Student();
				student.setSid(Integer.parseInt(request.getParameter("note")));
				//response.sendRedirect("../teacherMain.jsp");
			}
			else{
				Student student = new Student();
				student.setSname(request.getParameter("note"));
				//response.sendRedirect("../teacherMain.jsp");
			}
		}
		else if ("addStudent".equals(action)) {
			//增加学生
			Student student = new Student();
			StudentDao studentDao = new StudentDao();
			//在容器中添加数据
			student.setSname(request.getParameter("sname"));
			student.setSpwd(request.getParameter("spwp"));
			student.setSex(request.getParameter("ssex"));
			student.setBri(request.getParameter("sbri"));
			studentDao.addStudent(student);
			response.sendRedirect("../adminAddStudent.jsp");
		}

		else if ("addGrade".equals(action)) {
			//增加课程
			Grade grade = new Grade();
			GradeDao gradeDao = new GradeDao();
			//在容器中添加数据
			grade.setSid(Integer.parseInt(request.getParameter("sid")));
			grade.setCla(request.getParameter("credit"));
			grade.setGrade(Integer.parseInt(request.getParameter("sgrade")));
			gradeDao.addGrade(grade);
			response.sendRedirect("../adminAddGrade.jsp");

		} else if ("addCourse".equals(action)) {
			//增加课程
			Course course = new Course();
			course.setCredit(Integer.parseInt(request.getParameter("credit")));
		  	course.setCname(request.getParameter("cname"));
			courseDao.addCourse(course);
			response.sendRedirect("../adminAddCourse.jsp");
		} 
	}
	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
