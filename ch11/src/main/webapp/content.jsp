<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bd = BoardDao.getInstance();
	bd.readcountUpdate(num);   // 조회수 증가
	Board board = bd.select(num);
	pageContext.setAttribute("board", board);
%>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {  // jquey문법으로 처음 화면이 띄면 바로 작동
		$('#disp').load('list.jsp?pageNum<%=pageNum%>');
	});
</script></head><body>
<table><caption>게시글 상세조회</caption>
	<tr><th width="100">제목</th><td>${board.subject }</td></tr>
	<tr><th>조회수</th><td>${board.readcount }</td></tr>
	<tr><th>작성자</th><td>${board.writer }</td></tr>
	<tr><th>작성일</th><td>${board.reg_date}</td></tr>
	<tr><th>내용</th><td><pre>${board.content}</pre></td></tr>
</table>
<div align="center">
	<button onclick="location.href='updateForm.jsp?num=${board.num}&pageNum=<%=pageNum%>'">수정</button>
	<button onclick="location.href='deleteForm.jsp?num=${board.num}&pageNum=<%=pageNum%>'">삭제</button>
	<button onclick="location.href='writeForm.jsp?num=${board.num}&pageNum=<%=pageNum%>'">답변</button>
	<button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">목록</button>
</div>
<div id="disp"></div>
</body>
</html>