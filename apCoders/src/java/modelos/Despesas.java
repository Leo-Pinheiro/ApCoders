package modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Despesas {
    private int idDespesa;
    private String descricao;
    private String tipoDespesa;
    private String valor;
    private Date vencimentoFatura;
    private String statusPagamento;

    @Override
    public String toString() {
        return "Despesas{" + "idDespesa=" + idDespesa + ", descricao=" + descricao + ", tipoDespesa=" + tipoDespesa + ", valor=" + valor + ", vencimentoFatura=" + vencimentoFatura + ", statusPagamento=" + statusPagamento + '}';
    }

      public boolean incluirDespesas() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO despesas ";
                   sql += " (descricao, tipoDespesa, valor, vencimentoFatura, statusPagamento)";
                   sql += "VALUES(?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.descricao);
                stm.setString(2, this.tipoDespesa);
                stm.setString(3, this.valor);           
                stm.setDate(4, this.vencimentoFatura);
                stm.setString(5, this.statusPagamento);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
 
  
    public boolean alterarDespesas() {
       // declarando comando de execução do banco de dados
            String sql  = "UPDATE despesas ";
                   sql += "set descricao        = ?, ";
                   sql += "    tipoDespesa      = ?, ";             
                   sql += "    valor            = ?, ";
                   sql += "    vencimentoFatura = ?, ";
                   sql += "    statusPagamento  = ? ";
                   sql += " where idDespesa     = ? ";
            // conectando no banco de dados 
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);            
                 stm.setString(1, this.descricao);
                stm.setString(2, this.tipoDespesa);
                stm.setString(3, this.valor);           
                stm.setDate(4, this.vencimentoFatura);
                stm.setString(5, this.statusPagamento);
                stm.setInt(6, this.idDespesa);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirDespesas() {
   // declarando comando de execução do banco de dados
	String sql  = "DELETE FROM despesas ";
               sql += "WHERE idDespesa = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idDespesa);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Despesas consultarDespesas(Integer pIdDespesa) {
    this.idDespesa = pIdDespesa;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idDespesa, descricao, tipoDespesa, valor, vencimentoFatura, statusPagamento";
                    sql += " from despesas ";
                    sql += " where idDespesa = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Despesas des = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idDespesa);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   des = new Despesas();
                   des.setIdDespesa(rs.getInt("idDespesa"));
                   des.setDescricao(rs.getString("descricao"));
                   des.setTipoDespesa(rs.getString("tipoDespesa"));
                   des.setValor(rs.getString("valor"));
                   des.setVencimentoFatura(rs.getDate("vencimentoFatura"));
                   des.setStatusPagamento(rs.getString("statusPagamento"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return des;
	}
 public List<Despesas> consultarGeral(){
        List<Despesas> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from despesas order by valor";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Despesas despesas = new Despesas();
               despesas.setIdDespesa(rs.getInt("idDespesa"));
               despesas.setDescricao(rs.getString("descricao"));
               despesas.setTipoDespesa(rs.getString("tipoDespesa"));
               despesas.setValor(rs.getString("valor"));
               despesas.setVencimentoFatura(rs.getDate("vencimentoFatura"));
               despesas.setStatusPagamento(rs.getString("statusPagamento"));
               lista.add(despesas);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
 }
 
    public int getIdDespesa() {
        return idDespesa;
    }

    public void setIdDespesa(Integer idDespesa) {
        this.idDespesa = idDespesa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipoDespesa() {
        return tipoDespesa;
    }

    public void setTipoDespesa(String tipoDespesa) {
        this.tipoDespesa = tipoDespesa;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public Date getVencimentoFatura() {
        return vencimentoFatura;
    }

    public void setVencimentoFatura(Date vencimentoFatura) {
        this.vencimentoFatura = vencimentoFatura;
    }

    public String getStatusPagamento() {
        return statusPagamento;
    }

    public void setStatusPagamento(String statusPagamento) {
        this.statusPagamento = statusPagamento;
    }
    
}
