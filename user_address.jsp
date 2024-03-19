<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Add Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
		<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-success p-1">Add Address</h4>
						<form action="" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputAddress">Address</label> <input type="text"
										class="form-control" id="inputAddress" value="">
								</div>
								
								<div class="form-group col-md-6">
									<label for="inputLandMark">Landmark</label> <input type="text"
										class="form-control" id="inputLadMark" value="">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" value="">
								</div>
								
								<div class="form-group col-md-4">
									<label for="inputState">State</label> <input type="text"
										class="form-control" id="inputState" value="">
								</div>
								
								<div class="form-group col-md-4">
									<label for="inputPin">Pin</label> <input
										type="number" class="form-control" id="inputPhNo">
								</div>
							</div>
							
							<div class="text-center">
							<button class="btn btn-warning text-white">Add Address</button>
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