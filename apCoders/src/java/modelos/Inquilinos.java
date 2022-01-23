
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Inquilinos {
    private int idInquilinos;  //serial
    private String nome;
    private String cpf;
    private int idade;
    private String sexo;
    private String telefone;
    private String email;

    @Override
    public String toString() {
        return "Inquilinos{" + "idInquilinos=" + idInquilinos + ", nome=" + nome + ", cpf=" + cpf + ", idade=" + idade + ", sexo=" + sexo + ", telefone=" + telefone + ", email=" + email + '}';
    }

     public boolean incluirInquilinos() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO inquilinos ";
                   sql += " (nome, cpf, idade, sexo, telefone, email)";
                   sql += "VALUES(?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nome);
                stm.setString(2, this.cpf);
                stm.setInt(3, this.idade);           
                stm.setString(4, this.sexo);
                stm.setString(5, this.telefone);
                stm.setString(6, this.email);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
 
  
    public boolean alterarInquilinos() {
       // declarando comando de execução do banco de dados
            String sql  = "UPDATE inquilinos ";
                   sql += "set nome            = ?, ";
                   sql += "    cpf             = ?, ";             
                   sql += "    idade           = ?, ";
                   sql += "    sexo            = ?, ";
                   sql += "    telefone        = ?, ";
                   sql += "    email           = ? ";
                   sql += " where idInquilinos = ? ";
            // conectando no banco de dados 
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);            
                stm.setString(1, this.nome);
                stm.setString(2, this.cpf);
                stm.setInt(3, this.idade);
                stm.setString(4, this.sexo);
                stm.setString(5, this.telefone);
                stm.setString(6, this.email);
                stm.setInt(7, this.idInquilinos);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirInquilinos() {
   // declarando comando de execução do banco de dados
	String sql  = "DELETE FROM inquilinos ";
               sql += "WHERE idInquilinos = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idInquilinos);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Inquilinos consultarInquilinos(Integer pIdInquilinos) {
    this.idInquilinos = pIdInquilinos;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idInquilinos, nome, cpf, idade, sexo, telefone, email";
                    sql += " from inquilinos ";
                    sql += " where idInquilinos = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Inquilinos inq = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idInquilinos);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   inq = new Inquilinos();
                   inq.setIdInquilinos(rs.getInt("idInquilinos"));
                   inq.setNome(rs.getString("nome"));
                   inq.setCpf(rs.getString("cpf"));
                   inq.setIdade(rs.getInt("idade"));
                   inq.setSexo(rs.getString("sexo"));
                   inq.setTelefone(rs.getString("telefone"));
                   inq.setEmail(rs.getString("email"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return inq;
	}
 public List<Inquilinos> consultarGeral(){
        List<Inquilinos> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from inquilinos order by nome";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Inquilinos inquilinos = new Inquilinos();
               inquilinos.setIdInquilinos(rs.getInt("idInquilinos"));
               inquilinos.setNome(rs.getString("nome"));
               inquilinos.setCpf(rs.getString("cpf"));
               inquilinos.setIdade(rs.getInt("idade"));
               inquilinos.setSexo(rs.getString("sexo"));
               inquilinos.setTelefone(rs.getString("telefone"));
               inquilinos.setEmail(rs.getString("email"));
               lista.add(inquilinos);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
 }
    public int getIdInquilinos() {
        return idInquilinos;
    }

    public void setIdInquilinos(Integer idInquilinos) {
        this.idInquilinos = idInquilinos;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
   
}
