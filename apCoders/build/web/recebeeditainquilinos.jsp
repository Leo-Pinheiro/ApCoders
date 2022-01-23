    <%@page import="modelos.Inquilinos" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.net.URLEncoder"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <%
               //recebe os valores da tela HTML  
                String nome          = request.getParameter("nome");
                String cpf           = request.getParameter("cpf"); 
                Integer idade        = Integer.parseInt(request.getParameter("idade"));
                String sexo          = request.getParameter("sexo");
                String telefone      = request.getParameter("telefone");
                String email         = request.getParameter("email");
                Integer idInquilinos = Integer.parseInt(request.getParameter("idInquilinos"));
               
                //instancia o Inquilino
                Inquilinos inq = new Inquilinos();

                inq.setNome(nome);
                inq.setCpf(cpf);
                inq.setIdade(idade);
                inq.setSexo(sexo);
                inq.setTelefone(telefone);
                inq.setEmail(email);
                inq.setIdInquilinos(idInquilinos);

                if(inq.alterarInquilinos()){
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Inquilino editado com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultarinquilinos.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar o Inquilino", "UTF-8"));
                }          
            %>        
          </body>
    </html>

