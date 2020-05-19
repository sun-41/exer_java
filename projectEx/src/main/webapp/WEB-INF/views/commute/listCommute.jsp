<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>출퇴근 정보 출력창</title>
</head>
<body>
<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td><b>아이디</b></td>
      <td><b>이름</b></td>
      <td><b>직책</b></td>
      <td><b>출근기록</b></td>
      <td><b>퇴근기록</b></td>
      <td><b>삭제</b></td>
   </tr>
<c:choose>
 <c:when test="${commutesList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
   <c:when test="${commutesList !=null }" >
 <c:forEach var="commute" items="${commutesList}" >     
   <tr align="center" overflow="auto">
   	  <td>${commute.id}</td>
      <td>${commute.name}</td>
      <td>${commute.job}</td>
      <td>${commute.attendance}</td>

      <td>${commute.workweek}</td>
      <td><a href="${contextPath}/commute/removeCommute.do?id=${commute.id }">삭제하기</a></td>
    </tr>
  </c:forEach>   
 </c:when>
</c:choose>
</table>
</body>
</html>
