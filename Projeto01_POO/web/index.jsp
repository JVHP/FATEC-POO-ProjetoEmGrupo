<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/style.jsp"%>
<%@include file="WEB-INF/jspf/header.jsp"%>
<%@include file="WEB-INF/jspf/menu.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
    </head>
    <body>
        <br/>
        <div class="container">
            <div class="col-12 row">
                <div class="col-1"></div>
                <div class="col-6">
                    <h1>Bem vindo ao nosso site!</h1>
                    <h6>Conheça nosso grupo:</h6>
                    <ul>
                        <li>Gabriel Ferreira</li>
                        <li>João Paulo</li>
                        <li>José Vinícius</li>
                        <li>Rogério Gongora</li>
                    </ul>    
                </div>
                <div class="col-sm-5">
                    <h1>O'que nosso site faz?</h1>
                    <p>Nosso site faz o calculo de Amortização segundo aos sistemas Constante e Americano e tambem faz o calculo da Tabela-Price</p>
                </div> 
            </div>
        </div>
        
        <div align="center" style="padding: 20px;">
            <h1>O'que são estes métodos?</h1>
        </div>
       
        <div class="container">
        <div class="card-deck">
            <div class="card bg-primary">
                <div class="card-body text-center">
                    <h1>Amortização Constante</h1>
                    <p class="card-text">O Sistema de Amortização Constante é o modelo de amortização em que ocorre o abatimento programado de valores de um empréstimo por um período determinado, onde o valor das parcelas a serem pagas é decrescente, sendo automaticamente descontado do valor inicial da dívida.</p>
                </div>
            </div>
            <div class="card bg-primary">
                <div class="card-body text-center">
                    <h1>Amortização Americana</h1>
                    <p class="card-text">O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
                </div>
            </div>
            <div class="card bg-primary">
                <div class="card-body text-center">
                    <h1>Tabela Price</h1>
                    <p class="card-text">A tabela Price ajuda a aplicar os juros da transação a prazo de modo que a cobrança seja mais bem distribuída, permitindo que o comprador consiga arcar com os custos. Mais do que isso, o método Price é o que garante que o comprador arque com juros e com o valor da dívida do imóvel de maneira justa e progressiva, sem ter nenhum tipo de aumento da dívida.</p>
                </div>
            </div>
        </div>
        </div>    
        
    </body>
</html>
<%@include file="WEB-INF/jspf/footer.jsp"%>