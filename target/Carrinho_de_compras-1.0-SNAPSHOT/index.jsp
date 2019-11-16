<%-- 
    Document   : index
    Created on : 15/11/2019, 13:26:51
    Author     : ragir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <h1>Ragir Fernando</h1>
         <a href="${linkTo[VendasController].formVenda}">Nova Venda</a>
        <a href="${linkTo[ProdutosController].formProduto}">Cadastrar produtos</a>
    </body>
</html>
