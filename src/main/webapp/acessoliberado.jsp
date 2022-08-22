<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acesso Liberado</title>
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
	<h1>Seja bem vindo ao Sisteca</h1>
	<div>
		<div>
			<a href="cadastrarUsuario?action=selectAllUsers" class="btn btn-success">
				<img alt="Cadastrar Usuário" src="resources/img/add_user.png"
				title="Cadastrar Usuário" height="100px">
			</a> 
			<a href="salvarUsuario?action=selectAllUsers" class="btn btn-success">
				<img alt="Cadastrar Livro" src="resources/img/add_book.png"
				title="Cadastrar Livro" height="100px">
			</a>
		</div>
	</div>
</body>
</html>