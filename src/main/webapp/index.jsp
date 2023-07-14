
<%@page import="java.util.List"%>
<%@page import="com.entity.Student"%>
<%@page import="com.dao.StudentDAO"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_css_js.jsp" %>
    </head>
    <body class="bg-light">

        <%@include file="navbar.jsp" %>

        <div class="container p-5">
            <div class="card">
                <div class="card-body">

                    <p class="text-center fs-1">All Students Details</p>

                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" />
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-success">${errorMsg}</p>
                        <c:remove var="errorMsg" />
                    </c:if>



                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Address</th>
                                <th scope="col">Qualification</th>
                                <th scope="col">Email</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                StudentDAO dao = new StudentDAO(DBConnect.getConn());
                                List<Student> list = dao.getAllStudent();

                                for (Student s : list) {
                            %>
                            <tr>
                                <th scope="row"><%= s.getId()%></th>
                                <td><%= s.getName()%></td>
                                <td><%=s.getDob()%></td>
                                <td><%=s.getAddress()%></td>
                                <td><%=s.getQualification()%></td>
                                <td><%=s.getEmail()%></td>
                                <td>
                                    <a href="edit_student.jsp?id=<%=s.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="delete?id=<%=s.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>

                            <%}
                            %>

                        </tbody>
                    </table>

                </div>
            </div>

        </div>

    </body>
</html>
