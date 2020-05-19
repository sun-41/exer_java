<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 기록</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>
	<form id="submit" method="post"   action="${contextPath}/commute/addCommute.do">
	<h1  class="text_center">출퇴근 기록</h1>
	<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" value="${member.id }" name="id" ></td>
	   </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" value="${member.name }" name="name" ></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">직책</td>
	       <td width="400"><p><input type="text" value="${member.job }" name="job" ></td>
	    </tr>
	</table>
	</form>
	<script type="text/javascript">
		this.document.getElementById("submit").submit();
	</script>
</body>