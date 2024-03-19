<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> Ebooks
			</h3>
		</div>

		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-4">
				<a href="checkout.jsp"><i
					class="fa-solid fa-cart-plus fa-2x"></i></a> <a href="login.jsp"
					class="btn btn-success"> <i class="fa-solid fa-user-tie"></i>
					${userobj.name}
				</a> 
				<!-- <a href="logout" class="btn btn-primary text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a> -->
					
					<a href="logout" data-toggle="modal" data-target="#exampleModal"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-sign-out-alt"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn btn-primary text-white"> <i
					class="fa-solid fa-user-plus"></i> Register
				</a>
			</div>
		</c:if>

	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="all_recent_book.jsp"> <i class="fa-solid fa-book-open"></i>
					Recent Book
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"> <i class="fa-solid fa-book-open"></i>
					New Book
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_book.jsp"><i class="fa-solid fa-book"></i> Old
					Book</a></li>
		</ul>
		
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You Want logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="logout" type="button" class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!--      end     Logout      Modal     -->
		
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a>
			<a href="contactus.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>