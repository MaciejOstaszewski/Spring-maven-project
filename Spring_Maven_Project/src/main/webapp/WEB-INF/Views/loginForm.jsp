<%--
  Created by IntelliJ IDEA.
  User: Marek
  Date: 2017-11-14
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tytuł strony</title>
</head>
<body class="login">

<jsp:include page="shared/header.jsp"></jsp:include>

<div class="well">
<div class="loginForm">
    <c:url value="/login" var="loginUrl"/>
    <form action="${loginUrl}" method="post">
        <%--<c:if test="${param.error != null}">--%>
            <%--<p>--%>
                <%--Invalid username and password.--%>
            <%--</p>--%>
        <%--</c:if>--%>
        <%--<c:if test="${!empty param.logout}">--%>
            <%--<p>--%>
                <%--You have been logged out.--%>
            <%--</p>--%>
        <%--</c:if>--%>
        <%--<p>--%>
            <label for="username">Username</label>
            <input class="form-control" type="text" id="username" name="username"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input class="form-control" type="password" id="password" name="password"/>
        </p>
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <button type="submit" class="btn btn-lg btn-primary btn-block" >Log in</button>
    </form>
</div>

</div>


<jsp:include page="shared/footer.jsp"/>
</body>
</html>

