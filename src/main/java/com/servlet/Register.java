
package com.servlet;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Register extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
            String name=request.getParameter("name");
            String dob=request.getParameter("dob");
            String address=request.getParameter("address");
            String qualification=request.getParameter("qualification");
            String email=request.getParameter("email");
            
            Student student=new Student(name,dob,address,qualification,email);
            
            
            StudentDAO dao=new StudentDAO(DBConnect.getConn());
            
            HttpSession session=request.getSession();
            
            
            
            boolean f= dao.addStudent(student);
            
            if(f){
//                System.out.println("Student Details Submit Successfully...");
                session.setAttribute("succMsg", "Student Details Submit Successfully...");
                response.sendRedirect("add_student.jsp");
                
            }else{
                session.setAttribute("errorMsg", "Somethings went wrong...");
                response.sendRedirect("add_student.jsp");
//                System.out.println("Somethings went wrong...");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
