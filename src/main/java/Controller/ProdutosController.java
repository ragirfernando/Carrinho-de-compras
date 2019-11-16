package Controller;

import Dao.ProdutoDao;
import Entity.Produto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import java.util.List;
import javax.inject.Inject;

@Controller
public class ProdutosController {
    @Inject
    ProdutoDao dao;

    @Inject
    Validator validator;

    public void formProduto() {

    }

    public List<Produto> listarProduto() {
        return dao.buscarProdutos();
    }

    @Post
    public void salvarProduto(Produto produto, Result result) {
        validator.validate(produto);
        validator.onErrorRedirectTo(this).formProduto();
        
        if (produto.getId() == null) {
            dao.salvarProduto(produto);
        } else {
            dao.editarProduto(produto);
        }
        result.redirectTo(this).listarProduto();

    }

    public void editarProduto(int id, Result result) {
        Produto p = dao.buscarProduto(id);
        //faz a inclusão do obj produto na página form.jsp
        result.include(p);
        //redireciona para form.jsp
        result.of(this).formProduto();
    }

    public void excluirProduto(int id, Result result) {
        dao.removerProduto(id);
        //redireciona para listar.jsp
        result.redirectTo(this).listarProduto();
    }
}
