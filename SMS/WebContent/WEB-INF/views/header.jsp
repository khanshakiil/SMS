<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Navigation -->
<style>
.navbar-default>ul>li {
	color: #9d9d9d;
}

.navbar-default>ul>li>a {
	color: #9d9d9d;
}
/* .sidebar .sidebar-nav.navbar-collapse {
    border: solid;
}
.sidebar .sidebar-nav.navbar-collapse >ul>li {
    border: solid;
} */

/*gradient for side bar  */
.gradient {
	/* background: rgba(41,184,229,1);
background: -moz-linear-gradient(left, rgba(41,184,229,1) 4%, rgba(83,195,231,1) 11%, rgba(179,220,237,0.87) 27%, rgba(188,224,238,0.3) 100%);
background: -webkit-gradient(left top, right top, color-stop(4%, rgba(41,184,229,1)), color-stop(11%, rgba(83,195,231,1)), color-stop(27%, rgba(179,220,237,0.87)), color-stop(100%, rgba(188,224,238,0.3)));
background: -webkit-linear-gradient(left, rgba(41,184,229,1) 4%, rgba(83,195,231,1) 11%, rgba(179,220,237,0.87) 27%, rgba(188,224,238,0.3) 100%);
background: -o-linear-gradient(left, rgba(41,184,229,1) 4%, rgba(83,195,231,1) 11%, rgba(179,220,237,0.87) 27%, rgba(188,224,238,0.3) 100%);
background: -ms-linear-gradient(left, rgba(41,184,229,1) 4%, rgba(83,195,231,1) 11%, rgba(179,220,237,0.87) 27%, rgba(188,224,238,0.3) 100%); */
	background: rgba(193, 158, 103, 1);
	background: -moz-linear-gradient(left, rgba(193, 158, 103, 1) 0%,
		rgba(182, 141, 76, 0.82) 12%, rgba(243, 226, 199, 0.67) 22%,
		rgba(242, 224, 196, 0.64) 24%, rgba(233, 212, 179, 0.64) 37%);
	background: -webkit-gradient(left top, right top, color-stop(0%, rgba(193, 158, 103,
		1)), color-stop(12%, rgba(182, 141, 76, 0.82)),
		color-stop(22%, rgba(243, 226, 199, 0.67)),
		color-stop(24%, rgba(242, 224, 196, 0.64)),
		color-stop(37%, rgba(233, 212, 179, 0.64)));
	background: -webkit-linear-gradient(left, rgba(193, 158, 103, 1) 0%,
		rgba(182, 141, 76, 0.82) 12%, rgba(243, 226, 199, 0.67) 22%,
		rgba(242, 224, 196, 0.64) 24%, rgba(233, 212, 179, 0.64) 37%);
	background: -o-linear-gradient(left, rgba(193, 158, 103, 1) 0%,
		rgba(182, 141, 76, 0.82) 12%, rgba(243, 226, 199, 0.67) 22%,
		rgba(242, 224, 196, 0.64) 24%, rgba(233, 212, 179, 0.64) 37%);
	background: -ms-linear-gradient(left, rgba(193, 158, 103, 1) 0%,
		rgba(182, 141, 76, 0.82) 12%, rgba(243, 226, 199, 0.67) 22%,
		rgba(242, 224, 196, 0.64) 24%, rgba(233, 212, 179, 0.64) 37%);
	background: linear-gradient(to right, rgba(193, 158, 103, 1) 0%,
		rgba(182, 141, 76, 0.82) 12%, rgba(243, 226, 199, 0.67) 22%,
		rgba(242, 224, 196, 0.64) 24%, rgba(233, 212, 179, 0.64) 37%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#c19e67',
		endColorstr='#e9d4b3', GradientType=1);
}
</style>
<nav class="navbar navbar-default navbar-static-top " role="navigation"
	style="background-color: #34170f">
	<div class="navbar-header ">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"
			style="color: #fff; font-size: 22px; font-style: oblique; font-weight: bold; margin-right: 100px; margin-left: 80px">
			IPAS <!--<img src="../img/MasrafAlRayan2.jpg" style="width:20px;height:60px;">-->
		</a> <a class="navbar-brand" href="#"
			style="color: #fff; font-size: 14px; font-style: oblique;"> Login
			timestamp :<fmt:formatDate type="both" dateStyle="medium"
				timeStyle="long" value="${sessionScope.loginTime}"
				pattern="d MMM hh:mm a" />
		</a>


	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">


		<%-- <li>Login Timestamp :
		<fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "long" value = "${sessionScope.loginTime}" pattern="d MMM hh:mm a" /></li> --%>
		<li style="color: #fff; font-size: 14px; font-style: oblique;">Welcome
			Mr. ${sessionScope.User.userName}</li>
		<!-- /.dropdown -->

		<!-- /.dropdown-alerts -->
		</li>

		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<!--    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>-->
				<li><a
					href="${pageContext.request.contextPath}/docs/userManual.pdf"
					target="_blank"><i class="fa fa-info" aria-hidden="true"></i>
						Help</a></li>
				<li class="divider"></li>
				<li><a
					href="${pageContext.request.contextPath}/login/logout.do"><i
						class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse gradient">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<!--<div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
							
                            <!-- /input-group --> <img
					src="${pageContext.request.contextPath}/img/MasrafAlRayan2.jpg"
					style="width: 250px; height: 150px;">
				</li>
				<li><a href="${pageContext.request.contextPath}/login/home.do"><i
						class="fa fa-home fa-fw fa-2x" style="color: #34170f;"></i> <span
						style="color: Black; font-weight: bold;">Home</span></a></li>
				<!-- <li>
                    
                             <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>-->
				<!-- /.nav-second-level -->
				</li>

				<!--   <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li> -->

				<c:if test="${sessionScope.User.userLevel=='2'}">
					<li><a href="${pageContext.request.contextPath}/user/users.do"><i
							class="fa fa-users fa-fw fa-2x" style="color: #34170f;"></i> <span
							style="color: Black; font-weight: bold;">User</span></a></li>



				</c:if>



				<c:if test="${sessionScope.User.userLevel=='1'}">
					<li><a
						href="${pageContext.request.contextPath}/upload/file.do"><i
							class="fa fa-upload fa-fw fa-2x" style="color: #34170f;"></i><span
							style="color: Black; font-weight: bold;"> File Upload </span></a></li>

				</c:if>
				<c:if test="${sessionScope.User.userLevel=='1'}">
					<li><a
						href="${pageContext.request.contextPath}/print/newApp.do"><i
							class="fa fa-print fa-fw fa-2x" style="color: #34170f;"></i> <span
							style="color: Black; font-weight: bold;">Print </span></a></li>
				</c:if>

				<c:if test="${sessionScope.User.userLevel=='2'}">
					<li><a
						href="${pageContext.request.contextPath}/print/getAllApplicantion.do"><i
							class="fa fa-print fa-fw fa-2x" style="color: #34170f;"></i> <span
							style="color: Black; font-weight: bold;">Print </span></a></li>
				</c:if>


				<li><a
					href="${pageContext.request.contextPath}/student/students.do">
						<i class="fa fa-users fa-fw fa-2x" style="color: #34170f;"></i> <span
						style="color: Black; font-weight: bold;">Student </span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/report.do">
						<i class="fa fa-dashboard fa-fw fa-2x" style="color: #34170f;"></i>
						<span style="color: Black; font-weight: bold;">Report </span>
				</a></li>
				<c:if test="${sessionScope.User.userLevel=='1'}">
					<li><a href="${pageContext.request.contextPath}/eft.do"><i
							class="fa fa-upload fa-fw fa-2x" style="color: #34170f;"></i><span
							style="color: Black; font-weight: bold;"> External Fund
								Transfer</span></a></li>
				</c:if>
<c:if test="${sessionScope.User.userLevel=='2'}">
					<li><a href="${pageContext.request.contextPath}/eft/getAllTransaction.do"><i
							class="fa fa-upload fa-fw fa-2x" style="color: #34170f;"></i><span
							style="color: Black; font-weight: bold;"> External Fund
								Transfer</span></a></li>
				</c:if>
				<li><a
					href="${pageContext.request.contextPath}/cheque/showChequePrint.do"><i
						class="fa fa-envelope fa-fw fa-2x" style="color: #34170f;"></i> <span
						style="color: Black; font-weight: bold;">Cheque Printing </span></a></li>
				
				<li><a
					href="${pageContext.request.contextPath}/user/changePasswordPage.do"><i
						class="fa fa-key fa-fw fa-2x" style="color: #34170f;"></i> <span
						style="color: Black; font-weight: bold;">Change Password </span></a></li>

				<!-- dummy list -->

				<li><a href=""></a> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /></li>




				<!-- dummy list for ui ends here -->


				<!-- <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul> 
                           
                        </li>-->
				<!-- <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    /.nav-third-level
                                </li>
                            </ul>
                            /.nav-second-level
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            /.nav-second-level
                        </li> -->
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
