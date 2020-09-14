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
        <br/>
        <div align="center">
            <div class="container">
                <h1>Amortização Constante</h1>
                
                <form>
                    <div class="form-group">Empréstimo:
                        <input type="number" class="form-control col-sm-4 bg-dark text-white" name="pv" placeholder="Valor do empréstimo" required>
                    </div>
                    <div class="form-group">Juros: 
                        <input type="number" class="form-control col-sm-4 bg-dark text-white" name="i" placeholder="Valor dos juros (mensais)" required>
                    </div>
                    <div class="form-group">Meses: 
                        <input type="number" class="form-control col-sm-4 bg-dark text-white" name="n" placeholder="Em quantos meses?" required>
                    </div>
                    <input type="submit" value="Enviar" class="btn btn-primary">
            
            <%
            DecimalFormat format = new DecimalFormat("####0.00");
            
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
            
            <p><br/></p>
            
            <div class="table-sm" align="center">
                <table class="table-dark table-bordered">
                    <thead class="table-spotlight">    
                        <tr>
                            <th>Meses</th>
                            <th>Pagamento</th>
                            <th>Amortização</th>
                            <th>Juros</th>
                            <th>Saldo Devedor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>0</td>
                            <td><%= format.format(0) %></td>
                            <td><%= format.format(0) %></td>
                            <td><%= format.format(0) %></td>
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
                            <td><%= x %></td>
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
                        <tr class="table-spotlight">
                            <td>Total</td>
                            <td><%= format.format(total) %></td>
                            <td><%= format.format(total_amortizacao) %></td>
                            <td><%= format.format(total_juros) %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
                </form>
            </div>   
        </div>
                            
    </body>
</html>
<%@include file="WEB-INF/jspf/footer.jsp"%>
