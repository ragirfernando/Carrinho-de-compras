<%-- 
    Document   : formUsuario
    Created on : 15/11/2019, 13:30:16
    Author     : ragir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login usuario</title>
    </head>
    <body>
        <form action="${linkTo[usuarioController].logarUsuario}" method="post">
            <input type="hidden" name="usuario.id" value="${usuario.id}">
            
            Nome 
            <input type="text" name="usuario.login" value="${usuario.login}"><br><br>
            
            Idade 
            <input type="password" name="usuario.senha" value="${usuario.senha}"><br><br>
            
            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
