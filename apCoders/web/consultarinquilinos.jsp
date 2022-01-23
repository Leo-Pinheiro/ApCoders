<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Inquilinos"%>
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

                Inquilinos inq = new Inquilinos();
                List<Inquilinos> inquilinos = inq.consultarGeral();
            %>
        </label>
        <table class="table table-striped">
            <thead>
            <th scope="col">Nome</th>
            <th scope="col">CPF</th>
            <th scope="col">Idade</th>
            <th scope="col">Sexo</th>
            <th scope="col">Telefone</th>
            <th scope="col">Email</th>
            <th scope="col"> Editar </th>
            <th scope="col"> Excluir </th>
        </thead>
        <tbody>
           <% for (Inquilinos i: inquilinos) { %>
            <tr>
                <td><% out.write(i.getNome());  %></td>
                <td><% out.write(i.getCpf());  %></td>
                <td><% out.write("" + i.getIdade()); %></td>
                <td><% out.write(i.getSexo()); %></td>
                <td><% out.write(i.getTelefone()); %></td>
                <td><% out.write(i.getEmail()); %></td>
                <td><%out.write("<a href=editarinquilinos.jsp?idInquilinos=" + i.getIdInquilinos()+ ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td> 
                <td>
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("'"+ i.getIdInquilinos()+"'");%>)">
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

    function mostrarExclusao(inquilinos) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluirinquilinos.jsp?idInquilinos=" + inquilinos;
    }
</script>
</body>
</html>

