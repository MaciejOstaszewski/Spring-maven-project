<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Marek
  Date: 2017-10-18
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../shared/header.jsp"/>
<html>
<title>
    Odmowa dostępu
</title>
<body>
<div id="main" class="container">

    <div>
        <h1>403 - Odmowa dostępu</h1>
        <div>Witaj '<security:authentication property="principal.username"/>',
            nie masz odpowiednich praw dostępu do żądanej strony.
        </div>
    </div>

</div>
</body>
</html>
<jsp:include page="../shared/footer.jsp"></jsp:include>
