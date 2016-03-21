<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Calendar</title>
  <link rel="stylesheet" href="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.css"/>" type="text/css"/>
  <script src="<c:url value="/webjars/jquery/2.2.1/jquery.min.js"/>"></script>
  <script src="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.mtz.monthpicker.js"/>"></script>
  <script src="<c:url value="/resources/js/calendar.js"/>"></script>

<script>
$(function(){
	initDatePickers();
});
</script>
</head>
<body>
<form id="searchForm" name="searchForm">
<h2>Date Picker : yyyy-MM-dd</h2>
<input type="text" id="schDate" name="schDate" value="2016-03-21">
<h2>Month Picker : yyyy-MM</h2>
<input type="text" id="schMonth" name="schMonth" value="2016-03">
<h2>Year Selector : yyyy</h2>
<select id="schYear" name="schYear" pathValue="2016"></select>
</form>
</body>
</html>

