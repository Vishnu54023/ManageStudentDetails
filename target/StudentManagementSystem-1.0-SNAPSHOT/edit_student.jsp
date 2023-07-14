

<%@page import="com.entity.Student"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_css_js.jsp" %>
    </head>
    <body class="bg-light">
        <%@include file="navbar.jsp" %>

        <div class="container p-4" >
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Edit Student</p>
                            
                            <% 
                            int id=Integer.parseInt(request.getParameter("id"));
                            StudentDAO dao=new StudentDAO(DBConnect.getConn());
                            Student s=dao.getStudentById(id);
                            %>
                            
                            <form action="update" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input type="text" value="<%=s.getName() %>" class="form-control" name="name" id="name" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="dob" class="form-label">Date of Birth</label>
                                    <input type="date" value="<%=s.getDob() %>" class="form-control" name="dob" id="dob"  aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" value="<%=s.getAddress() %>" class="form-control" name="address" id="address" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="qualification" class="form-label">Qualification</label>
                                    <input type="text" value="<%=s.getQualification() %>" class="form-control" name="qualification" id="qualification" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" value="<%=s.getEmail() %>" class="form-control" name="email" id="email" aria-describedby="emailHelp">
                                </div>

                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                </div>
                                
                                <input type="hidden" name="id" value="<%=s.getId() %>" />
                                
                                
                                
                                <button type="submit" class="btn btn-primary col-md-12">Update</button>
                            </form>



                        </div>

                    </div>

                </div>

            </div> 

        </div>


    </body>
</html>
