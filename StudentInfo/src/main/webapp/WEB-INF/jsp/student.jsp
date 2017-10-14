<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../../favicon.ico"> -->

    <title>Student | Home </title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/offcanvas.css" rel="stylesheet"> 

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Student Info</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/student/index">Home</a></li>
            <li><a href="/student/new">Add New Student</a></li>
            <li><a href="/student/list">List Of Student</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
    
 <div class="container">
 
 	<c:choose>
 		<c:when test="${mode == 'MODE_HOME'}">
 			<div class="row row-offcanvas row-offcanvas-right">
		        <div class="col-xs-12 col-sm-9">
		          <p class="pull-right visible-xs">
		            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
		          </p>
		          <div class="jumbotron">
		            <h1>Hello, world!</h1>
		            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>  
		          </div>
		        </div><!--/.col-xs-12.col-sm-9-->
		
		        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
		          <div class="list-group">
		            <a href="#" class="list-group-item active">Link</a>
		            <a href="#" class="list-group-item">Link</a>
		            <a href="#" class="list-group-item">Link</a>
		            <a href="#" class="list-group-item">Link</a>
		            <a href="#" class="list-group-item">Link</a>
		            <a href="#" class="list-group-item">Link</a>
		          </div>
		        </div><!--/.sidebar-offcanvas-->
		      </div><!--/row-->
 		</c:when>
 		<c:when test="${mode == 'MODE_LIST'}">
 			 <div class="container text-center" id="tasksDiv">
				<h3>Student Info</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Branch</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="student" items="${students}">
								<tr>
									<td>${student.studentId}</td>
									<td>${student.studentName}</td>
									<td>${student.branch}</td>
									<td><fmt:formatDate type = "date" value = "${student.date}" /></td>
									<td>${student.finished}</td>
									<td><a href="/student/update/${student.studentId}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="/student/delete/${student.studentId}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
 		</c:when>
 		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
 			<div class="container">
 				
 				<h3>Student Form</h3>
				<hr>
				
				<form class="form-horizontal" method="POST" action="/student/save">
 				
	 				<input class="form-control" type="hidden" name="studentId" value="${student.studentId}" id="studentId" />
	 				
			  		<div class="form-group row">
					  <label for="example-text-input" class="col-2 col-form-label">Name</label>
					  <div class="col-10">
					    <input class="form-control" type="text" name="studentName" value="${student.studentName}" id="studentName" />
					  </div>
					</div>
	
					<div class="form-group row">
					  <label for="example-email-input" class="col-2 col-form-label">Branch</label>
					  <div class="col-10">
					    <input class="form-control" type="text" name="branch" value="${student.branch}" id="branch" />
					  </div>
					</div>
					
					<div class="form-group row">
					  <label for="example-date-input" class="col-2 col-form-label">Date</label>
					  <div class="col-10">
					    <input class="form-control date" name="date" type="text" value="${student.date}" id="datepicker">
					  </div>
					</div>
										                    
	                <div class="form-group row">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input class="col-sm-1" type="radio" name="finished" value="true" />
							<div class="col-sm-1">Yes</div>
							<input class="col-sm-1" type="radio" name="finished" value="false" checked />
							<div class="col-sm-1">No</div>
						</div>				
					</div>	
						
					<div class="form-group row">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
					
				</form>
			</div>
 		</c:when>
 	</c:choose>

			
<footer class="footer">
      <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
      </div>
</footer>
      
 </div><!--/.container-->
     






    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.1.1.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
    	<script>
		
            jQuery(document).ready(function() {
                // Date Picker
                $('#datepicker').datepicker();    	
            });
   </script>
    
  </body>
</html>
