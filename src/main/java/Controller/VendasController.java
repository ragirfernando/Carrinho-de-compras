package Controller;

import Dao.ProdutoDao;
import Dao.VendaDao;
import Entity.Item;
import Entity.Produto;
import Entity.Venda;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;

@Controller
public class VendasController {

    @Inject
    private Venda venda;

    @Inject
    private VendaDao vendaDao;

    @Inject
    private ProdutoDao produtoDao;

    @Inject
    Result result;

    @Inject
    HttpSession httpSession;

    @Inject
    Validator validator;

    public void formVenda() {
        result.include("produtos", produtoDao.buscarProdutos());
    }

    public void add(Item item) {
        validator.validate(item);
        validator.onErrorRedirectTo(this).formVenda();
        Produto p = produtoDao.buscarProduto(item.getProduto().getId());
        item.setProduto(p);
        venda.getItens().add(item);
        result.redirectTo(this).formVenda();
    }

    public List<Venda> listarVenda() {
        return vendaDao.buscarVendas();
    }

    public void remove(int item) {
        venda.getItens().remove(item);
        result.redirectTo(this).formVenda();
    }

    public void sair() {
        httpSession.invalidate();
        result.redirectTo(this).formVenda();
    }

    @POST
    public void finalizar() {
        Venda v = new Venda();

        v.setItens(venda.getItens());
        v.setData(new Date());
        validator.addIf(v.getItens().isEmpty(), new I18nMessage("itens", "vazio"));
        validator.onErrorRedirectTo(this).formVenda();

        vendaDao.salvarVenda(v);
        result.redirectTo(this).listarVenda();
    }

}
