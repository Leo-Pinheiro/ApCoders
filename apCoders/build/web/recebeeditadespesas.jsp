<%@page import="java.sql.Date"%>
<%@page import="modelos.Despesas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <%
           //recebe os valores da tela HTML  
            String descricao       = request.getParameter("descricao");
            String tipoDespesa     = request.getParameter("tipoDespesa"); 
            String valor           = request.getParameter("valor");
            Date vencimentoFatura  = Date.valueOf(request.getParameter("vencimentoFatura"));
            String statusPagamento = request.getParameter("statusPagamento");
            Integer idDespesa      = Integer.parseInt(request.getParameter("idDespesa"));
         
            //instancia Despesa
            Despesas des = new Despesas();
        
            des.setDescricao(descricao);
            des.setTipoDespesa(tipoDespesa);
            des.setValor(valor);
            des.setVencimentoFatura(vencimentoFatura);
            des.setStatusPagamento(statusPagamento);
            des.setIdDespesa(idDespesa);
            
            if(des.alterarDespesas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultardespesas.jsp?pmensagem=" +URLEncoder.encode("Despesa editada com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultardespesas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar a Despesa", "UTF-8"));
            }          
        %>        
      </body>
</html>

