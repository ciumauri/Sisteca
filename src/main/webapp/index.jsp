<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sisteca - Sistema de Biblioteca</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600&display=swap"
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
						<div class="control">
							<input type="text" placeholder="usu?rio" name="login" id="login"
								class="input is-medium is-rounded" required>
						</div>
					</div>
					<div class="field">
						<div class="control">
							<input type="password" placeholder="senha" name="password"
								id="password" class="input is-medium is-rounded" required>
						</div>
					</div>
					<button
						class="button is-block is-fullwidth is-primary is-medium is-rounded">Login</button>
				</form>
				<br>
				<div class="field">
						<h3 class="title is-5">Acesso Demo</h3>
						<h3 class="title is-6">Login: admin</h3>
						<h3 class="title is-6">Senha: 123456</h3>
					</div>
			</div>
		</div>
	</section>
</body>


</body>
</html>