<!DOCTYPE html>
<%@page import="com.sjl.joinme.notification.NotificationDAO"%>
<%@page import="com.sjl.joinme.event.EventDTO"%>
<%@page import="com.sjl.joinme.event.EventDAO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"%>
<%@page import="java.util.ArrayList"%>

<html>
<title>Explore Events</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Acme"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
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

.form-control-borderless {
	border: none;
}

.form-control-borderless:hover, .form-control-borderless:active,
	.form-control-borderless:focus {
	border: none;
	outline: none;
	box-shadow: none;
}
</style>
<body class="w3-light-grey">

	<!-- Top container -->
	<div class="w3-bar w3-top w3-black w3-large bg-dark" style="z-index: 4">
		<button
			class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
			onclick="w3_open();">
			<i class="fa fa-bars"></i> Menu
		</button>
		<span class="w3-bar-item w3-right"><a href="home.jsp"
			style="color: white"><img class="w3-circle" src="img/joinme.jpg"
				style="width: 50px;"> evento</a></span>
		<%
			int count = new NotificationDAO().getNotificationCount((int) session.getAttribute("user_id"));
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
						src="img/users/<%=(int) session.getAttribute("user_id") % 82%>.jpg"
						class="w3-circle w3-margin-right" style="width: 55px">
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
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-users fa-fw"></i>Home</a> <a href="my_activities.jsp"
				class="w3-bar-item w3-button w3-padding  "><i
				class="fa fa-user fa-fw"></i> My Activities</a> <a
				href="selected_activities.jsp"
				class="w3-bar-item w3-button w3-padding  "><i
				class="fa fa-eye fa-fw"></i>Selected Activities</a> <a href="event.jsp"
				class="w3-bar-item w3-button w3-padding w3-blue"><i
				class="fa fa-search fa-fw"></i>Explore Event</a> <a href="contacts.jsp"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-users fa-fw"></i>My Contacts</a> <a
				href="activity_request.jsp" class="w3-bar-item w3-button w3-padding"><i
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
							<!-- <br> <br> <img src="img/subscribe.jpg"> -->
							<h1 class="text-primary mt-5 pb-3">Explore Events</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<%
						EventDAO dao = new EventDAO();
						for (EventDTO dto : dao.getAllEvents()) {
					%>
					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<form action=show_tags.jsp method="get">
									<img src="img/events/<%=dto.getEvent_id()%>.jpg" alt=""
										class="img-fluid rounded-circle w-50 mb-3">
									<h3><%=dto.getEvent_name()%></h3>
									<h5 class="text-muted"></h5>
									<div class="d-flex flex-row justify-content-center">
										<div class="p-4">
											<input type="hidden" name="event_id"
												value="<%=dto.getEvent_id()%>"> <input type="submit"
												name="event" value="select">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</section>

		<!-- <div class="w3-row mt-3">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="https://colorlib.com//polygon/admindek/files/assets/images/avatar-4.jpg">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Sports <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p class="lead"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>
    <div class="w3-row mt-3">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="https://colorlib.com//polygon/admindek/files/assets/images/avatar-4.jpg">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Sports <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p class="lead"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>
    <div class="w3-row mt-3">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="https://colorlib.com//polygon/admindek/files/assets/images/avatar-4.jpg">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Sports <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p class="lead"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>
    <div class="w3-row mt-3">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="https://colorlib.com//polygon/admindek/files/assets/images/avatar-4.jpg">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Sports <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p class="lead"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div> -->




		<!-- Footer -->
		<footer class="w3-container w3-padding-16 w3-light-grey">
			<h4></h4>

		</footer>

		<!-- End page content -->
	</div>

	<script>
		// Get the Sidebar
		var mySidebar = document.getElementById("mySidebar");

		// Get the DIV with overlay effect
		var overlayBg = document.getElementById("myOverlay");

		// Toggle between showing and hiding the sidebar, and add overlay effect
		function w3_open() {
			if (mySidebar.style.display === 'block') {
				mySidebar.style.display = 'none';
				overlayBg.style.display = "none";
			} else {
				mySidebar.style.display = 'block';
				overlayBg.style.display = "block";
			}
		}

		// Close the sidebar with the close button
		function w3_close() {
			mySidebar.style.display = "none";
			overlayBg.style.display = "none";
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>
