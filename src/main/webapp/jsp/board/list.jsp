<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="kr.ac.kopo.util.ConnectionFactory" %>
<%--
	작업순서
	1. t_board 테이블에서 전체게시글 조회
	2. 조회된 게시물을 하나씩 웹 브라우저에 출력
 --%>

<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from t_board ");
	sql.append(" order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString()); 
	
	ResultSet rs = pstmt.executeQuery();
%>
<%--
	rs.next 값 false 일 때까지
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			location.href = 'writeForm.jsp'
		})
	})
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체 게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
		<%
			while(rs.next()) {
				int no 			= rs.getInt("no");
				String title 	= rs.getString("title");
				String writer 	= rs.getString("writer");
				String regDate 	= rs.getString("reg_date");
		%>
			<tr>
				<td><%= no %></td>
				<td><%= title %></td>
				<td><%= writer %></td>
				<td><%= regDate %></td>
			</tr>
		<%
			}
		%>
		</table>
		<br>
		<button id="addBtn">새글등록</button>
	</div>
</body>
</html>

<%
	JDBCClose.close(pstmt, conn);
%>
