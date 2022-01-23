<%@page import="modelos.Inquilinos"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
<%
         Inquilinos inq = new Inquilinos();
         inq.setNome(request.getParameter("nome"));
         inq.setCpf(request.getParameter("cpf"));
         inq.setIdade(Integer.parseInt(request.getParameter("idade")));
         inq.setSexo(request.getParameter("sexo"));
         inq.setTelefone(request.getParameter("telefone"));
         inq.setEmail(request.getParameter("email"));
        if (inq.incluirInquilinos()) {
            response.sendRedirect("cadastrarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Inquilino salvo com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastrarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar o Inquilino", "UTF-8"));
    }
    
%>
    </body>
</html>
