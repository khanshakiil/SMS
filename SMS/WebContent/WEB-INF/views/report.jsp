<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- 
<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/buttons.dataTables.min.css"
	rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/dist/js/formValidation.js"></script>
<script>
$(document).ready(function(){	
	$('.modal-body').hide();
	 $('.formSubmit').on('click',function(){
		 $('.modal-body').show();
		}); 
	}); 
</script>
</head>
<body>

	<h3>Report</h3>
	<span
		style="color: green; text-align: center; display: inline-block; margin-left: 25%;">${message}</span>
	<form method="POST" id="reportForm"
		action="${pageContext.request.contextPath}/report/dealReport.do">

		<table class="table table-bordered table-striped table-highlight">
			<tr>

				<td style="width: 30%">Report Type: <select name="type"
					id="type" class="required">

						<option value="">--select--</option>
						<c:choose>
							<c:when test="${detailInsert.applicantType=='Minor'}">
								<option value="Minor" selected="selected">Minor</option>
							</c:when>
							<c:otherwise>
								<option value="deal">Deal Report</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${detailInsert.applicantType=='Individual'}">
								<option value="Individual" selected="selected">Individual</option>
							</c:when>
							<c:otherwise>
								<option value="dormancy">Dormancy Letter</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${detailInsert.applicantType=='Company'}">
								<option value="Company" selected="selected">Company</option>
							</c:when>
							<c:otherwise>
								<option value="portfolio">Portfolio Report</option>
							</c:otherwise>
						</c:choose>
				</select>
				</td>
			</tr>

		</table>
		<div id="deal">
			<input type="text" name="refNo" class ="" placeholder="Ref No." />
		</div>
		<div class="modal-content" id="dormancy" >
			<div class="modal-header">
				
				<h4 class="modal-title">Dormancy Letter Generation</h4>
			</div>
			
			<div class="modal-body" >
		
				<p>Please select the Act.Business Segment to generate the letter</p>
				<div class="row">
				<input type="radio" name="option" value="1"><i>Retail to be sent through E-mail</i></input>
				</div>
				<div class="row">
				<input type="radio" name="option" value="2"><i>Retail to be sent through QPost</i></input>
				</div>
				<div class="row">
				<input type="radio" name="option" value="3"><i>Private Banking</i></input>
				</div>
				<div class="row">
				<input type="radio" name="option" value="4"><i>Corporate Banking</i></input>
				</div>
		
			</div>
			
		</div>
		<input type="submit" style="margin-left: 36px;margin-top: 20px" id="submit" 
			class="button_style btn btn-primary btn_validate" value="Process" />

	</form>


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
		$("#deal").hide();
		$("#dormancy").hide();
		$("#type").on("change",function(){
			if('deal'==$('#type').val()){
				$("#deal").show();

				
				$("#dormancy").hide();
			}else if('dormancy'==$('#type').val()){
				$("#deal").hide();
				$("#dormancy").show();
				$(".modal-body").show();
			}
			else{
				//alert();
				$("#deal").hide();
				$("#dormancy").hide();
				
			}
		});
		
			/* $('#reportForm').on('submit', function(e){
				alert();
		        e.preventDefault();
		        if(){
		        
		        	
		        }
		        else if(''==('input[name=radioName]:checked', '#deal').val() && 'deal'==$('#type').val()){
				alert("deal");
					$("#deal").addClasss('required')
			}else if('dormancy'==$('#type').val() && ''==('input[name=radioName]:checked', '#dormancy').val()){
				alert("dormancy");
				$("#dormancy").addClasss('required')
			}
			else{
				$("#deal").hide();
				$("#dormancy").hide();
			}
		}); */
		
		var base_url = window.location.origin;	
		if(base_url==undefined){
			base_url=	window.location.protocol+'//'+window.location.hostname+':'+window.location.port;
		}
		
		base_url = base_url+"<%=request.getContextPath()%>";
		$('#submit').click(
				function() {
					
				if('portfolio'==$('#type').val()){							
					$('#reportForm').attr('action',
							base_url + "/report/portfolioReport.do");
					//alert($('#reportForm').attr('action'));
					$('#reportForm').submit();
					//alert('Submit');
				}
				else if('dormancy'==$('#type').val()){							
					$('#reportForm').attr('action',
							base_url + "/report/dormancyReport.do");
					$('#reportForm').submit();
					//alert('Submit');
				}
				});
	

			

			
		//for enable and disable of reject and aprove
		 /* var fileIds = [];
           $.each($("input[name='fileIds']:checked"), function(){            
           	fileIds.push($(this).val());
           }); */
		/* $("input[name=fileIds]").click(function(){
			var checked = $("input[name='fileIds']:checked").length;
			
			if(checked!= 'undefined' && checked!=null && checked!=0) {
	        	   $("#submit").prop('disabled','');	        	   	
	        	   }
			else{
				 $("#submit").prop('disabled','disabled');
			}
		 });
		
		
		var oTable = $('#myDatatable').DataTable( {
			
		        dom: 'Blfrtip',
		      
		        buttons: [
		       {
		           extend: 'pdf',
		           footer: true,
		           title:'Uploaded_File',
		           filename: 'Uploaded_File',
		           exportOptions: {
		                columns: [1,2,3,4,5,6]
		            }
		       },
		       {
		           extend: 'excel',
		           footer: true,
		           title: 'Uploaded_File',
		           filename: 'Uploaded_File',
		           exportOptions: {
		        	   columns: [1,2,3,4,5,6]
		            }
		       }         
		    ]  
		    
		    } );

		 */} );
	

	
	</script>
</body>

<%-- <body>
<div class="panel panel-primary" style="margin:20px;">
	<div class="panel-heading">
        	<h3 class="panel-title">Registration Form</h3>
	</div>
<div class="panel-body">
    <form>
<div class="col-md-12 col-sm-12">
	<div class="form-group col-md-6 col-sm-6">
            <label for="name">Name*	</label>
            <input type="text" class="form-control input-sm" id="name" placeholder="">
        </div>
        <div class="form-group col-md-6 col-sm-6">
            <label for="email">Email*</label>
            <input type="email" class="form-control input-sm" id="email" placeholder="">
        </div>

        <div class="form-group col-md-6 col-sm-6">
            <label for="mobile">Mobile*</label>
            <input type="text" class="form-control input-sm" id="mobile" placeholder="">
        </div>

	<div class="form-group col-md-6 col-sm-6">
	      <label for="address">Address*</label>
	      <textarea class="form-control input-sm" id="address" rows="3"></textarea>
	   </div>
	
	<div class="form-group col-md-6 col-sm-6">
            <label for="city">City*</label>
            <input type="text" class="form-control input-sm" id="city" placeholder="">
        </div>
	
	<div class="form-group col-md-6 col-sm-6">
            <label for="state">State*</label>
            <input type="text" class="form-control input-sm" id="state" placeholder="">
        </div>

	<div class="form-group col-md-6 col-sm-6">
            <label for="country">Country*</label>
            <input type="text" class="form-control input-sm" id="country" placeholder="">
        </div>

	<div class="form-group col-md-6 col-sm-6">
            <label for="pincode">Pincode</label>
            <input type="text" class="form-control input-sm" id="pincode" placeholder="">
        </div>

	<div class = "form-group col-md-6 col-sm-6">
	      <label for="years">You could register for up to 10 years for Kalabhairava Shanthi - M.A *</label>	 
		<span class="help-block">Please choose the no. of months for which you would like to register</span>
     
	      <select class="form-control input-sm" id="years">
		<option>-- Select No of Year --</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
		<option>10</option>
	      </select>
	</div>

	<div class = "form-group col-md-6 col-sm-6">
	      <label for="months">You could register for up to 10 months for Kalabhairava Shanthi. *</label>
	      <span class="help-block">Please choose the no. of months for which you would like to register</span>	      
	      <select class="form-control input-sm" id="months">
		<option>-- Select No of Month --</option>
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
		<option>10</option>
	      </select>
	</div>

	<div class="form-group col-md-6 col-sm-6" >
            <label for="pincode">Would you be visiting ashram to participate in Kalabhairava Shanthi - M.A ? * 
	    <input type="checkbox" checked data-toggle="toggle"></label>
	    <span class="help-block">if you need a cottage to stay, you could book in advance through email to ishastay@ishafoundation.org</span>
	</div>

	<div class="form-group col-md-6 col-sm-6">
            <label for="arrival">Arrival Date</label>
            <input type="text" class="form-control input-sm datepicker" id="arrival" placeholder="">
        </div>
</div>
<div class="col-md-12 col-sm-12" id="deceased">
	<div class="form-group col-md-3 col-sm-3">
            <label for="name">Name*</label>
            <input type="text" class="form-control input-sm" id="name" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="gender">Gender*</label>
            <input type="text" class="form-control input-sm" id="gender" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="age">Age*</label>
            <input type="text" class="form-control input-sm" id="age" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="DOB">Date of Birth or Exact Birth Year*</label>
            <input type="text" class="form-control input-sm datepicker" id="DOB" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="DOD">Date of Death or Exact Death Year*</label>
            <input type="text" class="form-control input-sm datepicker" id=" DOD" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="mother">Deceased Person's Mother Name*</label>
            <input type="text" class="form-control input-sm" id="mother" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
            <label for="father">Deceased Person's Father Name*</label>
            <input type="text" class="form-control input-sm" id="father" placeholder="">
        </div>
	<div class="form-group col-md-3 col-sm-3">
	    <label for="photo">Photo*</label>
	    <input type="file" id="photo">
	    <p class="help-block">Please upload individual photo. Group photo is not acceptable.</p>
	</div>
</div>

<div class="col-md-12 col-sm-12" id="addblock">
	<div class="form-group col-md-3 col-sm-3">
		<input type='button' class="btn btn-primary" value="Add" id="add"/>
	</div>
</div>
<div class="col-md-12 col-sm-12" >
	<div class="form-group col-md-3 col-sm-3 pull-right">
		<input type='text' class="form-control input-sm" id="amount" readonly placeholder="Total Amount"/>
	</div>
</div>
<div class="col-md-12 col-sm-12">
	<div class="form-group col-md-3 col-sm-3 pull-right" >
			<input type="submit" class="btn btn-primary" value="Submit"/>
	</div>
</div>
</form>
</div>
</body> --%>
</html>