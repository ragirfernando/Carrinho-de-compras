package Dao;

import Entity.Produto;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Dependent
public class ProdutoDao {

    @Inject
    EntityManager manager;
    

    public void salvarProduto(Produto produto) {
        manager.getTransaction().begin();
        manager.persist(produto);
        manager.getTransaction().commit();
    }

    public Produto buscarProduto(int id) {
        return manager.find(Produto.class, id);
    }

    public List<Produto> buscarProdutos() {
        Query query = manager.createQuery("from Produto");
        return query.getResultList();
    }
    
    public void removerProduto(int id){
        manager.getTransaction().begin();
        Produto p = manager.find(Produto.class, id);
        manager.remove(p);
        manager.getTransaction().commit();
    }
    
    public void editarProduto(Produto produto){
        manager.getTransaction().begin();
        manager.merge(produto);
        manager.getTransaction().commit();
    }

}

