<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Despesas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
      <body>
              <%
                        Integer idDespesa = Integer.parseInt(request.getParameter("idDespesa"));
                        Despesas d = new Despesas();
                        if (idDespesa != null) {
                            d = d.consultarDespesas(idDespesa);
                        }
  
                        String checkedLimpeza = "";
                        String checkedGas = "";
                        String checkedEquipamento = "";
                        String checkedManutencao = "";
                        String checkedAgua = "";
                        String checkedOutro = "";
                        String checkedPendente = "";
                        String checkedConcluido = "";
                        switch (d.getTipoDespesa()) {
                            case "limpeza":
                                checkedLimpeza = "checked";
                            case "gas":
                                checkedGas = "checked";
                            case "equipamento":
                                checkedEquipamento = "checked";
                            case "manutencao":
                                checkedManutencao = "checked";
                            case "agua":
                                checkedAgua = "checked";
                            case "outro":
                                checkedOutro = "checked";
                      
                        }
                        switch (d.getStatusPagamento()) {
                             case "pendente":
                                checkedPendente = "checked";
                            case "concluido":
                                checkedConcluido = "checked"; 
                        }
             %>
                <div class="container">
                  <form action="recebeeditadespesas.jsp" method="POST" id="apcoders" action="" >
                    <h3>Editar Inquilinos</h3>  
                    <input type="hidden" name="idDespesa" value="<%out.write("" + d.getIdDespesa());%>" />

                    <fieldset>
                    <label>Descrição</label>
                    <input type="text" name="descricao" value="<%out.write(d.getDescricao());%>" />
                    </fieldset>
                    
                    <fieldset>
                      <label>Tipo da Despesa</label>
                        <label for="limpeza"><input type="radio" id="limpeza" name="tipoDespesa" value="limpeza" <%=checkedLimpeza%> >Limpeza</label><br>
                                                <label for="gas"><input type="radio" id="gas" name="tipoDespesa" value="gas" <%=checkedGas%> >Gás</label><br>
                                                <label for="equipamento"><input type="radio" id="equipamento" name="tipoDespesa" value="equipamento" <%=checkedEquipamento%> >Equipamento</label><br>
                                                <label for="manutencao"><input type="radio" id="manutencao" name="tipoDespesa" value="manutencao" <%=checkedManutencao%> >Manutenção</label><br>
                                                <label for="agua"><input type="radio" id="agua" name="tipoDespesa" value="agua" <%=checkedAgua%> >Água</label><br>
                                                <label for="outro"><input type="radio" id="outro" name="tipoDespesa" value="outro" <%=checkedOutro%> >Outro</label><br>
                    </fieldset><br/>     
                    <fieldset>
                    <label>Valor</label>
                    <input type="text" name="valor" value="<%out.write(d.getValor());%>" /> 
                    </fieldset>
                    <fieldset>
                    <label>Vencimento da Fatura</label>
                    <input type="date" name="vencimentoFatura" value="<%out.write("" + d.getVencimentoFatura());%>" /> 
                    </fieldset>

                 <fieldset>
                        <label>Status do Pagamento</label>
                        <label for="pendente"><input type="radio" id="pendente" name="statusPagamento" value="pendente" <%=checkedPendente%> >Pendente</label><br>
                                                <label for="concluido"><input type="radio" id="concluido" name="statusPagamento" value="concluido" <%=checkedConcluido%> >Concluido</label><br>
                   </fieldset><br/>
                   
                   <input type="submit" value="Alterar" onclick="location.href = 'consultardespesas.jsp';" />
                   <input type="reset" value="Cancelar" onclick="location.href = 'consultardespesas.jsp';" />
                  </form> 
                </div>
        </body>
</html>
