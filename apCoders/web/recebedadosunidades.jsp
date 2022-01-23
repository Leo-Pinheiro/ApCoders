<%@page import="modelos.Unidades"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
<%
         Unidades uni = new Unidades();
         uni.setProprietario(request.getParameter("proprietario"));
         uni.setCondominio(request.getParameter("condominio"));
         uni.setCep(request.getParameter("cep"));
         uni.setRua(request.getParameter("rua"));
         uni.setNr(Integer.parseInt(request.getParameter("nr")));
         uni.setComplemento(request.getParameter("complemento"));
         uni.setBairro(request.getParameter("bairro"));
         uni.setCidade(request.getParameter("cidade"));
         uni.setUf(request.getParameter("uf"));
        if (uni.incluirUnidades()) {
            response.sendRedirect("cadastrarunidades.jsp?pmensagem=" +URLEncoder.encode("Unidade salva com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastrarunidades.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar a Unidade", "UTF-8"));
    }
        
%>
    </body>
</html