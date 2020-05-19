<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
	<script>
	function fn_listCommute(isLogOn,listCommute,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=listCommute;
	  }
	  else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/commute/listCommute.do';
	  }
	}
</script>

<body>
	<h1>사이드 메뉴</h1>
	<%-- 
	<h1>
		<a href="${contextPath}/member/listMembers.do"  class="no-underline">회원관리</a><br>
	    <a href="#"  class="no-underline">게시판관리</a><br>
    </h1>
	--%>
	<h1>
		<a href="${contextPath}/member/listMembers.do"  class="no-underline">회원관리</a><br>
		<a href="javascript:fn_listCommute('${isLogOn}','${contextPath}/commute/listCommute.do', 
                                                    '${contextPath}/member/loginForm.do')">출퇴근 관리</a><br>
		<a href="${contextPath}/board/listArticles.do"  class="no-underline">게시판관리</a><br>
	</h1>

</body>
</html>