<!DOCTYPE html>
<%@ page import="bookstore.*" %>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><g:layoutTitle default="Grails" /></title>

<g:layoutHead />
</head>
<body>
	<div id="wrapper">
		
		<!-- END #header -->

		<!-- username | logout link -->
		<sec:ifLoggedIn>
			<div id="login">
				${User.findByUsername(sec.loggedInUserInfo(field:'username')).firstName}
				${User.findByUsername(sec.loggedInUserInfo(field:'username')).lastName}
				|
				<g:link controller="logout" action="index">Logout</g:link>
			</div>
			<!-- END #login -->
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
			<div id="login">
				<p>
					<g:link controller="login" action="index">Click here to Login</g:link>
					or
					<g:link controller="user" action="create">Register</g:link>
				</p>
			</div>
		</sec:ifNotLoggedIn>

		<h1>Book Store</h1>
		<sec:ifAnyGranted roles="ROLE_ADMIN">
			<div>
				<g:link controller="home" action="index">Home</g:link>
				|
				<g:link controller="book" action="list">Show all Books</g:link>
				|
				<g:link controller="category" action="list">Show all Categories</g:link>
				|
				<g:link controller="book" action="create">Create Book</g:link>
				|
				<g:link controller="category" action="create">Create Category</g:link>

			</div>
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles="ROLE_USER">
			<div>
				<g:link controller="home" action="index">Home</g:link>
				|
				<g:link controller="book" action="list">Show all Books</g:link>
				|
				<g:link controller="category" action="list">Show all Categories</g:link>
			</div>
		</sec:ifAnyGranted>
		<div id="line"></div>
		<sec:ifLoggedIn>
			<div id="bag">
				<p>
					<g:link controller="basket" action="show" id="${User.findByUsername(sec.loggedInUserInfo(field:'username')).id}">My Shopping Basket</g:link>
					(${session?.basket?.items}
					Books selected )
				</p>
			</div>
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
			<div id="bag">
				<g:link controller="home" action="index">Login</g:link>
				to check your Shopping Basket!
			</div>
		</sec:ifNotLoggedIn>
		<br></br>


		<div id="nav"></div>
		<!-- END #nav -->

		<div id="content">
			<g:layoutBody />
		</div>
		<!-- END #content -->

		<br></br>
		<g:link controller="main" action="index">Home</g:link>
		<div id="footer">
			<p>
				Created by <a href="http://www.btb.hr">beta tau beta</a> |
				2013
			</p>
		</div>
		<!-- END #footer -->

	</div>
	<!-- END #wrapper -->
</body>
</html>