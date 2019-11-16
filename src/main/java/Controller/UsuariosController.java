package Controller;

import Dao.UsuarioDao;
import Entity.Usuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import javax.inject.Inject;

@Controller
public class UsuariosController {
    
    @Inject
    UsuarioDao usuarioDao;
    
    @Inject
    Usuario usuario;
    
    @Inject
    Validator validator;
    
    @Inject
    Result result;
    
    private void login() {
        Usuario g = usuarioDao.buscarUsuario(usuario.getLogin());
        System.out.println(g.getLogin());
    }
    
    public void recuperarSenha() {
        
    }
    
    private void listarUsuario() {
    }
    
    
    
    @Post
    public void cadastrarUsuario(Usuario usuario, Result result) {
        validator.validate(usuario);
        validator.onErrorRedirectTo(this).login();
        
        
        //add produto no BD
        if (usuario.getId() == null) {
            usuarioDao.salvarUsuario(usuario);
        } else {
            usuarioDao.editarUsuario(usuario);
        }
        //redireciona para listar.jsp
        result.redirectTo(this).listarUsuario();

    }

   /*public void editarUsuaio(int id, Result result) {
        Usuario u = usuarioDao.buscarUsuario(id);
        //faz a inclusão do obj produto na página form.jsp
        result.include(u);
        //redireciona para form.jsp
        result.of(this).formUsurio();
    }*/
    
}
