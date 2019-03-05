<%@ page import="com.epam.lowcost.util.Endpoints" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="navigationPanel.jsp"/>
    <title><spring:message code="lang.planes"/></title>
    <spring:url value="/resources/static/css/main.css" var="main_css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="${main_css}" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3 planeTitle">
            <spring:message code="lang.planes"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 addPlaneBtn">

            <a href="<%=Endpoints.PLANE + Endpoints.ADD%>" class="btn btn-outline-primary addPlaneBtn"> <spring:message
                    code="lang.addNewPlane"/></a>

        </div>
    </div>

    <h5>${message}</h5>
    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <div>

                <spring:message code="lang.showUsersBy"/>
                <a href="?size=1&searchTerm=${searchTerm}&searchString=${searchString}">1</a> |
                <a href="?size=5&searchTerm=${searchTerm}&searchString=${searchString}"> 5</a>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col"><spring:message code="lang.model"/></th>
                    <th scope="col"><spring:message code="lang.numBusiness"/></th>
                    <th scope="col"><spring:message code="lang.numEconom"/></th>
                    <th scope="col">

                    </th>
                </tr>

                </thead>
                <tbody>
                <c:forEach items="${planes.getContent()}" var="plane">
                    <tr>

                        <td><c:out value="${plane.model}"/></td>
                        <td><c:out value="${plane.businessPlacesNumber}"/></td>
                        <td><c:out value="${plane.economPlacesNumber}"/></td>


                        <td>
                            <a href="<%=Endpoints.PLANE%>/${plane.id}" class="btn btn-outline-primary updatePlaneBtn">
                                <spring:message
                                        code="lang.update"/></a>

                            <form action="<%=Endpoints.PLANE + Endpoints.DELETE%>" method="post">
                                <input type="hidden" name="planeId" value="${plane.id}"/>
                                <input type="submit" value="<spring:message code="lang.delete"/>"
                                       class="btn btn-outline-danger deletePlaneBtn"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
            <div>
                <c:if test="${planes.hasPrevious()}"> <a
                        href="?page=${planes.number-1}&size=${planes.size}"><spring:message
                        code="lang.previous"/></a></c:if>
                <c:forEach var="page" begin="1" end="${planes.totalPages}">
                    <a href="?page=${page-1}&size=${planes.size}">${page}</a>
                </c:forEach>
                <c:if test="${planes.hasNext()}"> <a href="?page=${planes.number+1}&size=${planes.size}"><spring:message
                        code="lang.next"/></a></c:if>
            </div>

        </div>
    </div>
    <br/>

</div>

</body>
</html>
