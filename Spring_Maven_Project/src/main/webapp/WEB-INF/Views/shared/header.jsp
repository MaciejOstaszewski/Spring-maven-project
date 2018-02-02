<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <link rel="stylesheet" type="text/css"
          href="webjars/bootstrap/3.1.0/css/bootstrap.min.css"/>

    <link rel="stylesheet" type="text/css"
          href="statics/css/main.css"/>

</head>
<body>
<div id="header">
    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Strona główna</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <li class="active"><a href="vehicleForm.html">Dodaj rekord</a></li>
                    <li class="active"><a href="vehicleList.html?all">Lista Pojazdów</a></li>

                    <sec:authorize access="isAnonymous()">
                        <li class="active"><a href="<c:url value="/login" />">Zaloguj się</a></li>
                    </sec:authorize>
                    <li class="active"><a href="<c:url value="/registrationForm.html" />">Rejestracja</a></li>

                    <sec:authorize access="isAuthenticated()">
                        <li class="active"><a onclick="document.getElementById('logout').submit()">Wyloguj się</a></li>
                        <form action="logout" id="logout" method="post" style="display: none;">
                            <sec:csrfInput/>
                        </form>
                    </sec:authorize>


                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
