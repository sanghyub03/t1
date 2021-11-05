<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="location.href='eco.jsp'">경제</button>
<button onclick="location.href='pol.jsp'">정치</button>
<button onclick="location.href='soi.jsp'">사회</button>
<button onclick="location.href='exclude.jsp'">기타</button>
<hr>
	<deco:body></deco:body>
<hr>
뉴스는 뻥이야
</body>
</html>