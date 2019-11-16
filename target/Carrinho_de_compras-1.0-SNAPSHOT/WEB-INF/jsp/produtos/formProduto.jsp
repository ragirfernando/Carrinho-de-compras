<%-- 
    Document   : formProduto
    Created on : 15/11/2019, 13:48:49
    Author     : ragir
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de produtos</title>
    </head>
    <body>
        <h1>Cadastrar produtos</h1>
        
        <c:forEach items="${errors}" var="error">
            <p style="color: red">${error.message}</p>
        </c:forEach>
            
        <form action="${linkTo[ProdutosController].salvarProduto()}" method="post">
            <input type="hidden" name="produto.id" value="${produto.id}">
            Valor:
            <input type="text" name="produto.valor" value="${produto.valor}"><br><br>
            
            Descrição:
            <input type="text" name="produto.descricao" value="${produto.descricao}"><br><br>
            <input type="submit" value="Salvar">
        </form>
    </body>
</html>
