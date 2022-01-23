
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Unidades" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
    </head>
    <body>
        <label class="cabecalho" id="msg" id="apcoders" action="" >
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <div class="container">
            <form action="recebedadosunidades.jsp" method="POST" id="apcoders" action="" >
                <h3>Cadastrar Unidades</h3>
                
                <fieldset>
                    <label>Proprietário </label>
                    <input type="text" name="proprietario" required="required" maxlength="80" />
                </fieldset>
                
                <fieldset>
                    <label>Condomínio </label>
                   <input  name="condominio" type="text" required="required"  maxlength="40" />
                </fieldset>
                
                <fieldset>
                 <label>CEP </label>
              <input name="cep" type="text" id="cep" class="mascCEP" value="" size="10" maxlength="9"
                               onblur="pesquisacep(this.value);" onkeypress="maskcep(this.value);" /><br />
                </fieldset>
                
                <fieldset>
                    <label>Rua </label>
                     <input id="rua" name="rua" type="text" required="required" maxlength="100" /> <br />
                        <label id="validarua" class="validacampos"></label>               
                </fieldset>
                
                <fieldset>
                    <label>Nr </label>
                    <input id="nr" name="nr" type="text" required="required" maxlength="10" /> <br />
                        <label id="validaNr" class="validacampos"></label>
                </fieldset>
                   <fieldset>
                    <label>Complemento </label>
                    <input name="complemento" type="text" maxlength="40" /> <br />
                      
                </fieldset>
                   <fieldset>
                    <label>Bairro </label>
                   <input id="bairro" name="bairro" type="text" required="required"  maxlength="75" /> <br />
                        <label id="validaBairro" class="validacampos"></label>
                </fieldset>
                   <fieldset>
                    <label>Cidade </label>
                 <input id="cidade" name="cidade" type="text" required="required" maxlength="60" /> <br />
                        <label id="validaCidade" class="validacampos"></label>
                </fieldset>
                 <fieldset>
                    <label>Uf </label>
                 <input id="uf" name="uf" type="text" required="required" maxlength="14" /> <br />
                        <label id="validaUf" class="validacampos"></label>
                </fieldset>
                <br />
                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" />
            </form>
        </div>
        <script>
            function enviarDados() {
                 var proprietario = document.getElementsByName("proprietario");
                if (proprietario[0].value === "") {
                    proprietario[0].focus();
                    alert("Informe o Proprietário");
                    exit();
                }
                
                var condominio = document.getElementsByName("condominio");
                if (condominio[0].value === "") {
                    condominio[0].focus();
                    alert("Informe o Condomínio");
                    exit();
                }

                var cep = document.getElementsByName("cep");
                if (cep[0].value === "") {
                    cep[0].focus();
                    alert("Informe o CEP");
                    exit();
                }

                var rua = document.getElementsByName("rua");
                if (rua[0].value === "") {
                    rua[0].focus();
                    alert("Informe a Rua");
                    exit();
                }
                
                 var nr = document.getElementsByName("nr");
                if (nr[0].value === "") {
                    nr[0].focus();
                    alert("Informe o Nr");
                    exit();
                }
                
                   var bairro = document.getElementsByName("bairro");
                if (bairro[0].value === "") {
                    bairro[0].focus();
                    alert("Informe o Bairro");
                    exit();
                }     
                   var cidade = document.getElementsByName("cidade");
                if (cidade[0].value === "") {
                    cidade[0].focus();
                    alert("Informe a Cidade");
                    exit();
                }
                   var uf = document.getElementsByName("uf");
                if (uf[0].value === "") {
                    uf[0].focus();
                    alert("Informe a Uf");
                    exit();
                }
               
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
