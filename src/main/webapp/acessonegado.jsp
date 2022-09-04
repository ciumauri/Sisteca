<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="model.User, java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sisteca - Sistema de Biblioteca</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/bulma@0.9.0/css/bulma.min.css" />
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<section class="hero is-fullheight">
		<div class="hero-body has-text-centered">
			<div class="login">
				<img alt="Sisteca" src="assets\img\logo_sisteca.png">
				<form class="login-form" action="LoginServlet" method="post">
					<div class="field">
						<h3 class="title is-2">Erro</h3>
						<h3 class="title is-4">Acesso negado ao nosso sistema!</h3>
						<h3 class="title is-4">Usuário e/ou senha incorretos.</h3>
					</div>
					<br>
					<p class="control">
						<a href="<%=request.getContextPath()%>/LoginServlet?logout=true"
							class="button is-block is-fullwidth is-primary is-medium is-rounded"> <span
							class="icon"> <i class="fa fa-sign-out"></i>
						</span> <span>Sair</span>
						</a>
					</p>
				</form>
				<br>
			</div>
		</div>
	</section>	
	<br>
</body>
</html>




