<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Unidades"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
      <body>
              <%
                        Integer idUnidades = Integer.parseInt(request.getParameter("idUnidades"));
                        Unidades u = new Unidades();
                        if (idUnidades != null) {
                            u = u.consultarUnidades(idUnidades);
                        }
                 
             %>
                <div class="container">
                  <form action="recebeeditaunidades.jsp" method="POST" id="apcoders" action="" >
                    <h3>Editar Unidades</h3>  
                    <input type="hidden" name="idUnidades" value="<%out.write("" + u.getIdUnidades());%>" />

                    <fieldset>
                    <label>Proprietário</label>
                    <input type="text" name="proprietario" value="<%out.write(u.getProprietario());%>" />
                    </fieldset>
                    
                    <fieldset>
                    <label>Condomínio</label>
                    <input type="text" name="condominio"  value="<%out.write(u.getCondominio());%>" />
                    </fieldset>
                    
                    <fieldset>
                    <label>CEP</label>
                    <input type="text" name="cep" value="<%out.write("" + u.getCep());%>" id="cep" class="mascCEP" value="" size="10" maxlength="9"
                               onblur="pesquisacep(this.value);" onkeypress="maskcep(this.value);" /><br />
                    </fieldset>
    
                    <fieldset>
                    <label>Rua</label>
                    <input  type="text" name="rua" value="<%out.write(u.getRua());%>" id="rua"  required="required" maxlength="80" /> <br />
                        <label id="validarua" class="validacampos"></label>    
                    </fieldset>  
                     
                    <fieldset>
                    <label>Nr</label>
                    <input type="text" name="nr" value="<%out.write("" + u.getNr());%>" id="nr" required="required" maxlength="10" /> <br />
                        <label id="validaNr" class="validacampos"></label>
                    </fieldset> 
                    
                     <fieldset>
                    <label>Complemento</label>
                    <input type="text" name="complemento" value="<%out.write(u.getComplemento());%>" />
                    </fieldset> 
                    
                    <fieldset>
                    <label>Bairro</label>
                    <input type="text" name="bairro" value="<%out.write(u.getBairro());%>" id="bairro" required="required"  maxlength="75" /> <br />
                        <label id="validaBairro" class="validacampos"></label>
                    </fieldset>
                      
                    <fieldset>
                    <label>Cidade</label>
                    <input type="text" name="cidade" value="<%out.write(u.getCidade());%>" id="cidade" required="required" maxlength="60" /> <br />
                        <label id="validaCidade" class="validacampos"></label>
                    </fieldset>
                    
                     <fieldset>
                    <label>Uf</label>
                    <input type="text" name="uf" value="<%out.write(u.getUf());%>" id="uf" required="required" maxlength="14" /> <br />
                        <label id="validaUf" class="validacampos"></label>
                    </fieldset> 
                    
                   <input type="submit" value="Alterar" onclick="location.href = 'consultarunidades.jsp';" />
                   <input type="reset" value="Cancelar" onclick="location.href = 'consultarunidades.jsp';" />
                  </form> 
                </div>
        </body>
</html>
