
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Inquilinos"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ap Coders</title>
    </head>
    <body>
        <%
          Integer idInquilinos = Integer.parseInt(request.getParameter("idInquilinos"));
          Inquilinos con = new Inquilinos();
          if (idInquilinos != null){
              con = con.consultarInquilinos(idInquilinos);
              if(con.excluirInquilinos()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Inquilino excluido com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir o Inquilino", "UTF-8"));
                }
          }          
        %> 
    </body>
</html>
