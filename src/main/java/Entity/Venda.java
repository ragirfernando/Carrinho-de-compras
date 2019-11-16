package Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@SessionScoped
@Entity
@Named("venda")
@Table(name = "tab_venda")
public class Venda implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @NotNull(message = "Data,{dataObrigatorio}")
    private Date data;

    @OneToMany(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "id_venda")  
    private List<Item> itens = new ArrayList<>();
    
    public double total(){
        double soma = 0.0;
        for (Item item : itens) 
            soma = soma + item.total();
        
        return soma;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public List<Item> getItens() {
        return itens;
    }

    public void setItens(List<Item> itens) {
        this.itens = itens;
    }

    public double tamanho(){
        return itens.size();
    }
    
}
