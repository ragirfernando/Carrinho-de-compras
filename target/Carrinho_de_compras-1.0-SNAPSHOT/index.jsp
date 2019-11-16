<%-- 
    Document   : index
    Created on : 15/11/2019, 13:26:51
    Author     : ragir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>123456

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <h1>Ragir Fernando</h1>
        <form action="${linkTo[UsuariosController].login}" method="post">
            <input type="hidden" name="usuario.id" value="${usuario.id}">
            
            Login: 
            <input type="text" name="usuario.login" value="${usuario.login}"><br><br>
            
            Senha 
            <input type="password" name="usuario.senha" value="${usuario.senha}"><br><br>
            
            <input type="submit" value="Acessar">
            <a href="${linkTo[UsuariosController].recuperarSenha}">Cadatrar</a>
            <a href="${linkTo[UsuariosController].cadastrarUsuario}">Cadatrar</a>
        </form>
            
        <a href="${linkTo[VendasController].formVenda}">Nova Venda</a>
        <a href="${linkTo[ProdutosController].formProduto}">Cadastrar produtos</a>
    </body>
</html>
