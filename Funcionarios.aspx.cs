using System;
using System.Web;

/// <summary>
/// Página e classe em desuso
/// </summary>
public partial class Funcionarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                funcionario = (Funcionario)Session["funcionario"];
                txtRegistroFunc.Text = funcionario.RegistroFunc.ToString();
                txtNome.Text = funcionario.NomeFunc;
                txtCPF.Text = funcionario.CPF;
                ddlBanco.SelectedValue = funcionario.Banco;
                txtAgencia.Text = funcionario.Agencia;
                txtContaCorrente.Text = funcionario.ContaCorrente;
                ddlEmpresa.SelectedValue = funcionario.Empresa;
                ddlCentroCusto.SelectedValue = funcionario.CentroCusto;
                txtUsuarioAD.Text = funcionario.NomeUsuarioAD;
            }
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        lblMensagem.Text = "";

        Funcionario funcionario = new Funcionario();

        funcionario.RegistroFunc = Convert.ToInt16(txtRegistroFunc.Text);
        funcionario.NomeFunc = txtNome.Text;
        funcionario.CPF = txtCPF.Text;
        funcionario.Banco = ddlBanco.SelectedValue;
        funcionario.Agencia = txtAgencia.Text;
        funcionario.ContaCorrente = txtContaCorrente.Text;
        funcionario.Empresa = ddlEmpresa.SelectedValue;
        funcionario.CentroCusto = ddlCentroCusto.SelectedValue;
        funcionario.IP_UltimaAlteracao = HttpContext.Current.Request.UserHostAddress;
        funcionario.NomeUsuarioAD = txtUsuarioAD.Text;

        if (FuncionarioDAO.alterar(funcionario))
        {
            lblMensagem.Text = "Dados do funcionário atualizados com sucesso!";
        }
        else
        {
            lblMensagem.Text = "Dados do funcionário não foram atualizados!";
        }
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
