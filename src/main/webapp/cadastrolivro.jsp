<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="model.Book, java.util.List"%>

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
					<a class="navbar-item" href="../"> <img
						src="assets\img\logo_sisteca.png" width="112" height="50">
					</a>
					<div class="navbar-burger burger" data-target="topNav">
						<span></span> <span></span> <span></span>
					</div>
				</div>
				<div id="topNav" class="navbar-menu">
					<div class="navbar-start">
						<a href="<%=request.getContextPath()%>/acessoliberado.jsp"
							class="navbar-item"> <span class="fs-4">Inicio</span>
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
			<p class="title is-2">Cadastro de Livros</p>
			<p class="title is-4">Preencha os campos solicitados abaixo</p>
		</div>
		<br>
		<h6 class="section-heading" style="color: red;">${msg}</h6>
		<div class="hero">
			<div class="hero-body-full">
				<form action="cadastrarLivro" method="post" id="formBook">
					<div class="box">
						<div class="field">
							<label for="id" class="label">#id</label>
							<div class="control">
								<input type="number" name="id" class="input" id="id"
									value="${book.id}" readonly placeholder="id livro"
									style="background-color: #f5f5f5">
							</div>
						</div>
						<div class="field">
							<label for="name" class="label">titulo</label>
							<div class="control has-icons-left has-icons-right">
								<input type="text" name=name class="input" id="name"
									value="${book.name}" placeholder="insira nome do livro">
								<span class="icon is-small is-left"> <i
									class="fa fa-book"></i>
								</span>
							</div>
						</div>
						<div class="field">
							<label for="author" class="label">autor</label>
							<div class="control has-icons-left has-icons-right">
								<input type="text" name="author" class="input" id="author"
									value="${book.author}" placeholder="insira autor do livro">
								<span class="icon is-small is-left"> <i
									class="fa fa-user"></i>
								</span>
							</div>						
						<div class="field">
							<label for="date" class="label">data criacao</label>
							<div class="control has-icons-left has-icons-right">
								<input type="date" name=date class="input" id="date"
									value="${book.date}" placeholder="insira uma data"> <span
									class="icon is-small is-left"> <i class="fa fa-calendar"></i>
								</span>
							</div>
						</div>
						<div class="field">
							<label class="label">status</label>
							<div class="control">
								<div class="select">
									<select id="status" name="status" style="width: 260px">
										<option>Selecione o status</option>
										<option value="disponivel"
											${book.status == "disponivel" ? "selected" : ""}>Disponivel</option>
										<option value="emprestado"
											${book.status == "emprestado" ? "selected" : ""}>Emprestado</option>
										<option value="indisponivel"
											${book.status == "indisponivel" ? "selected" : ""}>Indisponivel</option>
									</select>
								</div>
							</div>
						</div>
						<br>
						<div class="">
							<div class="field control is-grouped-multiline align-buttons">
								<input type="submit" value="Salvar"
									class="button is-small is-info is-outlined"> <input
									type="submit" value="Cancelar"
									class="button is-small is-danger is-outlined"
									onclick="document.getElementById('formBook').action='cadastrarLivro?action=reset'"
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
							<th>autor</th>
							<th>data criacao</th>
							<th>status</th>
							<th>opcoes</th>
						</tr>
					</thead>
					<c:forEach items="${books}" var="book">
						<tr>
							<td><c:out value="${book.id}"></c:out></td>
							<td><c:out value="${book.name}"></c:out></td>
							<td><c:out value="${book.author}"></c:out></td>							
							<td><c:out value="${book.date}"></c:out></td>
							<td><c:out value="${book.status}"></c:out></td>

							
							<td>
								<div class="is-grouped-multiline align-buttons">
									<div class="control space-intern">
										<a
											href="cadastrarLivro?action=updateBook&book=${book.id}&type=${book.status}"
											class="button is-small is-info is-outlined"> <span
											class="icon"> <i class="fa fa-pencil-square-o"></i>
										</span> <span>Editar</span>
										</a>
									</div>

									<div class="control">
										<a
											href="cadastrarLivro?action=deleteBook&book=${book.id}&type=${book.status}"
											class="button is-small is-danger is-outlined"
											onclick="return confirm('Confirmar Exclus�o?');"> <span
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