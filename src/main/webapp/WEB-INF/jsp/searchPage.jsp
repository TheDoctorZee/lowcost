<%@ page import="com.epam.lowcost.util.Endpoints" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Anastasia
  Date: 14.02.2019
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="navigationPanel.jsp"/>
    <title><spring:message code="lang.findFlight"/></title>
    <spring:url value="/resources/static/css/main.css" var="main_css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="${main_css}" rel="stylesheet">


</head>
<body>
<div class="container">
    <form:form action="<%=Endpoints.FLIGHTS + Endpoints.SEARCH%>" modelAttribute="flight" method="get">
    <br/>
    <p style="color: #D35D47"><form:errors path="departureDate" /></p>
    <p style="color: #D35D47"> <form:errors path="arrivalDate" /></p>
    <p style="color: #D35D47"> <form:errors path="departureAirport"/></p>
    <p style="color: #D35D47"><form:errors path="arrivalAirport"/></p>
    <div class="row BlockBachground">
        <div class="col-md-8">

            <p class="labelSeatchFlight"><spring:message code="lang.findFlight"/></p>


            <div class="leftBlockSerch">
                <spring:bind path="departureDate">
                    <label for="inpSerc"><spring:message code="lang.departureDateFrom"/>:</label>
                    <form:input type="datetime-local" id="inpSerc" path="departureDate" class="form-control searchInput"/> <br/>

                </spring:bind>
                <spring:bind path="arrivalDate">
                    <label for="inpSerc2"><spring:message code="lang.departureDateTo"/>: </label>
                    <form:input type="datetime-local" id="inpSerc2" path="arrivalDate" class="form-control searchInput"/><br/>

                </spring:bind>
            </div>
            <div class="leftBlockSerchRight">
                <spring:bind path="departureAirport">
                    <label for="inpSerc3"><spring:message code="lang.departureAirport"/>: </label>
                    <form:input type="text" id="inpSerc3" list="airport" path="departureAirport" class="form-control searchInput"/>
                    <br/>

                </spring:bind>
                <spring:bind path="arrivalAirport">
                    <label for="inpSerc4"><spring:message code="lang.arrivalAirport"/>: </label>
                    <form:input type="text" id="inpSerc4"  list="airport" path="arrivalAirport" class="form-control searchInput"/> <br/>

                </spring:bind>
            </div>

        </div>
        <div class="col-md-4">
            <button type="submit" value="" class="btn btn-outline-warning btnSeach"><spring:message code="lang.search"/></button>


        </div>
    </div>
</div>

<div class="container mainSerchPage">
    <div class="row">
        <div class="col-md-10">
        </div>
        <div class="col-md-2 numOfUsers">
            <div>
                <spring:message code="lang.showUsersBy"/> <a
                    href="?size=1&searchTerm=${searchTerm}&searchString=${searchString}">1</a> | <a
                    href="?size=5&searchTerm=${searchTerm}&searchString=${searchString}"> 5</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10">

            </form:form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col"><spring:message code="lang.departureAirport"/></th>
                    <th scope="col"><spring:message code="lang.arrivalAirport"/></th>
                    <th scope="col"><spring:message code="lang.departureAt"/></th>
                    <th scope="col"> <spring:message code="lang.arriveAt"/></th>
                    <th scope="col"> <spring:message code="lang.price"/></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${flights.getContent()}" var="flight">
                    <c:if test="${flight.departureDate gt currentTime}">

                        <tr>


                            <td><c:out value="${flight.departureAirport.cityEng} (${flight.departureAirport.code})"/></td>
                            <td><c:out value="${flight.arrivalAirport.cityEng} (${flight.arrivalAirport.code})"/></td>

                            <td><c:out value="${flight.departureDate.toString().replaceAll( 'T', ' ')}"/></td>
                            <td><c:out value="${flight.arrivalDate.toString().replaceAll( 'T', ' ')}"/></td>
                            <td><c:out value="${flight.initialPrice}"/></td>
                            <td>
                                <form action="<%=Endpoints.FLIGHTS+ Endpoints.NEW_TICKET%>/${flight.id}" method="get">
                                    <input type="submit" value="<spring:message code="lang.book" text="Buy"/>"
                                           class="btn btn-outline-primary"/>

                                </form>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
            <div>
                <c:if test="${flights.hasPrevious()}"> <a
                        href="?page=${flights.number-1}&size=${flights.size}"><spring:message
                        code="lang.previous"/></a></c:if>
                <c:forEach var="page" begin="1" end="${flights.totalPages}">
                    <a href="?page=${page-1}&size=${flights.size}">${page}</a>
                </c:forEach>
                <c:if test="${flights.hasNext()}"> <a href="?page=${flights.number+1}&size=${flights.size}"><spring:message
                        code="lang.next"/></a></c:if>
            </div>
        </div>
    </div>

</div>


<datalist id="airport">
    <c:forEach items="${airports}" var="airport">
        <option hidden value="${airport.code}">${airport.cityEng},${airport.countryEng} </option>
    </c:forEach>
</datalist>

</body>
</html>
