<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style></head><body>
<%	final int ROW_PER_PAGE = 10;   // 한페이지 당 10개
	final int PAGE_PER_BLOCK = 10; // 한블럭에 10개 page
	String pageNum = request.getParameter("pageNum");
	if (pageNum==null || pageNum.equals("")) pageNum = "1";	
	int currentPage = Integer.parseInt(pageNum);
	// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1				
	int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
	// 끝번호 	시작번호 + 페이지당개수 - 1			
	int endRow = startRow + ROW_PER_PAGE - 1;
	BoardDao bd = BoardDao.getInstance();
	int total = bd.getTotal(); 
	List<Board> list = bd.list(startRow, endRow); 
	// (double) 나눗셈 결과를 실수로 하기 위해서 
	int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지
	// 현재페이지 - (현재페이지 - 1)%10
	int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
	// 시작페이지 + 블록당페이지 수 -1
	int endPage = startPage + PAGE_PER_BLOCK - 1;
	// 총페이지 보다 큰 endPage는 나올 수 없다
	if (endPage > totalPage) endPage = totalPage;
	pageContext.setAttribute("list", list); 
	pageContext.setAttribute("currentPage", currentPage);
%>
<table><caption>게시글 목록</caption>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="5">게시글이 없습니다</th></tr>
</c:if>
<c:if test="${not empty list}">
	<c:forEach var="board" items="${list }">
		<tr><td>${board.num }</td>
		<c:if test="${board.del=='y' }">
			<th colspan="4">삭제된 게시글입니다</th>
		</c:if>
		<c:if test="${board.del != 'y' }">
			<td title="${board.content }">
			<!-- 답변글은 들여쓰기를 해랴 하므로 level이 0보다 크다 -->
				<c:if test="${board.re_level > 0 }">
					<img alt="" src="images/level.gif" height="5" 
						width="${board.re_level*10 }">
					<img alt="" src="images/re.gif">
				</c:if>	
				<a href="content.jsp?num=${board.num}&pageNum=${currentPage}">
					${board.subject }</a>
				<c:if test="${board.readcount > 50 }">
					<img alt="" src="images/hot.gif">
				</c:if></td>
			<td>${board.writer }</td>
			<td>${board.reg_date }</td>
			<td>${board.readcount }</td>
		</c:if>
		</tr>
	</c:forEach>
</c:if>
</table>
<div align="center">
<% 	if (startPage > PAGE_PER_BLOCK) {  %>
	<button  onclick="location.href='list.jsp?pageNum=<%=startPage-1%>'">이전</button>
<%  } %>
<c:forEach var="i" begin="<%=startPage %>" end="<%=endPage %>">
	<c:if test="${currentPage== i }">
		<button onclick="location.href='list.jsp?pageNum=${i}'"
			disabled="disabled">${i}</button>
	</c:if>
	<c:if test="${currentPage!= i }">
		<button onclick="location.href='list.jsp?pageNum=${i}'">${i}</button>
	</c:if>
</c:forEach>
<!-- 보여줄 것이 남아있다 -->
<% 	if (endPage < totalPage) {  %>
	<button  onclick="location.href='list.jsp?pageNum=<%=endPage+1%>'">다음</button>
<%  } %>
</div>
<!-- num=0 처음 쓴글 -->
<br><button onclick="location.href='writeForm.jsp?num=0&pageNum=<%=currentPage%>'">글쓰기</button>
</body>
</html>