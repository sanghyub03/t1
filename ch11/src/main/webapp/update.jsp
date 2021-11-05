<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="ch11.Board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDao bd = BoardDao.getInstance();
	int result  = bd.update(board);
	if (result > 0) {
%>
<script type="text/javascript">
	alert("수정 성공 !!");
	location.href="list.jsp";
</script>
<%  } else if (result == 0){ %>
<script type="text/javascript">
	alert("수정 실패 !!");
	history.go(-1);
</script>
<%  } else {%>
<script type="text/javascript">
	alert("암호가 달라서 수정 못해 !!");
	history.go(-1);
</script>
<%  } %>
</body>
</html> 