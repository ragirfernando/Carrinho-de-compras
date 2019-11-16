<%-- 
    Document   : cadastroUsuario
    Created on : 15/11/2019, 13:35:41
    Author     : ragir
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <c:forEach items="${errors}" var="error">
            <p style="color: red"  >${error.message}</p>
        </c:forEach>
            
        <form action="${linkTo[usuarioController].cadastrarUsuario}" method="post">
             Nome: 
             <input type="text" name="usuario.nome" value="${usuario.nome}"><br><br>
             
             Sobrenome: 
             <input type="text" name="usuario.sobrenome" value="${usuario.sobrenome}"><br><br>
             
             Login: 
             <input type="text" name="usuario.login" value="${usuario.login}"><br><br>
             
             Senha: 
             <input type="password" name="usuario.senha" value="${usuario.senha}"><br><br>
        </form>
    </body>
</html>
