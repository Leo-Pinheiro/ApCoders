<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Inquilinos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
      <body>
              <%
                        Integer idInquilinos = Integer.parseInt(request.getParameter("idInquilinos"));
                        Inquilinos i = new Inquilinos();
                        if (idInquilinos != null) {
                            i = i.consultarInquilinos(idInquilinos);
                        }
                        String checkedMasculino = "";
                        String checkedFeminino = "";
                        String checkedOutro = "";
                        
                        switch (i.getSexo()) {
                            case "masculino":
                                checkedMasculino = "checked";
                            case "feminino":
                                checkedFeminino = "checked";
                            case "outro":
                                checkedOutro = "checked";
                        }

             %>
                <div class="container">
                  <form action="recebeeditainquilinos.jsp" method="POST" id="apcoders" action="" >
                    <h3>Editar Inquilinos</h3>  
                    <input type="hidden" name="idInquilinos" value="<%out.write("" + i.getIdInquilinos());%>" />

                    <fieldset>
                    <label>Nome</label>
                    <input type="text" name="nome" value="<%out.write(i.getNome());%>" />
                    </fieldset>
                    
                    <fieldset>
                    <label>Cpf</label>
                    <input id="cpf" type="text" name="cpf" maxlength="14" value="<%out.write(i.getCpf());%>"   onkeydown="javascript: fMasc(this, mCPF);" onclick="ValidaCPF();"><br />
                        <label id="validacpf" class="validacampos"></label>  
                    </fieldset>
                    
                    <fieldset>
                    <label>Idade</label>
                    <input type="text" name="idade" maxlength="3" value="<%out.write("" + i.getIdade());%>" /> 
                    </fieldset>

                 <fieldset>
                        <label>Sexo:</label>
                        <label for="masculino"><input type="radio" id="masculino" name="sexo" value="masculino" <%=checkedMasculino%> >Masculino</label><br>
                                                <label for="feminino"><input type="radio" id="feminino" name="sexo" value="feminino" <%=checkedFeminino%> >Feminino</label><br>
                                                <label for="outro"><input type="radio" id="outro" name="sexo" value="outro" <%=checkedOutro%> >Outro</label><br>
                   </fieldset><br/>
                
                    <fieldset>
                    <label>Telefone</label>
                    <input id="telefone" type="text" name="telefone" maxlength="15" value="<%out.write(i.getTelefone());%>" onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                    <label id="validaTelefone" class="validacampos"></label>  
                    </fieldset>  
                     
                    <fieldset>
                    <label>Email</label>
                    <input type="email" name="email" value="<%out.write(i.getEmail());%>" />
                    </fieldset> 
                    
                   <input type="submit" value="Alterar" onclick="location.href = 'consultarinquilinos.jsp';" />
                   <input type="reset" value="Cancelar" onclick="location.href = 'consultarinquilinos.jsp';" />
                  </form> 
                </div>
        </body>
</html>
