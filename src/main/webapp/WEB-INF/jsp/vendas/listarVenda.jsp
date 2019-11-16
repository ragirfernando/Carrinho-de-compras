<%-- 
    Document   : listarVendas
    Created on : 15/11/2019, 13:57:40
    Author     : ragir
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de vendas</title>
    </head>
    <body>
        <h1>Lista de vendas</h1>
        
        <c:forEach items="${vendaList}" var="v">
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Data</th>
                    <th>Total</th>
                    <th>Ação</th>
                </tr>
                
                <tr>
                    <td>${v.id}</td>
                    <td>${v.data}</td>
                    <td>${v.total()}</td>
                </tr>
        </table>
    </c:forEach>
    
    </body>
</html>
