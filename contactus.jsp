<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Contact Us</title>
<%@include file="all_component/allCss.jsp"%>
<style>
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${not empty succMsg }">
		<div id="toast">${succMsg}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
       </script>
       <c:remove var="succMsg" scope="session" />
       </c:if>
       
       <c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	 </c:if>

		<%@include file="all_component/navbar.jsp"%>

		<div class="container">
			<div class="row">
				<div class="col-md-6 p-3">
					<h3>Contact Us</h3><hr>
					<br>
					<h5>The E-Book Management System is designed to facilitate the
						online buying and selling of books. It streamlines the process of
						managing e-books, making it efficient and user-friendly.</h5>
					<hr><br><br>
					<div>

						<h4 class="text-primary">Head Office:</h4>
						<h4 class="text-success">E-Book Publication</h4>
						<h6>1234 Book Street,</h6>
						<h6>Satara, Maharashtra</h6>
						<h6>India - 415010</h6>
						<p>
							<i class="fa-solid fa-tty"></i>: 
							<span class="text-danger">+91-11-40712200</span>
						</p>
						<p>
							<i class="fa-solid fa-envelope"></i> :
							<span class="text-danger">support@ebookmanagementsystem.com</span>
						</p><hr>

					</div>
				</div>


				<div class="col-md-6 p-3">
					<div class="card">
						<div class="card-body">

							<form action="contact" method="post">
								<div class="form-group">
									<label for="exampleInputName1">First Name</label> <input
										type="text" class="form-control" id="exampleInputName1"
										placeholder="Enter First Name" name="fname"
										required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputName2">Last Name</label> <input
										type="text" class="form-control" id="exampleInputName2"
										placeholder="Enter Last Name" name="lname" required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email </label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter Email"
										name="email" required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputPhNo1">Phone No</label> <input
										type="number" class="form-control" id="exampleInputPhNo1"
										placeholder="Enter Phone No" pattern="[0-9]{10}"
										maxlength="10" size="10s" name="phno" required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Tell us More</label>
									<textarea class="form-control" id="exampleInputPassword1"
										placeholder="Write Something" rows="5" cols="20" name="msg"
										required="required"></textarea>
								</div>


								<div class="text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
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