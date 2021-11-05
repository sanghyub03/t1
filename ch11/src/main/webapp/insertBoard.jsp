<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch11.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String ip = request.getRemoteAddr();
	BoardDao bd = BoardDao.getInstance();
	for(int i=0; i < 230; i++) {
		Board board = new Board();
		board.setSubject("초겨울 날씨 "+i);
		board.setWriter("로제"+i);
		board.setPassword("1");
		board.setContent("금요일 쭈아 "+i);
		board.setIp(ip);
		bd.insert(board);
	}
%>
입력 완료
</body>
</html>