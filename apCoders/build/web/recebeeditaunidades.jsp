<%@page import="modelos.Unidades" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <%
           //recebe os valores da tela HTML  
            String proprietario = request.getParameter("proprietario");
            String condominio   = request.getParameter("condominio"); 
            String cep          = request.getParameter("cep");
            String rua          = request.getParameter("rua");
            Integer nr          = Integer.parseInt(request.getParameter("nr"));
            String complemento  = request.getParameter("complemento");
            String bairro       = request.getParameter("bairro");
            String cidade       = request.getParameter("cidade");
            String uf           = request.getParameter("uf");
            Integer idUnidades  = Integer.parseInt(request.getParameter("idUnidades"));
           //instancia a Conta
            Unidades uni = new Unidades();
        
            uni.setProprietario(proprietario);
            uni.setCondominio(condominio);
            uni.setCep(cep);
            uni.setRua(rua);
            uni.setNr(nr);
            uni.setComplemento(complemento);
            uni.setBairro(bairro);
            uni.setCidade(cidade);
            uni.setUf(uf);
            uni.setIdUnidades(idUnidades);
            
            if(uni.alterarUnidades()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultarunidades.jsp?pmensagem=" +URLEncoder.encode("Unidade editada com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultarunidades.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar a Unidade", "UTF-8"));
            }          
        %>        
      </body>
</html>

