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
	<header>
		<nav class="navbar is-white topNav">
			<div class="container">
				<div class="navbar-brand">
					<a class="navbar-item" href="/Sisteca"> <img
						src="assets\img\logo_sisteca.png" width="112" height="50">
					</a>
					<div class="navbar-burger burger" data-target="topNav">
						<span></span> <span></span> <span></span>
					</div>
				</div>
				<div id="topNav" class="navbar-menu">
					<div class="navbar-start">
						<a href="<%=request.getContextPath()%>/acessoliberado.jsp"
							class="navbar-item"> <span class="fs-4">Início</span>
						</a>
					</div>
					<div class="navbar-end">
						<div class="navbar-item">
							<div class="field is-grouped">
								<p class="control">
									<a href="<%=request.getContextPath()%>"
										class="button is-small is-info is-outlined"> <span
										class="icon"> <i class="fa fa-sign-out"></i>
									</span> <span>Sair</span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<section class="section">
		<div class="section-heading">
			<h3 class="title is-2">Seja bem vindo ao Sisteca</h3>
			<h3 class="title is-4">Selecione a opção desejada para Cadastrar</h3>
		</div>
		<br>
	</section>
	<br>

	<div class="is-grouped-multiline align-buttons">
		<div class="control space-intern">
			<a href="cadastrarUsuario?action=selectAllUsers"
				class="btn btn-success"> <img alt="Cadastrar Usuário"
				src="assets/img/user_add.png" title="Cadastrar Usuário"
				class="image is-128x128 is-rounded" style="margin-right: 50px">
			</a>
		</div>

		<div class="control">
			<a href="cadastrarLivro?action=selectAllBooks" class="btn btn-success">
				<img alt="Cadastrar Livro" src="assets/img/book_add.png"
				title="Cadastrar Livro" class="image is-128x128 is-rounded">
			</a>
		</div>
	</div>
</body>
</html>




