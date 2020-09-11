<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

<%@include file="WEB-INF/jspf/style.jsp"%>
<%@include file="WEB-INF/jspf/header.jsp"%>
<%@include file="WEB-INF/jspf/menu.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <h1>Amortização Constante</h1>
        
        <form class="form">
           
            Empréstimo: <input type="number" name="pv" placeholder="Valor do empréstimo" required>
            Juros: <input type="number" name="i" placeholder="Valor dos juros (mensais)" required>
            Meses: <input type="number" name="n" placeholder="Em quantos meses?" required>
            <input type="submit" value="Enviar">
            
            <%
            DecimalFormat format = new DecimalFormat("#####.##");
            
            Exception requestException = null;
            float pv, i, n, a, pagamento, j, total, total_amortizacao, total_juros;
            
            try{
                pv = Float.parseFloat(request.getParameter("pv"));
                i = Float.parseFloat(request.getParameter("i"));
                i = (i/100);
                n = Float.parseFloat(request.getParameter("n"));
                
            }catch(Exception ex){
                pv = 0;
                i = 0;
                n = 0;
                requestException = ex;
                }
            %>
            
            <h1>TABELA</h1>
        
            <table border="1" align="center" class="thead-light">
            <tr>
                <th>Meses</th>
                <th>Pagamento</th>
                <th>Amortização</th>
                <th>Juros</th>
                <th>Saldo Devedor</th>
            </tr>
            <tr>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td><%= format.format(pv) %></td>
            </tr>
            
            <%
                
            
            a = (pv/n);
            total_juros = 0;
            total_amortizacao = 0;

            for(int x = 1; x <= n; x++){
           
            j = (pv*i);
            pagamento = j+a;
            pv = pv-a;
            %>
            <tr>
                <td><%= format.format(x) %></td>
                <td><%= format.format(pagamento) %></td>
                <td><%= format.format(a) %></td>
                <td><%= format.format(j) %></td>
                <td><%= format.format(pv) %></td>
            </tr>
            <% 
            total_juros = total_juros + j;
            total_amortizacao = total_amortizacao + a;
            }

            total = total_amortizacao + total_juros;
            %>
            <tr>
                <td>Total</td>
                <td><%= format.format(total) %></td>
                <td><%= format.format(total_amortizacao) %></td>
                <td><%= format.format(total_juros) %></td>
            </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="WEB-INF/jspf/footer.jsp"%>
