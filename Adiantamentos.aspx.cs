using System;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Configuration;
using System.IO;

public partial class Adiantamentos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null || !funcionario.AcessoAdmin)
        {
            Response.Redirect("Default.aspx");
        }

       
        MyTimer.Enabled = Convert.ToInt32(Session["TickCount"]) == 1;
        lblMensagem.Text = string.Empty;

        PanelFuncionario.Visible = false;
    }

    void PreencheCamposFuncionario(Funcionario f)
    {
        f = f ?? new Funcionario();

        txtRegistro.Text = f.RegistroFunc.ToString() != "0" ? f.RegistroFunc.ToString() : "";
        txtNome.Text = f.NomeFunc;
        txtCPF.Text = f.CPF;
        ddlBanco.SelectedValue = f.Banco;
        txtAgencia.Text = f.Agencia;
        txtContaCorrente.Text = f.ContaCorrente;
        ddlEmpresa.SelectedValue = f.Empresa;
        ddlCentroCusto.SelectedValue = f.CentroCusto;
        ddlTipoConta.SelectedValue = f.TipoConta.ToString() != "0" ? f.TipoConta.ToString() : "1";
        txtCodAX.Text = f.Codax;
        

    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void gridFuncionarios_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int registroFuncionario = Convert.ToInt16(((Label)gridFuncionarios.Rows[e.NewSelectedIndex].Cells[0].FindControl("lblRegistro")).Text);
       

        Funcionario funcionarioSelecionado = FuncionarioDAO.pesquisar(registroFuncionario);
        PreencheCamposFuncionario(funcionarioSelecionado);

        gridAdiantamento.DataBind();

        gridFuncionarios.Visible = false;
        txtNomeFuncionario.Text = "";
       
    }

    private bool validaCampos()
    {
        if (txtRegistro.Text == string.Empty)
        {
            lblMensagem.Text = "Selecione o funcionário para o adiantamento";
            return false;
        }
        if (txtCodigoAdiantamento.Text == string.Empty)
        {
            lblMensagem.Text = "Selecione o adiantamento a ser atualizado";
            return false;
        }

        try
        {
            Convert.ToInt32(txtCodigoAdiantamento.Text);
        }
        catch
        {
            txtCodigoAdiantamento.Text = "";
            lblMensagem.Text = "Código do adiantamento inválido";
            return false;
        }

        try
        {
            if (Convert.ToDouble(txtSaldo.Text) < 0)
            {
                throw new Exception();
            }
        }
        catch
        {
            txtSaldo.Text = "";
            lblMensagem.Text = "Valor do adiantamento inválido";
            return false;
        }

        return true;
    }
    protected void btnLancar_Click(object sender, EventArgs e)
    {
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null || !funcionario.AcessoAdmin)
        {
            Response.Redirect("Default.aspx");
        }

        if (validaCampos())
        {
            Adiantamento adiantamento = new Adiantamento();
            adiantamento.CodigoAdministrador = funcionario.RegistroFunc;
            adiantamento.CodigoFuncionario = Convert.ToInt16(txtRegistro.Text);
            adiantamento.CodigoAdiantamento = Convert.ToInt32(txtCodigoAdiantamento.Text);
            adiantamento.ValorAdiantamento = Convert.ToDouble(txtSaldo.Text);
            adiantamento.Saldo = Convert.ToDouble(txtSaldo.Text);
            adiantamento.DataRequisicao = DateTime.Now;
            adiantamento.Status = 1;
            adiantamento.CentroCusto = Convert.ToInt32(funcionario.CentroCusto);
            adiantamento.Moeda = ddlTipoMoeda.SelectedValue.ToString();

            if (AdiantamentoDAO.lancarAdiantamento(adiantamento, true))
            {
                gridAdiantamento.DataBind();
                lblMensagem.Text = "Adiantamento inserido com sucesso!";
                txtSaldo.Text = "";

                Session["codigoAdiantamento"] = adiantamento.CodigoAdiantamento;
                Application["adiantamento"] = adiantamento;
                Page.ClientScript.RegisterStartupScript(GetType(),
                                                        "AbrirJanelaImprimir",
                                                        " abrirJanelaImprimir();",
                                                        true);

                MyTimer.Enabled = true;
                Session["TickCount"] = 1;
            }
            else
            {
                lblMensagem.Text = "Adiantamento não foi inserido, verifique se o código não é repetido!";
            }
        }
        else
        {
            return;
        }
    }
    protected void ButtonPesquisar_Click(object sender, EventArgs e)
    {
        PreencheCamposAdiantamento(null);
        PreencheCamposFuncionario(null);
        gridFuncionarios.DataBind();
        gridFuncionarios.Visible = true;
        gridFuncionarios.SelectedIndex = -1;
        lblMensagem.Text = "";
        PanelAdiantamento.Visible = false;
        gridAdiantamento.SelectedIndex = -1;
    }
    protected void gridAdiantamento_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblCodigo = (Label)gridAdiantamento.Rows[e.RowIndex].FindControl("lblCodigo");
        string codigo = lblCodigo.Text;

        SqlDataSourceAdiantamento.DeleteParameters.Clear();
        SqlDataSourceAdiantamento.DeleteParameters.Add("@Codigo", codigo);
        gridAdiantamento.DataBind();
    }
    protected void gridAdiantamento_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Funcionario admin = (Funcionario)Session["funcionario"];

        Label lblCodigo = (Label)gridAdiantamento.Rows[e.RowIndex].FindControl("lblCodigo");
        string codigo = lblCodigo.Text;

        DropDownList ddlStatus = (DropDownList)gridAdiantamento.Rows[e.RowIndex].FindControl("ddlStatus");
        string status = ddlStatus.SelectedValue;

        SqlDataSourceAdiantamento.UpdateParameters.Clear();
        SqlDataSourceAdiantamento.UpdateParameters.Add("@Status", status);
        SqlDataSourceAdiantamento.UpdateParameters.Add("CodigoAdministrador", admin.RegistroFunc.ToString());
        SqlDataSourceAdiantamento.UpdateParameters.Add("@CodigoAdiantamento", codigo);
        gridAdiantamento.DataBind();

        Adiantamento adiantamento = AdiantamentoDAO.pesquisar(Convert.ToInt32(codigo));
        adiantamento.Status = Convert.ToInt32(status);
        enviarEmail(adiantamento);
    }
    protected void btnDevolver_Click(object sender, EventArgs e)
    {
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null || !funcionario.AcessoAdmin)
        {
            Response.Redirect("Default.aspx");
        }

        if (validaCampos())
        {
            Adiantamento adiantamento = AdiantamentoDAO.pesquisar(Convert.ToInt32(txtCodigoAdiantamento.Text));
            if (adiantamento != null)
            {
                adiantamento.CodigoAdministrador = funcionario.RegistroFunc;
                adiantamento.Saldo -= Convert.ToDouble(txtSaldo.Text);

                if (adiantamento.Saldo < 0)
                {
                    lblMensagem.Text = "Não é possível devolver esse valor: o saldo é menor que o valor devolvido.";
                    return;
                }
                else if (adiantamento.Saldo == 0)
                {
                    // Se zerar o saldo com o valor devolvido, automaticamente é marcado como fechado o adiantamento
                    adiantamento.Status = 3;
                }

                if (AdiantamentoDAO.devolverAdiantamento(adiantamento))
                {
                    gridAdiantamento.DataBind();
                    lblMensagem.Text = "Adiantamento devolvido com sucesso!";
                    txtSaldo.Text = "";

                    enviarEmail(adiantamento);
                }
                else
                {
                    lblMensagem.Text = "Erro ao devovlver o adiantamento.";
                }
            }
            else
            {
                lblMensagem.Text = "O adiantamento não existe. Verifique se o código está correto.";
            }
        }
        else
        {
            return;
        }
    }

    private void enviarEmail(Adiantamento adiantamento)
    {

        string assunto = "Situação do Adiantamento - Sistema de Despesas";
        string html = "<p class=MsoNormal><b><span style='font-size:16.0pt;font-family:Segoe UI Light,sans-serif;mso-fareast-language:PT-BR'>Adiantamento Nº</span></b><span style='font-size:16.0pt;font-family:Segoe UI Light,sans-serif;mso-fareast-language:PT-BR'> <span style='color:black'> " + adiantamento.CodigoAdiantamento.ToString("D5") + " &#8211; <b>" + adiantamento.SimboloMoeda.ToString() + "</b> " + adiantamento.ValorAdiantamento.ToString("0.00") + " <o:p></o:p></span></span></p><p class=MsoNormal><b><span style='font-size:14.0pt;font-family:Segoe UI Light,sans-serif;color:black;mso-fareast-language:PT-BR'>Status:</span></b><span style='font-size:14.0pt;font-family:Segoe UI Light,sans-serif;color:black;mso-fareast-language:PT-BR'> " + AuxiliarDAO.pesquisarStatusAdiantamento(adiantamento.Status).ToUpper() + " <o:p></o:p></span></p><p class=MsoNormal><b><span style='font-size:14.0pt;font-family:Segoe UI Light,sans-serif;color:black;mso-fareast-language:PT-BR'>Saldo:</span></b><span style='font-size:14.0pt;font-family:Segoe UI Light,sans-serif;color:black;mso-fareast-language:PT-BR'> R$ " + adiantamento.Saldo.ToString("0.00") + " <o:p></o:p></span></p>";

        string remetente = WebConfigurationManager.AppSettings["EmailRemetente"];
        string destinatario = WebConfigurationManager.AppSettings["EmailFinanceiro"];

        string destinatarioaux = WebConfigurationManager.AppSettings["EmailFinanceiroAux"];
        //string destinatario = WebConfigurationManager.AppSettings["EmailDestinatario"];

        Funcionario funcionario = FuncionarioDAO.pesquisar(adiantamento.CodigoFuncionario);

        using (Email email = new Email(assunto, html, remetente, destinatario))
        {
            email.adicionarComCopia(funcionario.Email);
            Funcionario gestor = FuncionarioDAO.pesquisar(funcionario.Gestor);
            if (gestor != null)
            {
                email.adicionarComCopia(gestor.Email);
            }
            if (destinatarioaux != string.Empty)
            {
                email.adicionarComCopia(destinatarioaux);
            }
            email.enviarEmail();
        }

    }



    protected void MyTimer_Tick(object sender, EventArgs e)
    {
        Adiantamento novoAdiantamento = AdiantamentoDAO.pesquisar(Convert.ToInt32(Session["codigoAdiantamento"]));


        if (File.Exists(Server.MapPath("Relatorios/Adiantamento" + novoAdiantamento.CodigoAdiantamento + ".pdf")))
        {
            enviarEmail(novoAdiantamento);
            Session["TickCount"] = 2;

        }
    }

    void PreencheCamposAdiantamento(Adiantamento a)
    {
        a = a ?? new Adiantamento();

        txtCodigoAdiantamento.Text = a.CodigoAdiantamento.ToString() != "0" ?  a.CodigoAdiantamento.ToString() : "";
        ddlStatus.SelectedValue = a.Status.ToString();
        txtSaldo.Text = a.Saldo.ToString();
        txtCliente.Text = a.Cliente;
        txtAcompanhante.Text = a.Acompanhante;
        txtDestino.Text = a.Destino;
        txtFinalidade.Text = a.Finalidade;
        txtValor.Text = a.ValorAdiantamento.ToString();
        
        ddlTipoMoeda.SelectedValue = a.Moeda;
    }

    protected void gridAdiantamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = gridAdiantamento.SelectedIndex;
        if (index != -1)
        {
            Label lblCodigo = (Label)gridAdiantamento.SelectedRow.FindControl("lblCodigo");

            Adiantamento adiantamentoSelecionado = AdiantamentoDAO.pesquisar(int.Parse(lblCodigo.Text));
            PreencheCamposAdiantamento(adiantamentoSelecionado);
            PanelAdiantamento.Visible = true;
        }
        else
        {
            txtValor.Text = string.Empty;
            txtCodigoAdiantamento.Text = txtSaldo.Text = string.Empty;
            PanelAdiantamento.Visible = false;
        }
    }

    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        try
        {
            if (validaCampos())
            {
                Adiantamento adiantamento = AdiantamentoDAO.pesquisar(int.Parse(txtCodigoAdiantamento.Text));
                adiantamento.Status = int.Parse(ddlStatus.SelectedValue);

                #region Validacao Do Saldo
                double saldo = double.Parse(txtSaldo.Text);
                if (saldo < 0)
                {
                    lblMensagem.Text = "O valor de saldo deve ser maior ou igual a 0";
                    return;
                }
                else if (saldo > adiantamento.ValorAdiantamento)
                {
                    lblMensagem.Text = "O saldo deve ser menor ou igual ao valor do Adiantamento";
                    return;
                }
                #endregion

                adiantamento.Saldo = saldo;
                AdiantamentoDAO.atualizarAdiantamento(adiantamento);
                gridAdiantamento.DataBind();
                lblMensagem.Text = "Adiantamento atualizado com sucesso";

                try
                {
                    enviarEmail(adiantamento);
                }
                catch (Exception)
                {

                    lblMensagem.Text = "Adiantamento atualizado, mas o e-mail não foi enviado. Informe ao setor financeiro";
                }
            }
        }
        catch (Exception erro)
        {
            lblMensagem.Text = "Ocorreu um erro ao atualizar o registro";
        }
    }




    protected void btnImprimr_Click(object sender, EventArgs e)
    {
        if (txtCodigoAdiantamento.Text != string.Empty)
        {

            Page.ClientScript.RegisterStartupScript(GetType(), "ImprimirAdiantamento", "imprimirAdiantamento(" + txtCodigoAdiantamento.Text + ");", true);

        }
    }
}