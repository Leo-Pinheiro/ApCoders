<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Unidades"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilosconsulta.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
   
    <body>
     <hr />
        <label class="cabecalho" id="msg">
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }

                Unidades uni = new Unidades();
                List<Unidades> unidades = uni.consultarGeral();
            %>
        </label>
        <table class="table table-striped">
            <thead>
            <th scope="col">Proprietário</th>
            <th scope="col">Condomínio</th>
            <th scope="col">CEP</th>
            <th scope="col">Rua</th>
            <th scope="col">Nr</th>
            <th scope="col">Complemento</th>
            <th scope="col">Bairro</th>
            <th scope="col">Cidade</th>
            <th scope="col">Uf</th>

            <th scope="col"> Editar </th>
            <th scope="col"> Excluir </th>
        </thead>
        <tbody>
           <% for (Unidades u: unidades) { %>
            <tr>
                <td><% out.write(u.getProprietario());  %></td>
                <td><% out.write(u.getCondominio());  %></td>
                <td><% out.write(u.getCep()); %></td>
                <td><% out.write(u.getRua()); %></td>
                <td><% out.write("" + u.getNr()); %></td>
                <td><% out.write(u.getComplemento()); %></td>
                <td><% out.write(u.getBairro()); %></td>
                <td><% out.write(u.getCidade()); %></td>
                <td><% out.write(u.getUf()); %></td>

                <td><%out.write("<a href=editarunidades.jsp?idUnidades=" + u.getIdUnidades()+ ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td> 
                <td>
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("'"+ u.getIdUnidades()+"'");%>)">
                        <i class="fas fa-trash-alt" style='color:red'></i> 
                    </a>
                </td>                         
            </tr> 
            <%}%>
        </tbody>
    </table>
</form> 
<!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                

<div class="msg-popup2">
    <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
    <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
    <div class="text-center">                
        <a href=""><button class="btn btn-dark" onclick="cancela()"> Não </button></a>
        <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
    </div>
</div>                

<script>
    function cancela() {
        document.getElementsByClassName("msg-popup2")[0].style.display = "none";
    }

    function mostrarExclusao(unidades) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluirunidades.jsp?idUnidades=" + unidades;
    }
</script>
</body>
</html>

