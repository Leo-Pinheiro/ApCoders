
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Despesas" %>
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
            <form action="recebedadosdespesas.jsp" method="POST" id="apcoders" action="" >
                <h3>Cadastrar Despesas</h3><br />
                
                <fieldset>
                    <label>Descrição </label>
                    <input type="text" name="descricao" maxlength="80" />
                </fieldset>
                
                <fieldset>
                    <label>Tipo da Despesa </label>
                <fieldset> 
                        <label for="limpeza"><input type="radio" id="limpeza" name="tipoDespesa" value="limpeza"> Limpeza</label>
                </fieldset>
                    
                <fieldset>
                        <label for="gas"><input type="radio" id="gas" name="tipoDespesa" value="gas"> Gás</label>
                </fieldset>
                    
                <fieldset>
                        <label for="equipamento"><input type="radio" id="equipamento" name="tipoDespesa" value="equipamento"> Equipamento</label>
                </fieldset>
                    
                <fieldset>
                        <label for="manutencao"><input type="radio" id="manutencao" name="tipoDespesa" value="manutencao"> Manutenção</label>
                </fieldset>
                    
                <fieldset>
                        <label for="agua"><input type="radio" id="agua" name="tipoDespesa" value="agua"> Água</label>
                </fieldset>
                <fieldset>
                        <label for="outro"><input type="radio" id="outro" name="tipoDespesa" value="outro"> Outro</label>
                </fieldset>
                <fieldset>
                 <label>Valor </label> 
                <input name="valor"  type="text" required="required"  onkeyup="k(this);" /><br/>
                </fieldset>
                
                 <label>Vencimento da Fatura </label>
                  <input type="date" name="vencimentoFatura" required="required" />
                <fieldset>
                    <label>Status do Pagamento </label>
                     <fieldset> 
                        <label for="pendente"><input type="radio" id="pendente" name="statusPagamento" value="pendente"> Pendente</label>
                </fieldset>
                    
                <fieldset>
                        <label for="concluido"><input type="radio" id="concluido" name="statusPagamento" value="concluido"> Concluido</label>
                </fieldset>
                <br />
                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" />
            </form>
        </div>
        <script>
            function enviarDados() {
                 var tipoDespesa = document.getElementsByName("tipoDespesa");
                if (tipoDespesa[0].value === "") {
                    tipoDespesa[0].focus();
                    alert("Informe o Tipo da Despesa");
                    exit();
                }
                
                var valor = document.getElementsByName("valor");
                if (valor[0].value === "") {
                    valor[0].focus();
                    alert("Informe o Valor");
                    exit();
                }

                var vencimentoFatura = document.getElementsByName("vencimentoFatura");
                if (vencimentoFatura[0].value === "") {
                    vencimentoFatura[0].focus();
                    alert("Informe o Vencimento da Fatura");
                    exit();
                }

                var statusPagamento = document.getElementsByName("statusPagamento");
                if (statusPagamento[0].value === "") {
                    statusPagamento[0].focus();
                    alert("Informe o Status do Pagamento");
                    exit();
                }
                
                
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
