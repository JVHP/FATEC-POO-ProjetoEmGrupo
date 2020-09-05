<%-- 
    Document   : amortizacao-americana
    Created on : 1 de set de 2020, 17:52:26
    Author     : trize
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/style.jsp"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jsp"%>
        <%@include file="WEB-INF/jspf/menu.jsp" %>
        <h1>Amortização Americana</h1>

        <%@include file="WEB-INF/jspf/footer.jsp"%>
        <form>

            Empréstimo: <input type="number" name="pv" placeholder="Valor do empréstimo" required>
            Juros: <input type="number" name="i" placeholder="Valor dos juros (mensais)" required>
            Meses: <input type="number" name="n" placeholder="Em quantos meses?" required>
            <input type="submit" value="Enviar">

            <%
            Exception requestException = null;
            float n1;
            float n2;
            float n3;
            float juros;
            float totalJuros;
            float totalAmortizacao;
            float amortizacao;
            float amortizacaoFinal = 0;
            int cont = 0;
            try{
                n1 = Float.parseFloat(request.getParameter("pv"));
                n2 = Float.parseFloat(request.getParameter("i"));
                n3 = Float.parseFloat(request.getParameter("n"));
            }catch(Exception ex){
            n1 = 0;
            n2 = 0;
            n3 = 0;
            requestException = ex;
            }
            %>  
             
            <table border="1">
            <tr>
                <th>Meses</th>
                <th>Pagamento</th>
                <th>Amortização</th>
                <th>Juros</th>
                <th>Saldo Devedor</th>
            </tr>
                     
             <%
             amortizacao =  0;   
            juros = (n1*n2)/100;
            totalJuros = juros*n3;
            for(int z = 0; z<=n3-1; z++){
                cont = cont + 1;
            %>
             <tr>
                <td><%= z %></td>
                <td><%= juros %></td>
                <td><%= amortizacao %></td>
                <td><%= juros %></td>
                <td><%= n1 %></td>
            </tr>
            
            <%
         
            }
            %>
               
             <tr>
                <td><%= cont %></td>
                <td><%= n1 + juros %></td>
                <td><%= n1 %></td>
                <td><%= juros %></td>
                <td><%= 0 %></td>
            </tr>
             <tr>
                <td>Total</td>
                <td><%= n1 + juros * cont %></td>
                <td><%= n1 %></td>
                <td><%= juros * cont %></td>
            </tr>
</table>
        </form>

    </body>
</html>
