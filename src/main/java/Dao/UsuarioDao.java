package Dao;

import Entity.Usuario;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Dependent
public class UsuarioDao {

    @Inject
    EntityManager manager;

    public void salvarUsuario(Usuario usuario) {
        manager.getTransaction().begin();
        manager.persist(usuario);
        manager.getTransaction().commit();
    }

    public Usuario buscarUsuario(int id) {
        return manager.find(Usuario.class, id);
    }

    public List<Usuario> buscarUsuarios() {
        Query query = manager.createQuery("from Usuario");
        return query.getResultList();
    }
    
    public void removerUsuario(int id){
        manager.getTransaction().begin();
        Usuario p = manager.find(Usuario.class, id);
        manager.remove(p);
        manager.getTransaction().commit();
    }
    
    public void editarUsuario(Usuario usuario){
        manager.getTransaction().begin();
        manager.merge(usuario);
        manager.getTransaction().commit();
    }

}

