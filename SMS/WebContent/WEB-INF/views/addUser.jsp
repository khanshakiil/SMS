
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset=utf-8/>

<link	href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet">    
<script>
$(document).ready(function(){
	
	$("#loginId").on("blur",function(){
		if( $("#loginId").val() != 0 ){
			
			checkLoginId();
	}
		else{
			 $('#result').text("");			 
		}
	});
	/* $("#submit").on("click",function(){
		alert("hi");
		$("#userForm").submit();	
	}); */	
});


function checkLoginId(){
	var base_url = window.location.origin;	
	base_url = base_url+"<%=request.getContextPath()%>";
	var id=$("#id").val();
	 id = ""==id ?0:id; 
		
		$.ajax({
			type : "post",
			url : base_url + "/user/checkLoginId.do",
			cache : false,
			data : 'loginId=' + $("#loginId").val()+'&id='+id,
			success : function(response) {												
					$('#result').text(response);				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				$('#result').text("Error is validation login Id");				
			}
		});

	}
	
function save(){
	return ""==$("#result").text();	
	
}
</script>

</head>


<body>
	<h2>	
	<c:choose>
	<c:when test="${users.id > 0}"> Update User</c:when>
	<c:otherwise>
	Add User</c:otherwise>
	</c:choose>
	</h2>
	<form:form acceptCharset="UTF-8" method="POST" id="userForm" onsubmit="return save();"
		action="${pageContext.request.contextPath}/user/saveUser.do" enctype="multipart/form-data"
		commandName="users">
		<form:hidden path="id" />
		<div class = "table-responsive col-lg-6">
		<table class ="table table-bordered table-striped table-highlight" >
			<tr>
				<td>User Name</td>
				<td><form:input path="userName" class="required" /></td> 
			</tr>
			<tr>
				<td>Login ID</td>
				<td><form:input path="loginId"  class="required"  /></td>
				     <span style="color:red;" id="result"></span>
			</tr>
			<tr>
				<td>User Level</td>
				<td><form:select path="userLevel"  class="required" >
						<option value="">--SELECT--</option>
						<form:options items="${roles}"  />
					</form:select>
				</td>
				   
			</tr>
			<tr>
				<td>Password</td>
				<td><form:password path="password"  class="password" /></td>
			</tr>
			
			<tr>
				<td>Confirm password</td>
				<td><input type="password" name="confirmPassword" class="confirm_password"/></td>
				   
			</tr>
			
			<tr>
				<td>Email</td>
				<td><form:input path="email" class="required email"/></td>
				  
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><form:input path="dateOfBirth" class="required" id = "datepicker"/></td>
			</tr>
			
			<%--    <tr>
			        <td>Customer</td>
			        <td><form:select path="customer.customerId">
			         <option value="0">--SELECT--</option>
			        <form:options items="${customerList}"  itemValue="customerId" itemLabel="customerName"/>
			        </form:select>
			    </tr> --%>
			<tr>
				<td>Department</td>
				<td><form:select path="department.departmentCode" class="required">
						<option value="">--SELECT--</option>
						<form:options  items="${departmentList}" itemValue="departmentCode"
							itemLabel="departmentName" />
					</form:select>
			</tr>
			
			
			<tr>
				<td>Gender </td><td>
					<%-- <form:select path="gender" class="required">
						<option value="">--SELECT--</option>
						<form:options items="${genders}"  />
					</form:select> --%>
					<form:radiobutton path="gender" value="MALE"/>Male
					<form:radiobutton path="gender" value="FEMALE"/>FeMale 
				</td>
			</tr>		
			<tr>
			<td>Photo</td>
			<td>
			<input type="file" name="Img" style="width: 175px;" accept=".jpg,.png"/>
			</td></tr>
			<tr>
			<td>File</td>
			<td>
			<input type="file" name="file" style="width: 175px;"/>
			</td></tr>	
			
			<tr>
			<td>Text</td>
			<td>
			<input type="text" name="text" style="width: 175px;" value="${users.text}"/>
			</td></tr>	
			<tr>
				<td>Comments</td>
				<td>
				<form:textarea rows="2" cols="21" path="comments" ></form:textarea> </td>
			</tr>

			<tr>
				<td><a class="btn btn-primary" href="${pageContext.request.contextPath}/user/users.do">Back</a></td>
				<td colspan="2"><input type="reset" class="btn btn-primary" value="Reset" />
				<input type="submit" style="margin-left: 36px;" class="button_style btn_validate btn btn-primary" value="Submit" /></td>
			</tr>
		</table>
		</div>

	</form:form>
	<script type="text/javascript">
	$(function() {
	    $( "#datepicker" ).datepicker({
	    	dateFormat:'yy-mm-dd'
	    });
	 });	
	</script>
		<script src="${pageContext.request.contextPath}/dist/js/formValidation.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
</body>
</html>