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
			<p class="title is-2">Cadastro de Usuário</p>
			<p class="title is-4">Preencha os campos solicitados abaixo</p>
		</div>
		<br>
		<h6 class="section-heading" style="color: red;">${msg}</h6>
		<div class="hero">
			<div class="hero-body-full">
				<form action="cadastrarUsuario" method="post" id="formUser" name="formUser">
					<div class="box">
						<div class="field">
							<label for="id" class="label">#id</label>
							<div class="control">
								<input type="number" name="id" class="input" id="id"
									value="${user.id}" readonly placeholder="id usuário"
									style="background-color: #f5f5f5">
							</div>
						</div>
						<div class="field">
							<label for="name" class="label">nome</label>
							<div class="control">
								<input type="text" name=name class="input" id="name"
									value="${user.name}" placeholder="insira um nome" required>
							</div>
						</div>
						<div class="field">
							<label for="login" class="label">login</label>
							<div class="control has-icons-left has-icons-right">
								<input type="text" name=login class="input" id="login"
									value="${user.login}" placeholder="insira um login" required> <span
									class="icon is-small is-left"> <i class="fa fa-user"></i>
								</span>
							</div>
						</div>
						<div class="field">
							<label for="email" class="label">email</label>
							<div class="control has-icons-left has-icons-right">
								<input type="email" name=email class="input" id="email"
									value="${user.email}" placeholder="insira um email" required> <span
									class="icon is-small is-left"> <i class="fa fa-envelope"></i>
								</span>
							</div>
						</div>
						<div class="field">
							<label for="password" class="label">senha</label>
							<div class="control has-icons-left has-icons-right">
								<input type="password" name=password class="input" id="password"
									value="${user.password}" placeholder="insira uma senha" required>
								<span class="icon is-small is-left"> <i class="fa fa-key"></i>
								</span>
							</div>
						</div>
						<div class="field">
							<label class="label">tipo</label>
							<div class="control">
								<div class="select">
									<select id="type" name="type" style="width: 260px" required="required">
										<option value="">[--Selecione--]</option>
										<option value="colaborador"
										<%if (request.getAttribute("user") != null) {
											User user = (User) request.getAttribute("user");
												if (user.getType().equalsIgnoreCase("colaborador")) {
													out.print(" ");
													out.print("selected=\"selected\"");
													out.print(" ");
												}
											}%>>Colaborador</option>
										<option value="administrador"
											<%if (request.getAttribute("user") != null) {
											User user = (User) request.getAttribute("user");
												if (user.getType().equalsIgnoreCase("administrador")) {
													out.print(" ");
													out.print("selected=\"selected\"");
													out.print(" ");
												}
											}%>>Administrador</option>										
									</select>
								</div>
							</div>
						</div>					
						<div class="">
							<div class="field control is-grouped-multiline align-buttons">
								<input type="submit" value="Salvar"
									class="button is-small is-info is-outlined" onClick="return vazio()"> <input
									type="submit" value="Cancelar"
									class="button is-small is-danger is-outlined"
									onclick="document.getElementById('formUser').action='cadastrarUsuario?action=reset'"
									style="margin-left: 20px">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="hero">
			<div class="hero-body-full">
				<table
					class="table table is-striped is-narrow is-hoverable is-fullwidth table-margin">
					<thead>
						<tr>
							<th>#id</th>
							<th>nome</th>
							<th>login</th>
							<th>email</th>
							<th>tipo</th>
							<th>opções</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="user">
						<tr>
							<td><c:out value="${user.id}"></c:out></td>
							<td><c:out value="${user.name}"></c:out></td>
							<td><c:out value="${user.login}"></c:out></td>
							<td><c:out value="${user.email}"></c:out></td>
							<td><c:out value="${user.type}"></c:out></td>
							<td>
								<div class="is-grouped-multiline align-buttons">
									<div class="control space-intern">
										<a
											href="cadastrarUsuario?action=updateUser&user=${user.id}&type=${user.type}"
											class="button is-small is-info is-outlined"> <span
											class="icon"> <i class="fa fa-pencil-square-o"></i>
										</span> <span>Editar</span>
										</a>
									</div>

									<div class="control">
										<a
											href="cadastrarUsuario?action=deleteUser&user=${user.id}&type=${user.type}"
											class="button is-small is-danger is-outlined" onclick="return confirm('Confirmar Exclusão?');"> <span
											class="icon"> <i class="fa fa-trash-o"></i>
										</span> <span>Deletar</span>
										</a>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</body>
</html>