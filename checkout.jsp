<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Checkout</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}
			</div>
			<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}
			</div>
			<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">You Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUserId(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bookId=<%=c.getBookId()%>&&userId=<%=c.getUserId()%>&&cartId=<%=c.getCartId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputName">Name</label> <input type="text"
										class="form-control" id="inputName" name="username" value="${userobj.name}" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail">Email</label> <input type="email" name="email" 
										class="form-control" id="inputEmail" value="${userobj.email}" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPhNo">Phone Number</label> <input
										type="number" class="form-control" id="inputPhNo" name="phno" value="${userobj.phno}" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputAddress">Address</label> <input type="text" name="address" 
										class="form-control" id="inputAddress" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputLandMark">Landmark</label> <input type="text" name="landmark" 
										class="form-control" id="inputLadMark" value="" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text" name="city" 
										class="form-control" id="inputCity" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputState">State</label> <input type="text" name="state" 
										class="form-control" id="inputState" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPin">Pin Code</label> <input type="text" name="pincode" 
										class="form-control" id="inputPin" required="required">
								</div>
							</div>

							<div class="from-group">
								<label>Payment Type</label> <select class="form-control" name="payment" >
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center mt-2">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>