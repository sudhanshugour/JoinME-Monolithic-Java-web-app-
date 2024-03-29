<!DOCTYPE html>
<%@page import="com.sjl.joinme.user.UserDAO"%>
<%@page
	import="com.sjl.joinme.selected_activity_list.SelectedActivityListDAO"%>
<%@page import="com.sjl.joinme.notification.NotificationDAO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<html>
<title>Home</title>
<%
	if (session.getAttribute("first_name") == null && session.getAttribute("user_id") == null) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Acme"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
/////////////////////////////css for map
 -->
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
}
</style>
<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
 -->


<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: 'Acme', sans-serif;
}

#authors img {
	margin-top: -50px;
}

#authors .fa {
	font-size: 25px;
}

#authors .card:hover {
	background: #3292a6;
	color: #fff;
}

#authors .card:hover .fa {
	color: #fff;
}

#home-section {
	background: url("img/background.jpg") no-repeat;
	background-size: cover;
	background-attachment: fixed;
	min-height: 1080px;
}
</style>
<!--  
<audio autoplay>
<source src="audio/01 - Happy Now - MusicMingo.Com.mp3"type="audio/mpeg">
</audio>-->
<body class="w3-light-grey">

	<header id="home-section">
		<!-- Top container -->
		<div class="w3-bar w3-top w3-black w3-large bg-dark"
			style="z-index: 4">
			<button
				class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
				onclick="w3_open();">
				<i class="fa fa-bars"></i> Menu
			</button>
			<span class="w3-bar-item w3-right"><a href="home.jsp"
				style="color: white"><img class="w3-circle" src="img/joinme.jpg"
					style="width: 50px;"> evento</a></span>
			<%
			int count = new NotificationDAO().getNotificationCount((int)session.getAttribute("user_id"));
			if (count > 0) {
		%>
			<span class="w3-bar-item w3-right"><a href="notification.jsp"><img
					class="w3-circle" src="img/noti.png" style="width: 50px;"></a><%=count%></span>
			<%
			} else {
		%>
			<span class="w3-bar-item w3-right"><a href="notification.jsp"><img
					class="w3-circle" src="img/notification.png" style="width: 50px;"></a></span>
			<%
			}
		%>
		</div>

		<!-- Sidebar/menu -->
		<nav
			class="bg-dark text-light w3-sidebar w3-collapse w3-white w3-animate-left"
			style="z-index: 3; width: 300px;" id="mySidebar">
			<br>
			<div class="w3-container w3-row">
				<a href="user_profile.jsp" style="color: white">
					<div class="w3-col s4">
						<img
							src="img/users/<%=(int)session.getAttribute("user_id") % 82%>.jpg"
							alt="<%=(int)session.getAttribute("user_id") % 82%>	" class="w3-circle w3-margin-right"
							style="width: 55px">
					</div>
					<div class="w3-col s8 w3-bar">
						<span>Welcome,<br> <%=session.getAttribute("first_name")%></span><br>
					</div>
				</a>
			</div>
			<hr>

			<div class="w3-bar-block ">
				<a href="#"
					class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
					onclick="w3_close()" title="close menu"><i
					class="fas fa-user-alt"></i>Close Menu</a> <a href="home.jsp"
					class="w3-bar-item w3-button w3-padding w3-blue"><i
					class="fa fa-users fa-fw"></i>Home</a> <a href="my_activities.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-user fa-fw"></i> My Activities</a> <a
					href="selected_activities.jsp"
					class="w3-bar-item w3-button w3-padding  "><i
					class="fa fa-eye fa-fw"></i>Selected Activities</a> <a href="event.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-search fa-fw"></i>Explore Event</a> <a href="contacts.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>My Contacts</a> <a
					href="activity_request.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>Request Activity</a> <a href="logout.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>Logout</a>
			</div>
		</nav>
		<!-- Overlay effect when opening sidebar on small screens -->
		<div class="w3-overlay w3-hide-large w3-animate-opacity"
			onclick="w3_close()" style="cursor: pointer" title="close side menu"
			id="myOverlay"></div>

		<!-- !PAGE CONTENT! -->
		<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
			<!-- Header -->
			<section id="authors" class="my-5 text-center">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="info-header mb-5">
								<h1 class="text-primary mt-5 pb-3">Home</h1>
								<p class="lead pb-3"></p>
							</div>
						</div>
					</div>
					<div class="row">
						<%
							ArrayList<CreatedActivityListDTO> alADTO = new ArrayList<>();
							CreatedActivityListDAO adao = new CreatedActivityListDAO();
							alADTO = adao.getAllCreatedActivityListOrderByCount();
							if (alADTO != null) {
								for (CreatedActivityListDTO adto : alADTO) {
						%>

						<div class="col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body">
									<form action="activity_details.jsp" method="post">
										<img src="img/activity/<%=adto.getActivity_id()%>.jpg" alt=""
											class="img-fluid rounded-circle w-50 mb-3">
										<%if(adto.getStatus()=='a'){
												%>
										Assured
										<%
											}%>
										<h3><%=adto.getActivity_name()%></h3>
										<h6>
											Viewed By :
											<%=adto.getCount()%></h6>
										<h6>
											Joined By :
											<%=new SelectedActivityListDAO().getAllSelectedActivityListCountWithActivityID(adto.getActivity_id())%></h6>
										<div class="d-flex flex-row justify-content-center">
											<div class="p-4">
												<input type="hidden" name="activity_id"
													value=<%=adto.getActivity_id()%>> <input
													class="btn btn-dark" type="submit" name="show_details"
													value="details">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<%
							}
							} else {
								out.print("");
							}
						%>
					</div>
				</div>

			</section>
			<!-- End page content -->
		</div>

	</header>

	<!-- //////////////////////////////////////////////map intialization//////////////////////////////////////////////////////////////////////////sudhanshu-->
	<div class="w3-main"
		style="margin-left: 300px; margin-top: 60px; background-color: gray;">
		<!-- Header -->
		<section id="authors" class="my-5 text-center">
			<div class="row">
				<div class="col">
					<div class="info-header mb-5">
						<h1 class="text-primary mt-5 pb-3">Nearby Activities</h1>
						<p class="lead pb-3"></p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="map"></div>
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu -->

</body>

<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
////////////////////////////////javascript for map intialization
 -->

<script>
	//(23.25023790227152, 77.47747421264648)

	function initMap() {
			var myLatLng0 = {
				lat : 23.25023790227152,
				lng : 77.47747421264648
			};
			
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4.75,
			center : myLatLng0
		});
		

 
		<%for (CreatedActivityListDTO adto : alADTO) {%>
		 var avtivity_name = '<%=adto.getActivity_name()%>'
		 var lat = <%=adto.getLat()%>
		 var Long = <%=adto.getLng()%>
		 var add ='<form action="activity_details.jsp" method="post">'+
		 '<div class="d-flex flex-row justify-content-center">'+
		 '<div class="p-4">'+
		 '<input type="hidden" name="activity_id" '+'value='+
		 '<%=adto.getActivity_id()%>'
				+ '>'
				+ '<input class="btn btn-dark" type="submit" name="show_details" value="details">'
				+ '</div>' + '</div>' + '</form>'

		latlngset = new google.maps.LatLng(lat, Long);

		var marker = new google.maps.Marker({
			map : map,
			title : avtivity_name,
			position : latlngset
		});
		map.setCenter(marker.getPosition())

		var content = "<h2 style="+"color:#069"+">" + avtivity_name
				+ "</h2><br> " + add

		var infowindow = new google.maps.InfoWindow()

		google.maps.event.addListener(marker, 'click', (function(marker,
				content, infowindow) {
			return function() {
				infowindow.setContent(content);
				infowindow.open(map, marker);
			};
		})(marker, content, infowindow));
<%}%>
	///////////////////////////////////////////////////////////////////////////////////////

		////////////////////////////////////////////////////////////////////////////
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key= AIzaSyACM8WnuDJGroEZCeYCKo16HN8-acMU8J8
&callback=initMap">
	
</script>



<!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu-->
</script>

<!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu-->


</html>