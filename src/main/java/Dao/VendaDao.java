package Dao;

import Entity.Venda;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Dependent
public class VendaDao {

    @Inject
    EntityManager manager;

    public void salvarVenda(Venda venda) {
        manager.getTransaction().begin();
        manager.persist(venda);
        manager.getTransaction().commit();
    }

    public Venda buscarVenda(int id) {
        return manager.find(Venda.class, id);
    }

    public List<Venda> buscarVendas() {
        Query query = manager.createQuery("from Venda");
        return query.getResultList();
    }
    
    public void removerVenda(int id){
        manager.getTransaction().begin();
        Venda p = manager.find(Venda.class, id);
        manager.remove(p);
        manager.getTransaction().commit();
    }
    
    public void editarVenda(Venda venda){
        manager.getTransaction().begin();
        manager.merge(venda);
        manager.getTransaction().commit();
    }

}
