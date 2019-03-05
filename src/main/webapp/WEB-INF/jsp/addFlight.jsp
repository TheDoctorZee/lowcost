<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.epam.lowcost.util.Endpoints" %><%--
  Created by IntelliJ IDEA.
  User: Anastasia
  Date: 20.02.2019
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="lang.addNewFlight"/></title>

    <spring:url value="/resources/static/css/main.css" var="main_css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="${main_css}" rel="stylesheet">
</head>
<body>
<jsp:include page="navigationPanel.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-4 mainContentAdd">
            <h4><spring:message code="lang.addNewFlight"/><br/></h4>
            <form:form method="post" action="<%=Endpoints.FLIGHTS + Endpoints.ADD%>" modelAttribute="flight">

                <spring:bind path="initialPrice">
                    <div>
                        <spring:message code="lang.price"/><br/>
                        <form:input type="text" class="form-control input" path="initialPrice"/>
                        <form:errors path="initialPrice" cssStyle="color: #dc3545"/>
                    </div>
                </spring:bind>
                <spring:bind path="plane">
                    <div>
                        <spring:message code="lang.plane"/><br/>
                        <form:input list="planes" id="planeList" class="form-control input" path="plane"/>
                        <form:errors path="plane"/>
                    </div>
                </spring:bind>
                <spring:bind path="departureDate">
                    <div>
                        <spring:message code="lang.departureDateFrom"/><br/>
                        <form:input type="datetime-local" path="departureDate" class="form-control input"/>
                        <form:errors path="departureDate" cssStyle="color: #dc3545"/>

                    </div>
                </spring:bind>
                <spring:bind path="arrivalDate">
                    <div>
                        <spring:message code="lang.arriveAt"/><br/>
                        <form:input type="datetime-local" path="arrivalDate" class="form-control input"/>
                        <form:errors path="arrivalDate" cssStyle="color: #dc3545"/>

                    </div>
                </spring:bind>
                <spring:bind path="departureAirport">
                    <div>
                        <spring:message code="lang.departureAirport"/><br/>
                        <form:input type="text" class="form-control input" list="airport" path="departureAirport"/>
                    </div>
                </spring:bind>
                <spring:bind path="arrivalAirport">
                    <div>
                        <spring:message code="lang.arrivalAirport"/><br/>
                        <form:input type="text" path="arrivalAirport" list="airport" class="form-control input"/>
                        <form:errors path="arrivalAirport" cssStyle="color: #dc3545"/>
                    </div>
                </spring:bind>
                <spring:bind path="placePriorityPrice">
                    <div>
                        <spring:message code="lang.placePriorityPrice"/>.<br/>
                        <form:input type="text" class="form-control input" path="placePriorityPrice"/>
                        <form:errors path="placePriorityPrice" cssStyle="color: #dc3545"/>
                    </div>
                </spring:bind>
                <spring:bind path="businessPrice">
                    <div>
                        <spring:message code="lang.businessPrice"/>.<br/>
                        <form:input type="text" class="form-control input" path="businessPrice"/>
                        <form:errors path="businessPrice" cssStyle="color: #dc3545"/>
                    </div>
                </spring:bind>
                <spring:bind path="luggagePrice">
                    <div>
                        <spring:message code="lang.luggagePrice"/>.<br/>
                        <form:input type="text" class="form-control input" path="luggagePrice"/>
                        <form:errors path="luggagePrice" cssStyle="color: #dc3545"/>
                    </div>
                </spring:bind>
                <input type="submit" id="submit" class="btn btn-outline-success addFlightBtn" value="OK"/>
            </form:form>
        </div>
    </div>
</div>
<datalist id="airport">
    <c:forEach items="${airports}" var="airport">
        <option value="${airport.code}">${airport.cityEng},${airport.countryEng} </option>
    </c:forEach>
</datalist>
<datalist id="planes">
    <c:forEach items="${planes}" var="plane">
        <option data-value="${plane.id}" value="${plane.model}"/>
    </c:forEach>
</datalist>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
    $(document).ready(function() {

        $('#submit').click(function()
        {
            var value = $('#planeList').val();
            // alert($('#planes [value="' + value + '"]').data('value'));
            $('#planeList').val($('#planes [value="' + value + '"]').data('value'));

        });
    });
</script>

</body>
</html>
