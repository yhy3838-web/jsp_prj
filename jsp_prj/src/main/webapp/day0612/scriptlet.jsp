<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Calendar cal = Calendar.getInstance();

int currentYear = cal.get(Calendar.YEAR);
int currentMonth = cal.get(Calendar.MONTH) + 1;
int currentDay = cal.get(Calendar.DATE);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력 선택</title>
</head>
<body>

<form>

연도 :
<select name="year">
<%
for(int year = currentYear - 5; year <= currentYear + 5; year++){
%>
<option value="<%=year%>"
    <%= year == currentYear ? "selected='selected'" : "" %>>
    <%=year%>
</option>
<%
}
%>
</select>

월 :
<select name="month">
<%
for(int month = 1; month <= 12; month++){
%>
<option value="<%=month%>"
    <%= month == currentMonth ? "selected='selected'" : "" %>>
    <%=month%>월
</option>
<%
}
%>
</select>

일 :
<select name="day">
<%
for(int day = 1; day <= 31; day++){
%>
<option value="<%=day%>"
    <%= day == currentDay ? "selected='selected'" : "" %>>
    <%=day%>일
</option>
<%
}
%>
</select>
<%
for(int i = 1; i <= 10; i++){
%>
<div class="form-check form-check-inline">
    <input type="radio" name="score" value="<%=i%>"
    <%= i == 5 ? "checked='checked'" : "" %>>
    <label class="form-check-label"><%=i%>점</label>
</div>
<%
}
%>

</form>

</body>
</html>