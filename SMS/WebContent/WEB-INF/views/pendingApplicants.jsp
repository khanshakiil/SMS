<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="${pageContext.request.contextPath}/dist/js/formValidation.js"></script>

<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/buttons.dataTables.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">

</head>
<body>
	<span
		style="color: green; text-align: center; display: inline-block; margin-left: 25%;">${param['message']}</span>

	<c:choose>
		<c:when test="${!empty appInitiated}">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<span
							style="color: green; text-align: center; display: inline-block; margin-left: 25%;">${message}</span>

						<div class="panel-body">
							<div class="table-responsive" style="margin-bottom: 10%;">

								<form method="POST" id="form">
									<input type='hidden' id='action' name='action'>

									<table id="myDatatable1"
										class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th>Sr.No</th>
												<th>Uploader Id</th>
												<th>Branch</th>
												<th>Uploaded Date</th>
												<th>Applicant Id</th>
												<th>Applicant Name</th>
												<th>Applicant NIN</th>
												<th>IBAN</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${appInitiated}" var="app" varStatus="idx">
												<tr>
													<td><c:out value="${idx.index +1}" /></td>
													<td><c:out value="${app.uploaderId}" /></td>
													<td><c:out value="${app.branch}" /></td>
														<td><c:out value="${app.uploadedDate}" /></td>
												<%-- 	<td><fmt:formatDate type="both" dateStyle="medium"
															timeStyle="long" value="${app.uploadedDate}"
															pattern="d MMM y " /></td> --%>
													<td><c:out value="${app.applicantID}" /></td>
													<td><c:out value="${app.applicantName}" /></td>
													<td><c:out value="${app.applicantNIN}" /></td>
													<td><c:out value="${app.iban}" /></td>
													<td><c:out value="${app.status}" /></td>

													<td><a class="btn btn-primary"
														href="${pageContext.request.contextPath}/print/viewPendingApplicant/${app.applicantID}.do">View
															Details</a>&nbsp;&nbsp;
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- <table class="table table-hover text-centered">
										<tr>
											<th class="center">Comments</th>
											<td>
												<input type="textarea"  rows="2" cols="21"  name="comments" id="comments">
												<textarea name="comments" id="comments" class="required"></textarea><br>

												<span id="commenterror" style="color: red;"></span>
											</td>
										</tr>
										<tr>
											<td></td>
											<td><input type="button" value="Reject"
												class="btn-space btn btn-primary" id="reject"
												disabled="disabled" /><input type="button" value="Approve"
												class="btn-space btn btn-primary" id="approve"
												disabled="disabled" /></td>
										</tr>
									</table> -->

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive" style="text-align: center;">
								No Data Found</div>
						</div>
					</div>
				</div>
			</div>

		</c:otherwise>
	</c:choose>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.flash.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jszip.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/vfs_fonts.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.html5.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.print.min.js"></script>

	<script>
		$(document).ready(function() {
			
			//for enable and disable of reject and aprove
			/*  var fileIds = [];
	            $.each($("input[name='fileIds']:checked"), function(){            
	            	fileIds.push($(this).val());
	            }); */
			/* $("input[name=fileIds]").click(function(){
				if(fileIds.length!= 'undefined' || fileIds.length!=null){
		        	   $("#reject").prop('disabled','');
		        	   $("#approve").prop('disabled','');	}
			 }); */
				$("input[name=fileIds]").click(function(){
					var checked = $("input[name='fileIds']:checked").length;
					
					if(checked!= 'undefined' && checked!=null && checked!=0) {
			        	   $("#reject").prop('disabled','');
			        	   $("#approve").prop('disabled','');	
			        	   }
					else{
						 $("#reject").prop('disabled','disabled');
						 $("#approve").prop('disabled','disabled');
					}
				 });
			
			
			var base_url = window.location.origin;	
			base_url = base_url+"<%=request.getContextPath()%>";
							$("#approve")
									.click(
											function() {
												$('#action').val('Approved');
												$('#form')
														.attr(
																'action',
																base_url
																		+ '/upload/approveRejectFile.do');
												$("#form").submit();
											});

							$("#reject")
									.click(
											function() {
												//var id = $(this).attr('id');
												//alert(id);
												//$('#action').val('Rejected');
												if ($('#comments').val() != "") {
													$('#form')
															.attr(
																	'action',
																	base_url
																			+ '/upload/approveRejectFile.do');
													$("#form").submit();
												} else {
													$('#commenterror')
															.html(
																	"Please insert comment");
													//$("#form").submit();
													$("#form").preventDefault();

												}
											});

							//new function for submit

							/* $('form').submit(function(){
								
								alert(form.value);
								$('#action').val('Rejected');
								
								if($('#comments').val()!="")
								{
									$('#form').attr('action', base_url+'/upload/approveRejectFile.do');			
									$("#form").submit();
								}
									   else
										   {
										$('#comments').after.innerHtml="<div>Please insert comment</div>";
										return false;
										
										   }
								
								
								return false;
								
							}); */
	
							var oTable = $('#myDatatable1').DataTable({

								dom : 'Blfrtip',
								buttons : [ {
									extend : 'pdf',
									footer : true,
									title : 'Uploaded_File',
									filename : 'Uploaded_File',
									exportOptions : {
										columns : [ 1, 2, 3, 4, 5, 6 ]
									}
								}, {
									extend : 'excel',
									footer : true,
									title : 'Uploaded_File',
									filename : 'Uploaded_File',
									exportOptions : {
										columns : [ 1, 2, 3, 4, 5, 6 ]
									}
								} ],
								"ordering" : false

							});
							//alert(oTable);

						});

		/* function reject(ev)
		{
		var getButton=ev.id;
		alert(getButton);
		//if()
			
		} */
	</script>


</body>
</html>