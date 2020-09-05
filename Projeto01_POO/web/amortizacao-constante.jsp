<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/style.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jsp"%>
        <%@include file="WEB-INF/jspf/menu.jsp" %>
        <h1>Amortização Constante</h1>
        <%@include file="WEB-INF/jspf/footer.jsp"%>
        
        <form>
            
            Empréstimo: <input type="number" name="pv" placeholder="Valor do empréstimo" required>
            Juros: <input type="number" name="i" placeholder="Valor dos juros (mensais)" required>
            Meses: <input type="number" name="n" placeholder="Em quantos meses?" required>
            <input type="submit" value="Enviar">
            
            <%
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
            
            <table border="1">
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
                <td><%= pv %></td>
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
                <td><%= x %></td>
                <td><%= pagamento %></td>
                <td><%= a %></td>
                <td><%= j %></td>
                <td><%= pv %></td>
            </tr>
            <% 
            total_juros = total_juros + j;
            total_amortizacao = total_amortizacao + a;
            }

            total = total_amortizacao + total_juros;
            %>
            <tr>
                <td>Total</td>
                <td><%= total %></td>
                <td><%= total_amortizacao %></td>
                <td><%= total_juros %></td>
            </tr>
            </table>
            
            
            
        </form>
        
    </body>
</html>
