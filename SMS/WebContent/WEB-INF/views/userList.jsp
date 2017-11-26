
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head><meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<style>
#data {
width: 100% !Important;
}
</style>
 <link href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/buttons.dataTables.min.css"
	rel="stylesheet">
</head>
<body>
	
	<%-- <div style="margin: 20px">
	<p style="color: green;text-align: center;">${message}
	<a class="btn btn-primary btn-lg pull-right" href="${pageContext.request.contextPath}/user/showAddUser.do">Add More User</a></p>
</div> --%>
	
	<c:if test="${!empty userList}">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 style="display:inline-block;">List of user</h3>
						<span style="color: green;text-align: center;display:inline-block;margin-left:25%;">${message}</span>
						<a style="margin-top:10px" class="btn btn-primary btn-lg pull-right" 
						href="${pageContext.request.contextPath}/user/showAddUser.do">Add More User</a></p>
					</div>


					<div class="panel-body">
						<div class="table-responsive">
							<table id="myDatatable"	class="display table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>Login ID</th>
										<th>User Name</th>
										<th>Role</th>
										<th>Email</th>
										<th>DOB</th>
										<th>Department Name</th>
										<th>Text</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userList}" var="user">
										<tr>
											<td><c:out value="${user.loginId}" /></td>
											<td><c:out value="${user.userName}" /></td>
											<td>
											
											
											<c:choose>
											<c:when test="${user.userLevel=='2'}" >
											Checker/Authorizer
											</c:when>
											<c:otherwise>
											Maker / Uploader
											</c:otherwise>
											</c:choose>
											
											</td>
											<td><c:out value="${user.email}" /></td>
											<td><c:out value="${user.dateOfBirth}" /></td>
											<td><c:out value="${user.department.departmentName}" />
											</td>
											<td><c:out value="${user.text}" />
											</td>
											<td><a class="btn btn-primary"
												href="${pageContext.request.contextPath}/user/viewUser/${user.id}.do">View</a>&nbsp;&nbsp;
												<a class="btn btn-primary"
												href="${pageContext.request.contextPath}/user/ShowUpdateUser/${user.id}.do">Edit</a>&nbsp;&nbsp;
												<a class="btn btn-primary"
												href="${pageContext.request.contextPath}/user/deleteUser/${user.id}.do"
												onclick="return confirm('Are you sure?')">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery-1.12.4.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.flash.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jszip.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/pdfmake.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/vfs_fonts.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/dataTables.buttons.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.print.min.js"></script>
 
	<script>
	$(document).ready(function() {
		var oTable = $('#myDatatable').DataTable( { 
			dom: 'Blfrtip',
		        buttons: [
		       {
		           extend: 'pdf',
		           footer: true,
		           title: 'User_List',
		           filename: 'User_List',
		           exportOptions: {
		                columns: [0,1,2,3,4,5]
		            }
		       },
		       {
		           extend: 'excel',
		           footer: true,
		           title: 'User_List',
		           filename: 'User_List',
		           exportOptions: {
		                columns: [0,1,2,3,4,5]
		            }
		       }         
		    ]  
		    } );

		} );

	</script>
</body>