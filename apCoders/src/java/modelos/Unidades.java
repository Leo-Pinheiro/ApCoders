package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Unidades {
    private int idUnidades;
    private String proprietario;
    private String condominio;
    private String cep;
    private String rua;
    private int nr;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf;

    @Override
    public String toString() {
        return "Unidades{" + "idUnidades=" + idUnidades + ", proprietario=" + proprietario + ", condominio=" + condominio + ", cep=" + cep + ", rua=" + rua + ", nr=" + nr + ", complemento=" + complemento + ", bairro=" + bairro + ", cidade=" + cidade + ", uf=" + uf + '}';
    }
 public boolean incluirUnidades() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO unidades ";
                   sql += " (proprietario, condominio, cep, rua, nr, complemento, bairro, cidade, uf)";
                   sql += "VALUES(?,?,?,?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.proprietario);
                stm.setString(2, this.condominio);
                stm.setString(3, this.cep);           
                stm.setString(4, this.rua);
                stm.setInt(5, this.nr);
                stm.setString(6, this.complemento);
                stm.setString(7, this.bairro);
                stm.setString(8, this.cidade);
                stm.setString(9, this.uf);

                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
 
  
    public boolean alterarUnidades() {
       // declarando comando de execução do banco de dados
            String sql  = "UPDATE unidades ";
                   sql += "set proprietario    = ?, ";
                   sql += "    condominio      = ?, ";             
                   sql += "    cep             = ?, ";
                   sql += "    rua             = ?, ";
                   sql += "    nr              = ?, ";
                   sql += "    complemento     = ?, ";
                   sql += "    bairro          = ?, ";
                   sql += "    cidade          = ?, ";
                   sql += "    uf              = ? ";
                   sql += " where idUnidades = ? ";
            // conectando no banco de dados 
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);            
                stm.setString(1, this.proprietario);
                stm.setString(2, this.condominio);
                stm.setString(3, this.cep);
                stm.setString(4, this.rua);
                stm.setInt(5, this.nr);
                stm.setString(6, this.complemento);
                stm.setString(7, this.bairro);
                stm.setString(8, this.cidade);
                stm.setString(9, this.uf);
                stm.setInt(10, this.idUnidades);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirUnidades() {
   // declarando comando de execução do banco de dados
	String sql  = "DELETE FROM unidades ";
               sql += "WHERE idUnidades = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idUnidades);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Unidades consultarUnidades(Integer pIdUnidades) {
    this.idUnidades = pIdUnidades;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idUnidades, proprietario, condominio, cep, rua, nr, complemento, bairro, cidade, uf";
                    sql += " from unidades ";
                    sql += " where idUnidades = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Unidades uni = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idUnidades);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   uni = new Unidades();
                   uni.setIdUnidades(rs.getInt("idUnidades"));
                   uni.setProprietario(rs.getString("proprietario"));
                   uni.setCondominio(rs.getString("condominio"));
                   uni.setCep(rs.getString("cep"));
                   uni.setRua(rs.getString("rua"));
                   uni.setNr(rs.getInt("nr"));
                   uni.setComplemento(rs.getString("complemento"));
                   uni.setBairro(rs.getString("bairro"));
                   uni.setCidade(rs.getString("cidade"));
                   uni.setUf(rs.getString("uf"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return uni;
	}
 public List<Unidades> consultarGeral(){
        List<Unidades> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from unidades order by proprietario";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Unidades unidades = new Unidades();
               unidades.setIdUnidades(rs.getInt("idUnidades"));
               unidades.setProprietario(rs.getString("proprietario"));
               unidades.setCondominio(rs.getString("condominio"));
               unidades.setCep(rs.getString("cep"));
               unidades.setRua(rs.getString("rua"));
               unidades.setNr(rs.getInt("nr"));
               unidades.setComplemento(rs.getString("complemento"));
               unidades.setBairro(rs.getString("bairro"));
               unidades.setCidade(rs.getString("cidade"));
               unidades.setUf(rs.getString("uf"));
               lista.add(unidades);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
 }
    public int getIdUnidades() {
        return idUnidades;
    }

    public void setIdUnidades(Integer idUnidades) {
        this.idUnidades = idUnidades;
    }

    public String getProprietario() {
        return proprietario;
    }

    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public String getCondominio() {
        return condominio;
    }

    public void setCondominio(String condominio) {
        this.condominio = condominio;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNr() {
        return nr;
    }

    public void setNr(Integer nr) {
        this.nr = nr;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }
    
}
