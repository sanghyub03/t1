<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript">
/* 	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 다르므로 수정 권한이 없습니다");
			frm.password2.focus(); 	frm.password2.value="";
			return false;		}
	} */
</script></head><body>
<%	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao bd = BoardDao.getInstance();
	Board board = bd.select(num);
	pageContext.setAttribute("board", board);
%>
<form action="update.jsp" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num }">
	<!-- DB에서 읽어온 암호 -->
<%-- 	<input type="hidden" name="password" value="${board.password }"> --%>
<table><caption>게시글 수정</caption>
	<tr><th>제목</th><td><input type="text" name="subject" required="required"
		autofocus="autofocus" value="${board.subject }"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="writer" required="required"
		value="${board.writer }"></td></tr>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="content" 
		required="required">${board.content }</textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
</body>
</html>