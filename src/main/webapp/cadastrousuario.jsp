<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de usuário</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="<%=request.getContextPath()%>/acessoliberado.jsp" class="navbar-brand">
					Início </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/index.jsp"
					class="nav-link">Sair</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<h1>Cadastro de usuário</h1>
	<h6 style="color: red;">${msg}</h6>
	<form action="cadastrarUsuario" method="post" id="formUser">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="name" name="name"
							value="${user.name}"></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}"></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input type="text" id="email" name="email"
							value="${user.email}"></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Salvar"
							class="btn btn-success"> <input type="submit"
							value="Cancelar" class="btn btn-danger"
							onclick="document.getElementById('formUser').action='cadastrarUsuario?action=reset'">
						</td>
					</tr>
				</table>
			</li>
		</ul>
	</form>

	<table class="table table-bordered" style="margin-top: 50px">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Login</th>
				<th>Email</th>
				<th>Ações</th>
			</tr>
		</thead>

		<c:forEach items="${users}" var="user">
			<tr>
				<td><c:out value="${user.id}"></c:out></td>
				<td><c:out value="${user.name}"></c:out></td>
				<td><c:out value="${user.login}"></c:out></td>
				<td><c:out value="${user.email}"></c:out></td>
				<td><a href="cadastrarUsuario?action=deleteUser&user=${user.id}"><img
						alt="Excluir" src="resources/img/delete.png" width="20px"
						height="20px" title="Excluir"></a> <a
					href="cadastrarUsuario?action=updateUser&user=${user.id}"
					style="margin-left: 5px"><img alt="Editar"
						src="resources/img/edit.png" width="20px" height="20px"
						title="Editar"></a></td>

			</tr>
		</c:forEach>

	</table>
</body>
</html>