package com.wenr.controller;
import com.wenr.dao.CourseDao;
import com.wenr.dao.StudentDao;
import com.wenr.model.Course;
import com.wenr.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class StudentServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public StudentServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
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
		doPost(request, response);
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
		
		// ?????????????????   ??????????= =   ?????????????????????
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		String path = request.getContextPath();		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		
		if ("delete".equals(action)) {
			// ??????????????  ????????????????  ??????????
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>信息反馈</TITLE></HEAD>");
			out.println("  <BODY align='center'>");
			StudentDao studentDao = new StudentDao();
			Student student = (Student)session.getAttribute("student");
	    	int cid = Integer.parseInt(request.getParameter("cid"));

	    	if (studentDao.deleteCourse(student, cid)) {
	    		out.println("<h1>退选成功</h1>");
	    	} else {
	    		out.println("<h1>退选失败</h1>");
	    	}
	    	out.println("<a href=\"" + path +  "/studentSelected.jsp\">继续操作</a>");
	    	out.println("  </BODY>");
			out.println("</HTML>"); 
		}
		
		else if ("lookup".equals(action)) {
			String courseName = "";
			if (request.getParameter("course") != null) {
				courseName = request.getParameter("course");
			}
			courseName = courseName.trim();
			ArrayList<Course> list = new ArrayList<>();
			CourseDao dao = new CourseDao();
			if ("".equals(courseName)) {
				list = dao.getAllCourse();
			} else {
				list = dao.getCourseByName(courseName);
			}
			request.setAttribute("courseList", list);
			request.setAttribute("course", courseName);
			request.getRequestDispatcher("../studentSearchCourse.jsp").forward(request, response);
		}
		else if ("select".equals(action)) {
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>反馈界面</TITLE></HEAD>");
			out.println("  <BODY align='center'>");
			int cid = Integer.parseInt(request.getParameter("cid"));
	  		Student student = (Student)session.getAttribute("student");
	  		StudentDao studentDao = new StudentDao();
	  		if (studentDao.addCourse(student, cid)) {
	  			out.println("<h1>选课成功</h1>");
	  		} else {
	  			out.println("<h1>选课失败</h1>");
	  		}
	  		String param = "";
	  		if (request.getParameter("cutpage") != null) param = "&cutpage=" + request.getParameter("cutpage");
	  		out.println("<a href=\"" + path +  "/servlet/StudentServlet?action=lookup" + param + "\">返回选课</a>");
	  		out.println("  </BODY>");
			out.println("</HTML>"); 
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
