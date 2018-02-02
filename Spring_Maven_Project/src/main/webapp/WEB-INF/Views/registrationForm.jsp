<%--
  Created by IntelliJ IDEA.
  User: Marek
  Date: 2017-12-13
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="shared/header.jsp"></jsp:include>
<%--@elvariable id="userCommand" type="Com"--%>
<form:form modelAttribute="userCommand">
<div class="well">
    <div class="loginForm">
    <h2>Proszę, zarejestruj się</h2>
    <div class="form-group">
        <form:errors path="*" cssClass="alert alert-danger" element="div"/>
    </div>

    <div class="form-group">
        <form:input path="username" cssClass="form-control" placeholder="nazwa użytkownika" required="true"
                    autofocus="true" cssErrorClass="form-control is-invalid"/>
    </div>

    <div class="form-group">
        <form:password path="password" cssClass="form-control"
                       placeholder="hasło" required="true" cssErrorClass="form-control is-invalid"/>
    </div>

    <div class="form-group">
        <form:password path="passwordConfirm" cssClass="form-control"
                       cssErrorClass="form-control is-invalid"
                       placeholder="powtórzone hasło" required="true"/>
    </div>

    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Zarejestruj"/>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
        </div>
    </div>
</form:form>
    </div>

</div>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
