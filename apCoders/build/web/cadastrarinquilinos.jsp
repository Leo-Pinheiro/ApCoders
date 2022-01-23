
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Inquilinos" %>
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
            <form action="recebedadosinquilinos.jsp" method="POST" id="apcoders" action="" >
                <h3>Cadastrar Inquilinos</h3><br />
                
                <fieldset>
                    <label>Nome </label>
                    <input type="text" name="nome" required="required" maxlength="80" />
                </fieldset>
                
                <fieldset>
                    <label>CPF </label>
                    <input id="cpf" name="cpf" type="text" required="required"  value="" maxlength="14"
                               onkeydown="javascript: fMasc(this, mCPF);" onclick="ValidaCPF();"><br />
                        <label id="validacpf" class="validacampos"></label> 
                </fieldset>
                
                <fieldset>
                 <label>Idade </label>
                  <input type="text" name="idade" required="required" maxlength="3" />
                </fieldset>
                
                 <label>Sexo: </label>
                    <fieldset> 
                        <label for="masculino"><input type="radio" id="masculino" name="sexo" value="masculino"> Masculino</label>
                    </fieldset>
                    <fieldset>
                        <label for="feminino"><input type="radio" id="feminino" name="sexo" value="feminino"> Feminino</label>
                    </fieldset>
                 <fieldset>
                        <label for="outro"><input type="radio" id="outro" name="sexo" value="outro"> Outro</label>
                    </fieldset>

                <fieldset>                   
                    <label>Telefone </label>
                    <input id="telefone" name="telefone" type="text" required="required" maxlength="15" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                        <label id="validaTelefone" class="validacampos"></label>              
                   </fieldset>
                 
                   <fieldset>
                    <label>Email </label>
                    <input type="email" name="email" required="required" maxlength="80" />
                </fieldset>
                <br />
                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" />
            </form>
        </div>
        <script>
            function enviarDados() {
                 var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    nome[0].focus();
                    alert("Informe o nome");
                    exit();
                }
                
                var cpf = document.getElementsByName("cpf");
                if (cpf[0].value === "") {
                    cpf[0].focus();
                    alert("Informe o cpf");
                    exit();
                }

                var idade = document.getElementsByName("idade");
                if (idade[0].value === "") {
                    idade[0].focus();
                    alert("Informe a idade");
                    exit();
                }

                var sexo = document.getElementsByName("sexo");
                if (sexo[0].value === "") {
                    sexo[0].focus();
                    alert("Informe o sexo");
                    exit();
                }
                
                 var telefone = document.getElementsByName("telefone");
                if (telefone[0].value === "") {
                    telefone[0].focus();
                    alert("Informe o telefone");
                    exit();
                }
                
                   var email = document.getElementsByName("email");
                if (email[0].value === "") {
                    email[0].focus();
                    alert("Informe o email");
                    exit();
                }
                
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
