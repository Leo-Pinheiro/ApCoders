<%@page import="java.sql.Date"%>
<%@page import="modelos.Despesas"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
<%
         Despesas des = new Despesas();
         des.setDescricao(request.getParameter("descricao"));
         des.setTipoDespesa(request.getParameter("tipoDespesa"));
         des.setValor(request.getParameter("valor"));
         des.setVencimentoFatura(Date.valueOf(request.getParameter("vencimentoFatura")));
         des.setStatusPagamento(request.getParameter("statusPagamento"));
        if (des.incluirDespesas()) {
            response.sendRedirect("cadastrardespesas.jsp?pmensagem=" +URLEncoder.encode("Despesa salva com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastrardespesas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar a Despesa", "UTF-8"));
    }
    
%>
    </body>
</html>
