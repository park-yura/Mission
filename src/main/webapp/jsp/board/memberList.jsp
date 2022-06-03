<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select id, name, password, email_id, email_domain, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from T_MEMBER ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString()); 
	
	ResultSet rs = pstmt.executeQuery();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
	})
</script>
</head>
<body>
	<div align="center">
			<hr>
			<h2>전체 회원 조회</h2>
			<hr>
			<br>
			<table border="1" style="width:80%">
				<tr>
					<th width="10%">아이디</th>
					<th width="10%">이름</th>
					<th width="10%">비밀번호</th>
					<th width="10%">이메일</th>
					<th width="10%">전화번호</th>
					<th width="10%">우편번호</th>
					<th width="10%">주소</th>
					<th width="10%">타입</th>
					<th width="10%">가입날짜</th>
				</tr>
				<%
			while(rs.next()) {
				String id 		= rs.getString("id");
				String name 	= rs.getString("name");
				String password = rs.getString("password");
				String email_id = rs.getString("email_id");
				String email_domain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basic_addr = rs.getString("BASIC_ADDR");
				String detail_addr = rs.getString("DETAIL_ADDR");
				String type = rs.getString("TYPE");
				String regDate 	= rs.getString("reg_date");
		%>
			<tr>
				
				<td><%= id %></td>
				<td><%= name %></td>
				<td><%= password %></td>
				<td><%= email_id %>@<%= email_domain %></td>
				<td><%= tel1  %>-<%= tel2  %>-<%= tel3  %></td>
				<td><%= post %></td>
				<td><%= basic_addr %> <%= detail_addr %></td>
				<td><%= type %></td>
				<td><%= regDate %></td>
			</tr>
		<%
			}
		%>
			</table>
	</div>
</body>
</html>