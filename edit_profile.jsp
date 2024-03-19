<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Edit Profile</h4>
						<hr>
						
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
							<hr>
						</c:if>
						
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
							<hr>
						</c:if>
						
						<form action="update_profile" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id">
						
							<div class="form-group">
								<label for="exampleInputName1">Name</label> <input type="text"
									class="form-control" id="exampleInputName1" name="fname"
									value="${userobj.name}" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" value="${userobj.email}" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPhNo1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputPhNo1"
									 pattern="[0-9]{10}" maxlength="10" size="10" name="phno" value="${userobj.phno}" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <textarea
									type="password" class="form-control" id="exampleInputPassword1"
									name="password"  pattern="[0-9]{10}" maxlength="10" size="10s" required="required"></textarea>
							</div>
							
							<textarea name="message"  required placeholder="Enter Address"></textarea>


							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
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