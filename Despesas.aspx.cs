using System;
using System.Web;
using System.Web.UI.WebControls;

public partial class Despesas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
          
            textData.Text = DateTime.Now.ToString("dd/MM/yyyy");

            //Recupera o número da despesa
            try
            {
                string NumeroDespesa = Session["NumeroDespesa"].ToString();
                lblNumero.Text = NumeroDespesa;
            }
            catch
            {
            }

            //Recupera os dados do número da despesa
            Despesa despesa = new Despesa();
            despesa = DespesaDAO.pesquisar(Convert.ToInt32(lblNumero.Text));

            if (despesa != null)
            {
                textData.Text = Convert.ToDateTime(despesa.Data).ToString("dd/MM/yyyy");
                lblRegistroFuncionario.Text = despesa.RegistroFunc.ToString();
                funcionario = FuncionarioDAO.pesquisar(despesa.RegistroFunc);
                textFuncionario.Text = funcionario.NomeFunc;
                textCPF.Text = funcionario.CPF;
                ddlEmpresa.SelectedValue = funcionario.Empresa;
                ddlCentroCusto.SelectedValue = funcionario.CentroCusto;
                ddlBanco.SelectedValue = funcionario.Banco;
                textAgencia.Text = funcionario.Agencia;
                textContaCorrente.Text = funcionario.ContaCorrente;
                textAdiantamento.Text = despesa.Adiantamento.ToString("#0.00");
                textAcompanhante.Text = despesa.Acompanhante;
                textDestino.Text = despesa.Destino;
                textFinalidade.Text = despesa.Finalidade;
                textMB.Text = despesa.Mb;
                ddlTipoMoeda.DataBind();
                if (despesa.Moeda != "")
                    ddlTipoMoeda.Items.FindByText(despesa.Moeda).Selected = true;

                if (funcionario.TipoConta > 0)
                    ddlTipoConta.SelectedValue = funcionario.TipoConta.ToString();
            }

            //Recupera o registro do funcionário se estiver vazio
            if (textFuncionario.Text.Equals(""))
            {
                try
                {
                    int RegistroFunc = 0;
                    RegistroFunc = Convert.ToInt32(Session["RegistroFunc"].ToString());
                    textFuncionario.Text = RegistroFunc.ToString();
                }
                catch
                {

                }
            }
        }

        // todo
        btnLancarAdiantamento.Enabled = false;

        
    }

    private void Random(int p, int p_2)
    {
        throw new NotImplementedException();
    }
    protected void ButtonVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void GridViewDespesas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ItemDespId = Convert.ToInt32(GridViewDespesas.Rows[e.RowIndex].Cells[0].Text);
        SqlDataSourceDespesas.DeleteParameters.Clear();
        SqlDataSourceDespesas.DeleteParameters.Add("ItemId", ItemDespId.ToString());
        SqlDataSourceDespesas.Delete();
        try
        {
            GridViewDespesas.DataBind();
        }
        catch (Exception erro)
        {

        }
    }
    protected void ButtonAdicionarDespesa_Click(object sender, EventArgs e)
    {
        lblItemRepetido.Text = string.Empty;
        lblMensagem.Text = string.Empty;
        lblMensagemValor.Text = string.Empty;
        lblMensagemData.Text = string.Empty;

        if (GridViewDespesas.Rows.Count >= 10)
        {
            int quantidade = ItemDespesaDAO.quantidadeDiasDespesas(lblNumero.Text);
            if (quantidade >= 10)
            {
                lblMensagem.Text = "Você pode adicionar até 10 datas de despesas!";
                ScrollDownPage();
                return;
            }
        }

        try
        {
            DateTime dataDespesa = Convert.ToDateTime(textDataDespesa.Text);
            if ((DateTime.Now.Date - dataDespesa.Date).TotalDays > 60)
            {
                lblMensagemData.Text = "<br>Apenas despesas com intervalo de 60 dias são permitidas!";
                ScrollDownPage();
                return;
            }
            if (dataDespesa > DateTime.Now)
            {
                lblMensagemData.Text = "<br>A data de despesa deve ser inferior ao dia atual!";
                ScrollDownPage();
                return;
            }
        }
        catch
        {
            lblMensagemData.Text = "Data inválida";
            ScrollDownPage();
            return;
        }

        try
        {
            Convert.ToDouble(textValorDespesa.Text);
        }
        catch
        {
            lblMensagemValor.Text = "Valor inválido";
            ScrollDownPage();
            return;
        }

        ItemDespesa itemDespesa = new ItemDespesa();
        itemDespesa.NumeroDespesa = Convert.ToInt32(lblNumero.Text);
        itemDespesa.Data = Convert.ToDateTime(textDataDespesa.Text);

        if (textOutraDespesa.Text.Equals(""))
        {
            itemDespesa.TipoDespesa = ddlTipoDespesa.SelectedItem.Text;
        }
        else
        {
            itemDespesa.TipoDespesa = textOutraDespesa.Text;
        }

        itemDespesa.Valor = Convert.ToDouble(textValorDespesa.Text);
        int registroFunc = int.Parse(lblRegistroFuncionario.Text);
        

        //REMOVIDO VALIDAÇÃO 11/12/2018 SOLICITAÇÃO ANA MARIA
        //if (ItemDespesaDAO.Consultar(registroFunc, itemDespesa.Data, itemDespesa.TipoDespesa) != null)
        //{
        //    lblItemRepetido.Text = "<br/>O item selecionado não pode ser inserido, pois já consta nos registros!";
        //    ScrollDownPage();
        //    return;
        //}

        ItemDespesaDAO.inserir(itemDespesa);

        GridViewDespesas.DataBind();

        

        ddlTipoDespesa.SelectedIndex = 0;
        textValorDespesa.Text = "";
    }
    protected void ButtonOutra_Click(object sender, EventArgs e)
    {
        textOutraDespesa.Visible = !textOutraDespesa.Visible;
        ddlTipoDespesa.Visible = !ddlTipoDespesa.Visible;
        if (ButtonOutra.Text.Equals("+"))
        {
            ButtonOutra.Text = "-";
        }
        else
        {
            ButtonOutra.Text = "+";
        }
    }
    protected void ButtonSalvar_Click(object sender, EventArgs e)
    {

    }
    private bool salvar()
    {
        lblItemRepetido.Text = string.Empty;
        //Validações dos dados
        try
        {
            Convert.ToDateTime(textData.Text);
        }
        catch
        {
            lblMensagem.Text = "Data inválida";
            ScrollDownPage();
            return false;
        }
        try
        {
            Convert.ToDouble(textAdiantamento.Text);
        }
        catch
        {
            lblMensagem.Text = "Adiantamento inválido";
            ScrollDownPage();
            return false; ;
        }

        if (textFinalidade.Text.Trim().Length == 0)
        {
            lblMensagem.Text = "Finalidade obrigatória!";
            ScrollDownPage();
            return false; ;
        }

        if (textDestino.Text.Trim().Length == 0)
        {
            lblMensagem.Text = "Destino obrigatório!";
            ScrollDownPage();
            return false; ;
        }

        lblMensagem.Text = "";

        Despesa despesa = new Despesa();
        despesa.NumeroDespesa = Convert.ToInt16(lblNumero.Text);
        despesa.Data = Convert.ToDateTime(textData.Text).ToString();
        despesa.EmpresaId = Convert.ToInt16(ddlEmpresa.SelectedValue);
        despesa.CentroCusto = ddlCentroCusto.SelectedValue;
        despesa.RegistroFunc = Convert.ToInt16(lblRegistroFuncionario.Text);
        despesa.Acompanhante = textAcompanhante.Text;
        despesa.Destino = textDestino.Text;
        despesa.Finalidade = textFinalidade.Text;
        despesa.Mb = textMB.Text;
        despesa.Moeda = ddlTipoMoeda.SelectedItem.Text;
        despesa.Adiantamento = Convert.ToDouble(textAdiantamento.Text);
        despesa.Status = 0;

        if (DespesaDAO.alterar(despesa))
        {
            lblMensagem.Text = "Despesa salva com sucesso!";
            ButtonImprimir.Enabled = ButtonImprimirDetalhe.Enabled = true;
            ScrollDownPage();
            return true;
        }
        else
        {
            lblMensagem.Text = "Despesa não foi salva!";
            ScrollDownPage();
            return false;
        }
    }

    protected void ButtonImprimir_Click(object sender, EventArgs e)
    {
       
        if (salvar())
        {
            Page.ClientScript.RegisterStartupScript(GetType(),
                                                    "AbrirJanelaImprimir",
                                                    " abrirJanelaImprimir();",
                                                    true);
        }
    }



    protected void btnLancarAdiantamento_Click(object sender, EventArgs e)
    {
        Session.Add("DataDespesa", textData.Text);
        Response.Redirect("LancarAdiantamento.aspx");
    }

    protected void ButtonImprimirDetalhe_Click(object sender, EventArgs e)
    {
        if (salvar())
        {
            Page.ClientScript.RegisterStartupScript(GetType(),
                                                    "AbrirJanelaImprimirDetalhado",
                                                    "abrirJanelaImprimirDetalhado();",
                                                    true);
        }
    }


    protected void ddlCategoriaDespesa_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScrollDownPage();
    }

    void ScrollDownPage()
    {

        Page.ClientScript.RegisterStartupScript(GetType(), "start", "window.onload=function(){ " +
           "window.scrollTo(0, document.body.scrollHeight); };", true);
    }
}