<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

<%@include file="WEB-INF/jspf/style.jsp"%>
<%@include file="WEB-INF/jspf/header.jsp"%>
<%@include file="WEB-INF/jspf/menu.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body>
        <br/>
        <div  align="center">
            <div class="container">
            <h1>Amortização Americana</h1>
        
                <form>
                    <div class="form-group">Empréstimo:
                        <input type="number" class="form-control col-sm-4 bg-dark" name="pv" placeholder="Valor do empréstimo" required>
                    </div>
                    <div class="form-group">Juros: 
                        <input type="number" class="form-control col-sm-4 bg-dark" name="i" placeholder="Valor dos juros (mensais)" required>
                    </div>
                    <div class="form-group">Meses: 
                        <input type="number" class="form-control col-sm-4 bg-dark" name="n" placeholder="Em quantos meses?" required>
                    </div>
                        <input type="submit" value="Enviar" class="btn btn-primary">

            <%
            DecimalFormat format = new DecimalFormat("#####.##");
            
            Exception requestException = null;
            float n1;
            float n2;
            float n3;
            float juros;
            float totalJuros;
            float totalAmortizacao;
            float amortizacao;
            float amortizacaoFinal = 0;
                        
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
           int aux = Math.round(n3);

            %>  
             
            <p><br/></p>
            
            <div class="table-sm" align="center">
                <table class="table-dark table-bordered">
                    <thead class="thead-dark">
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
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td><%= format.format(n1) %></td>
                        </tr>
            
                     
            <%
                amortizacao =  0; 
                
             
                juros = (n1*n2)/100;
                totalJuros = juros*n3;
                    for(int z = 1; z<n3; z++){
                %>
            
                        <tr>
                            <td><%= format.format(z) %></td>
                            <td><%= format.format(juros) %></td>
                            <td><%= format.format(amortizacao) %></td>
                            <td><%= format.format(juros) %></td>
                            <td><%= format.format(n1) %></td>
                        </tr>
            
            <%
         
                    }
            %>
                        <tr>
                            <td><%= format.format(aux) %></td>
                            <td><%= format.format(n1 + juros) %></td>
                            <td><%= format.format(n1) %></td>
                            <td><%= format.format(juros) %></td>
                            <td><%= 0 %></td>
                        </tr>                    
                        <tr>
                            <td>Total</td>
                            <td><%= format.format(n1 + juros * aux) %></td>
                            <td><%= format.format(n1) %></td>
                            <td><%= format.format(juros * aux) %></td>
                        </tr>
                    </tbody>
                </table>
            </div> 
                        
                </form>  
            </div>  
        </div>
                        
    </body>
    <%@include file="WEB-INF/jspf/footer.jsp"%>
</html>

