using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NovoFuncionario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null)
        {
            Response.Redirect("Default.aspx");
        }


    }
    protected void ButtonPesquisar_Click(object sender, EventArgs e)
    {
        gridFuncionarios.DataBind();
        gridFuncionarios.Visible = true;
        gridFuncionarios.SelectedIndex = -1;
        //txtRegistroFunc.Text = "0";
        lblMensagem.Text = "";
    }

    protected void gridFuncionarios_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int registroFuncionario = Convert.ToInt16(((Label)gridFuncionarios.Rows[e.NewSelectedIndex].Cells[0].FindControl("lblRegistro")).Text);
        Funcionario funcionario = FuncionarioDAO.pesquisar(registroFuncionario);

        txtRegistroFunc.Text =  funcionario.RegistroFunc.ToString();
        txtNome.Text = funcionario.NomeFunc;
        txtCPF.Text = funcionario.CPF;
        ddlBanco.SelectedValue = funcionario.Banco;
        txtAgencia.Text = funcionario.Agencia;
        txtContaCorrente.Text = funcionario.ContaCorrente;
        ddlEmpresa.SelectedValue = funcionario.Empresa;
        txtUsuarioAD.Text = funcionario.NomeUsuarioAD;
        txtEmail.Text = funcionario.Email;
        txtCodAX.Text = funcionario.Codax;
        txtRamal.Text = funcionario.Ramal.ToString();

        ddlGrupo.SelectedIndex = ddlGestor.SelectedIndex = ddlCentroCusto.SelectedIndex = ddlTipoConta.SelectedIndex = -1;

        if (ddlGrupo.Items.FindByValue(funcionario.Grupo.ToString()) != null)
            ddlGrupo.SelectedValue = funcionario.Grupo.ToString();

        if (ddlGestor.Items.FindByValue(funcionario.Gestor.ToString()) != null)
            ddlGestor.SelectedValue = funcionario.Gestor.ToString();

        if (ddlCentroCusto.Items.FindByValue(funcionario.CentroCusto) != null)
            ddlCentroCusto.SelectedValue = funcionario.CentroCusto;

        if (ddlTipoConta.Items.FindByValue(funcionario.TipoConta.ToString()) != null)
            ddlTipoConta.SelectedValue = funcionario.TipoConta.ToString();

        gridFuncionarios.Visible = false;
        txtNomeFuncionario.Text = "";

        btnExcluir.Enabled = true;
    }
    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        lblMensagem.Text = "";

        Funcionario funcionario = new Funcionario();

        funcionario.RegistroFunc = Convert.ToInt32(txtRegistroFunc.Text);
        funcionario.NomeFunc = txtNome.Text;
        funcionario.CPF = txtCPF.Text;
        funcionario.Banco = ddlBanco.SelectedValue;
        funcionario.Agencia = txtAgencia.Text;
        funcionario.ContaCorrente = txtContaCorrente.Text;
        funcionario.Empresa = ddlEmpresa.SelectedValue;
        funcionario.CentroCusto = ddlCentroCusto.SelectedValue;
        funcionario.IP_UltimaAlteracao = HttpContext.Current.Request.UserHostAddress;
        funcionario.NomeUsuarioAD = txtUsuarioAD.Text;
        funcionario.Email = txtEmail.Text;
        funcionario.Gestor = Convert.ToInt32(ddlGestor.SelectedValue);
        funcionario.Codax = txtCodAX.Text;
        funcionario.Ramal = Convert.ToInt32(txtRamal.Text);
        funcionario.Grupo = Convert.ToInt32(ddlGrupo.SelectedValue);
        funcionario.TipoConta = Convert.ToInt32(ddlTipoConta.SelectedValue);

        Funcionario funcionarioExiste = FuncionarioDAO.pesquisar(funcionario.RegistroFunc);

        if (funcionarioExiste == null)
        {

            if (FuncionarioDAO.inserir(funcionario))
            {
                lblMensagem.Text = "Funcionário cadastrado com sucesso!";
            }
            else
            {
                lblMensagem.Text = "Erro ao cadastrar o funcionário!";
            }
        }
        else
        {
            bool alterado = FuncionarioDAO.alterar(funcionario);

            if (alterado)
            {
                lblMensagem.Text = "Dados do funcionário alterados com sucesso!";
            }
            else
            {
                lblMensagem.Text = "Erro ao alterar o cadastro do funcionário!";
            }
        }
    }
    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void ButtonConsultar_Click(object sender, EventArgs e)
    {
        Funcionario funcionario;

        if (txtRegistroFunc.Text.Trim().Equals(""))
        {
            lblMensagem.Text = "Para realizar a consulta, é necessário inserir um número de registro";
            txtRegistroFunc.Focus();
            return;
        }

        try
        {
            int registro = Convert.ToInt32(txtRegistroFunc.Text.Trim());
            funcionario = FuncionarioDAO.pesquisar(registro);
        }
        catch
        {
            lblMensagem.Text = "Número de registro inválido";
            txtRegistroFunc.Focus();
            return;
        }

        if (funcionario == null)
        {
            lblMensagem.Text = "Não existe um funcionário com esse número de registro.";
            txtNome.Focus();
            txtNome.Text = "";
            txtCPF.Text = "";
            ddlBanco.SelectedIndex = -1;
            txtAgencia.Text = "";
            txtContaCorrente.Text = "";
            ddlEmpresa.SelectedIndex = -1;
            ddlCentroCusto.SelectedIndex = -1;
            txtUsuarioAD.Text = "";
            txtEmail.Text = "";
            ddlGestor.SelectedIndex = -1;
            txtCodAX.Text = "";
            txtRamal.Text = "";
            ddlGrupo.SelectedIndex = -1;
            ddlTipoConta.SelectedIndex = -1;

            return;
        }
        else
        {
            //completar textboxes
            txtNome.Text = funcionario.NomeFunc;
            txtCPF.Text = funcionario.CPF;
            ddlBanco.SelectedValue = funcionario.Banco;
            txtAgencia.Text = funcionario.Agencia;
            txtContaCorrente.Text = funcionario.ContaCorrente;
            ddlEmpresa.SelectedValue = funcionario.Empresa;
            ddlCentroCusto.SelectedValue = funcionario.CentroCusto;
            txtUsuarioAD.Text = funcionario.NomeUsuarioAD;
            txtEmail.Text = funcionario.Email;
            txtCodAX.Text = funcionario.Codax;
            txtRamal.Text = funcionario.Ramal.ToString();

            if (funcionario.Grupo != 0)
                ddlGrupo.SelectedValue = funcionario.Grupo.ToString();

            if (funcionario.Gestor != 0)
                ddlGestor.SelectedValue = funcionario.Gestor.ToString();

            if (funcionario.CentroCusto != "")
                ddlCentroCusto.SelectedValue = funcionario.CentroCusto;

            if (funcionario.TipoConta != 0)
                ddlTipoConta.SelectedValue = funcionario.TipoConta.ToString();

            btnExcluir.Enabled = true;

        }
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Sim")
        {
            int registro = Convert.ToInt32(txtRegistroFunc.Text);
            if (FuncionarioDAO.excluir(registro))
            {
                lblMensagem.Text = "Funcionário excluido com sucesso!";
                txtRegistroFunc.Text = "";
                txtNome.Focus();
                txtNome.Text = "";
                txtCPF.Text = "";
                ddlBanco.SelectedIndex = -1;
                txtAgencia.Text = "";
                txtContaCorrente.Text = "";
                ddlEmpresa.SelectedIndex = -1;
                ddlCentroCusto.SelectedIndex = -1;
                txtUsuarioAD.Text = "";
                txtEmail.Text = "";
                ddlGestor.SelectedIndex = -1;
                txtCodAX.Text = "";
                txtRamal.Text = "";
                ddlGrupo.SelectedIndex = -1;
                ddlTipoConta.SelectedIndex = -1;
            }
            else
            {
                lblMensagem.Text = "Erro durante a exclusão.";
            }
        }
    }
}