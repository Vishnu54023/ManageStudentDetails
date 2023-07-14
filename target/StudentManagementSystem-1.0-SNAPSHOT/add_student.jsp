
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

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
                            <p class="fs-3 text-center">Add Student</p>
                            
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" />
                            </c:if>
                            <c:if test="${not empty errorMsg}">
                                <p class="text-center text-success">${errorMsg}</p>
                                <c:remove var="errorMsg" />
                            </c:if>
                            
                                
                            
                            <form action="register" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Date of Birth</label>
                                    <input type="date" class="form-control" name="dob" id="email" aria-describedby="emailHelp">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" name="address" id="address" aria-describedby="emailHelp">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="qualification" class="form-label">Qualification</label>
                                    <input type="text" class="form-control" name="qualification" id="qualification" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">
                                </div>


                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

                    </div>

                </div>

            </div> 

        </div>


    </body>
</html>
