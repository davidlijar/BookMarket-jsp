<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>
 <%@ page import = "java.util.ArrayList" %>
 <%@ page import = "dto.Book" %>
 <%@ page import = "dao.BookRepository" %>
 <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
-->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>도서 목록</title>
</head>
<body>
<div class="container py-4">
<div>
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서목록</h1>
			<p class="col-md-8 fs-4">BookList</p>
		</div>
	</div>
	
	<%@include file="dbconn.jsp" %>
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
			
	%>
	
	
	<div class="row align-items-md-stretch text-center">
		
		<div class="col-md-4">
			<div class="h-100 p-2">
				<img src="./resources/images/<%=rs.getString("b_filename) %>" style="width:250; height:350" >
				<h5><b><%= book.getName() %></b></h5>
				<p><%=book.getAuthor() %></p>
				<br><%=book.getPublisher() %> | 35<%= book.getUnitPrice() %>원
				<p>37<%=book.getDescription().substring(0,20) %>...</p>
				<p><%=book.getUnitPrice() %>원
				
				<p><a href="./book.jsp?id=<%=book.getBookId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
		</div>
		
		<%
		}
		%>
	
	</div>
	
	<%@ include file="footer.jsp" %>

</div>

</div>
</body>
</html>