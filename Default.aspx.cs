using System;
using System.DirectoryServices;

public partial class _Default : System.Web.UI.Page
{
    private const string dominioMycom = "MYCOM";
    private const string dominioEnygma = "ENYGMA";

    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!IsPostBack)
        {
            MultiView.ActiveViewIndex = 0;
            txtUsuario.Focus();
        }

        if (!loginAutomatico())
        {
            //Recupera dados do funcionário
            Funcionario funcionario = new Funcionario();
            try
            {
                funcionario = (Funcionario)Session["funcionario"];
                if (funcionario != null)
                {
                    funcionario = FuncionarioDAO.pesquisarPorNomeUsuarioAD(funcionario.NomeUsuarioAD);
                    Session["funcionario"] = funcionario;
                    MultiView.ActiveViewIndex = 1;


                    funcionarioTemAcesso(funcionario);
                }
            }
            catch
            {
            }
        }  
        
    }

    private bool loginAutomatico()
    {
        if (Environment.UserDomainName == dominioMycom || Environment.UserDomainName == dominioEnygma)
        {
            Funcionario funcionario = new Funcionario();
            funcionario = FuncionarioDAO.pesquisarPorNomeUsuarioAD(Environment.UserName);

            if (funcionario != null)
            {
                //Registro do funcionário na session
                Session["funcionario"] = funcionario;

                //View com os botões ativa
                MultiView.ActiveViewIndex = 1; 

                funcionarioTemAcesso(funcionario);
                return true;
            }
            else
            {
                LabelErro.Text = "Login está correto, mas funcionário não está cadastrado!";
            }
        }
        return false;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string msgErro = String.Empty;
        string nomeUsuarioAD = String.Empty;

        LabelErro.Text = String.Empty;

        //Verifica se usuário e senha estão cadastrados no AD e retorna o nome de usuário
        try
        {
            nomeUsuarioAD = ActiveDirectory.autenticar(txtUsuario.Text.Trim(), txtSenha.Text.Trim());
        }
        catch (Exception ex)
        {
            msgErro = ex.Message + " Usuário:";
        }

        //Se usuário não existe
        if (nomeUsuarioAD.Trim().Equals(""))
        {
            LabelErro.Text = msgErro;
            return;
        }

        try
        {
            //Busca dados do funcionário
            Funcionario funcionario = new Funcionario();
            funcionario = FuncionarioDAO.pesquisarPorNomeUsuarioAD(txtUsuario.Text.Trim());

            

            if (funcionario != null)
            {
                //Registro do funcionário na session
                Session["funcionario"] = funcionario;
                

                //View com os botões ativa
                MultiView.ActiveViewIndex = 1;

                funcionarioTemAcesso(funcionario);
            }
            else
            {
                LabelErro.Text = "Login está correto, mas funcionário não está cadastrado!";
            }
        }
        catch (Exception erro)
        {
            LabelErro.Text = erro.Message;
        }
    }

    private void funcionarioTemAcesso(Funcionario funcionario)
    {
        
        linhaCriarDespesa.Visible = true;
        linhaConsultarDespesas.Visible = true;
        linhaAdministrarDespesas.Visible = true;
        linhaAdiantamento.Visible = true;
        linhaFuncionariosPendentes.Visible = true;
        linhaCadastrarNovoUsuario.Visible = true;
        linhaPosicaoFinanceira.Visible = true;


        if (!funcionario.AcessoAdmin)
        {
            linhaAdministrarDespesas.Visible = false;
            linhaAdiantamento.Visible = false;
            linhaFuncionariosPendentes.Visible = false;
            linhaCadastrarNovoUsuario.Visible = false;
            linhaPosicaoFinanceira.Visible = false;
        }

    }
    protected void ButtonCriarDespesa_Click(object sender, EventArgs e)
    {
        Funcionario funcionario = new Funcionario();
        try
        {
            funcionario = (Funcionario)Session["funcionario"];
            MultiView.ActiveViewIndex = 2;
            labelNomeFuncionario.Text = funcionario.NomeFunc;
        }
        catch
        {
        }
    }
    protected void ButtonSim_Click(object sender, EventArgs e)
    {
        Funcionario funcionario = new Funcionario();
        try
        {
            funcionario = (Funcionario)Session["funcionario"];
            Session["RegistroFunc"] = funcionario.RegistroFunc;
        }
        catch { }

        int proximoNumeroDespesa = DespesaDAO.novaDespesa(funcionario.RegistroFunc);
        Session["NumeroDespesa"] = proximoNumeroDespesa;
        Response.Redirect("Despesas.aspx");
    }
    protected void ButtonAdministrarDespesa_Click(object sender, EventArgs e)
    {
        Session["Administrador"] = "1";
        Response.Redirect("AdminDespesas.aspx");
    }
    protected void ButtonConsultarDespesa_Click(object sender, EventArgs e)
    {
        Response.Redirect("TodasDespesas.aspx");
    }
    protected void ButtonNao_Click(object sender, EventArgs e)
    {
        MultiView.ActiveViewIndex = 1;
    }
    protected void ButtonAdiantamentos_Click(object sender, EventArgs e)
    {
        Session["Administrador"] = "1";
        Response.Redirect("Adiantamentos.aspx");
    }
    protected void ButtonDespesasPendentes_Click(object sender, EventArgs e)
    {
        Response.Redirect("DespesasPendentes.aspx");
    }
    protected void ButtonCadastrarNovoUsuario_Click(object sender, EventArgs e)
    {
        Response.Redirect("NovoFuncionario.aspx");
    }

    protected void ButtonPosicaoFinanceira_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmLancamentos.aspx");
    }

    protected void ButtonSolicitarAdiantamento_Click(object sender, EventArgs e)
    {
        Response.Redirect("LancarAdiantamento.aspx");
    }
}