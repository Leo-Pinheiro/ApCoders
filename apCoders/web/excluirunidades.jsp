
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Unidades"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ap Coders</title>
    </head>
    <body>
        <%
          Integer idUnidades = Integer.parseInt(request.getParameter("idUnidades"));
          Unidades uni = new Unidades();
          if (idUnidades != null){
              uni = uni.consultarUnidades(idUnidades);
              if(uni.excluirUnidades()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultarunidades.jsp?pmensagem=" +URLEncoder.encode("Unidade excluida com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultarunidades.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir a Unidade", "UTF-8"));
                }
          }          
        %> 
    </body>
</html>
