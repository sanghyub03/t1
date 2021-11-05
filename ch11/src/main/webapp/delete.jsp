<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	int num = Integer.parseInt(request.getParameter("num"));
	String password = request.getParameter("password");
	BoardDao bd = BoardDao.getInstance();
	int result  = bd.delete(num, password);
	if (result > 0) {
%>
<script type="text/javascript">
	alert("삭제됐네! 대 ~  박");
	location.href="list.jsp";
</script>
<%  } else if (result == 0) { %>
<script type="text/javascript">
	alert("삭제실패! 쪽 ~  박");
	history.go(-1);
</script>
<%  } else { %>
<script type="text/javascript">
	alert("암호가 다르므로 삭제 권한이 없습니다");
	history.go(-1);
</script>
<%  } %>
</body>
</html> 