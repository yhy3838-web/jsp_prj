<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Calendar cal = Calendar.getInstance();

int year = request.getParameter("year") == null ?
cal.get(Calendar.YEAR) :
Integer.parseInt(request.getParameter("year"));

int month = request.getParameter("month") == null ?
cal.get(Calendar.MONTH) :
Integer.parseInt(request.getParameter("month"));

cal.set(year, month, 1);

int startDay = cal.get(Calendar.DAY_OF_WEEK);
int lastDay = cal.getActualMaximum(Calendar.DATE);

int prevYear = year;
int prevMonth = month - 1;

if(prevMonth < 0){
prevMonth = 11;
prevYear--;
}

int nextYear = year;
int nextMonth = month + 1;

if(nextMonth > 11){
nextMonth = 0;
nextYear++;
}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<link rel="shortcut icon" href="http://192.168.10.71/jsp_prj/common/images/favicon.ico"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">

#calwrap{
    width:1000px;
    margin:20px auto;
}

#title{
    text-align:center;
    margin-bottom:20px;
}

table{
    text-align:center;
}

th, td{
    width:120px;
    height:80px;
    vertical-align:middle;
}

.sun{
    color:red;
}

.sat{
    color:blue;
}

</style>

</head>
<body>

<div id="calwrap">

```
<h2 id="title">

    <a href="calendar.jsp?year=<%=prevYear%>&month=<%=prevMonth%>">
        ◀
    </a>

    &nbsp;
    <%=year%>년 <%=month+1%>월
    &nbsp;

    <a href="calendar.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">
        ▶
    </a>

</h2>

<table class="table table-bordered">

    <tr>
        <th class="sun">일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th class="sat">토</th>
    </tr>

    <tr>

    <%
    for(int i=1;i<startDay;i++){
    %>
        <td>&nbsp;</td>
    <%
    }

    for(int day=1; day<=lastDay; day++){

        int week = (startDay + day - 2) % 7;

        if(day != 1 && week == 0){
    %>
            </tr>
            <tr>
    <%
        }

        String css = "";

        if(week == 0){
            css = "sun";
        }else if(week == 6){
            css = "sat";
        }
    %>

        <td class="<%=css%>">
            <%=day%>
        </td>

    <%
    }

    int remain = (startDay + lastDay - 1) % 7;

    if(remain != 0){
        for(int i=remain;i<7;i++){
    %>
            <td>&nbsp;</td>
    <%
        }
    }
    %>

    </tr>

</table>
```

</div>

</body>
</html>
