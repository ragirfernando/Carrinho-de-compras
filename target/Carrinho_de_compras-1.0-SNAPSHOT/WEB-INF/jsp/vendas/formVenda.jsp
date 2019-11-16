<%-- 
    Document   : formVenda
    Created on : 15/11/2019, 13:54:23
    Author     : ragir
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
    </head>
    <body>
        <h1>Escolha os produtos</h1>
        <table border="1">
            <h3>Produtos</h3>
            <c:forEach items="${errors}" var="error">
                <p style="color: red"  > ${error.message}</p>
            </c:forEach>
            <c:forEach items="${produtos}" var="p">
                <tr>
                    <td>
                        <form action="${linkTo[VendasController].add}" method="POST">
                            ${p.id}
                            ${p.descricao}
                            <input type="hidden" name="item.produto.id" value="${p.id}"/>
                            <input type="text" disabled name="item.produto.valor" value="${p.valor}"/>
                            <input type="text" name="item.quantidade"/>
                            <button type="submit">Comprar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <table border="1">
            <h3>Itens</h3>
            <tr>
                <th>Item</th>
                <th>Decrição</th>
                <th>Valor</th>
                <th>Quantidade</th>
                <th>Total</th>                                       
            </tr>

            <c:forEach items="${venda.itens}" var="item" varStatus="i">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${item.produto.descricao}</td>
                    <td>${item.produto.valor}</td>
                    <td>${item.quantidade}</td>
                    <td>${item.total()}</td>
                    <td><a href="${linkTo[VendasController].remove}?item=${i.index}">Remover</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="4" style="text-align: right">Total geral</td>
                <td>${venda.total()}</td>
            </tr>    
        </table>
        <br>
        <a href="${linkTo[VendasController].sair}"><button>Sair</button></a>
        <a href="${linkTo[VendasController].finalizar}"><button>Finalizar</button></a>
    </body>
</html>
