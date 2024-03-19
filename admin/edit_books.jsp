<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						<hr>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>
						
						<form action="../edit_books" method="post">

							<input type="hidden" name="id" value="<%=b.getBookId()%>"> 
							
							<div class="form-group">
								<label for="exampleInputBookName">Book Name</label> <input
									type="text" class="form-control" id="exampleInputBookName"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="bname" value="<%=b.getBookName()%>" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputAuthor">Author Name</label> <input
									type="text" class="form-control" id="exampleInputAuthor"
									placeholder="Enter Author Name" name="author"
									 required="required" value="<%=b.getAuthor()%>" >
							</div>

							<div class="form-group">
								<label for="exampleInputPrice">Price</label> <input
									type="number" class="form-control" id="exampleInputPrice"
									placeholder="Enter Price" name="price" value="<%=b.getPrice()%>"
									required="required">
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									class="form-control" id="inputState" name="bstatus">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>


								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>