<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>

<body>

<div id="footer">

    <div class="container">



        <footer>
            © 2017 Platformy programowania
            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.username"/>
                <sec:authentication property="principal.authorities"/>
            </sec:authorize>
        </footer>


    </div>

</div>
</body>
</html>
