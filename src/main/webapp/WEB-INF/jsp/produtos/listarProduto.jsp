<%-- 
    Document   : listarProdutos
    Created on : 15/11/2019, 13:51:57
    Author     : ragir
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de produtos</title>
        <style>
            th ,td{
                border: 5px solid firebrick;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Lista de produtos</h1>
        
         <table style="width: 60%">
            <tr>
                <th>Id</th>
                <th>Valor</th>
                <th>Descrição</th>  
                <th colspan="2">Operações</th>
            </tr>
            
            <c:forEach items="${produtoList}" var="produto">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.valor}</td>
                    <td>${produto.descricao}</td>
                    <td>
                        <a href="${linkTo[ProdutosController].editarProduto}?id=${produto.id}">Editar</a></td>
                    <td><a onclick="return window.confirm('Deseja excluir o produto ${produto.descricao}? ')"
                           href="${linkTo[ProdutosController].excluirProduto}?id=${produto.id}">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
