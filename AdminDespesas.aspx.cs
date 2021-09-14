using System;
using System.Web.UI.WebControls;

public partial class AdminDespesas : System.Web.UI.Page
{
    //Data inicial
    string dataInicio = "";

    //Data final
    string dataFim = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario funcionario = (Funcionario)Session["funcionario"];
        if (funcionario == null || !funcionario.AcessoAdmin)
        {
            Response.Redirect("Default.aspx");
        }

        //Se é a primeira vez, pesquisa as despesas dos últimos 30 dias
        if (!IsPostBack)
        {
            //Mês atual
            string mes = DateTime.Now.Month.ToString();
            if (mes.Length == 1)
            {
                mes = "0" + mes;
            }

            //Ano atual
            string ano = DateTime.Now.Year.ToString();

            dataInicio = "01/" + mes + "/" + ano;

            string diaFinal = DateTime.DaysInMonth(Convert.ToInt16(ano), Convert.ToInt16(mes)).ToString();

            if (diaFinal.Length == 1)
            {
                diaFinal = "0" + diaFinal;
            }

            dataFim = diaFinal + "/" + mes + "/" + ano;

            txtDataInicial.Text = dataInicio;
            txtDataFinal.Text = dataFim;
            despesasPorPeriodo(dataInicio, dataFim);
        }
    }

    private void despesasPorPeriodo(string dataInicial, string dataFinal)
    {
        SqlDataSourceDespesas.SelectParameters.Clear();
        SqlDataSourceDespesas.SelectParameters.Add("DataInicial", dataInicial);
        SqlDataSourceDespesas.SelectParameters.Add("DataFinal", dataFinal);
        SqlDataSourceDespesas.DataBind();
    }
    private void despesasPorPeriodo(string dataInicial, string dataFinal, string registroFunc)
    {
        SqlDataSourceDespesasFunc.SelectParameters.Clear();
        SqlDataSourceDespesasFunc.SelectParameters.Add("DataInicial", dataInicial);
        SqlDataSourceDespesasFunc.SelectParameters.Add("DataFinal", dataFinal);
        SqlDataSourceDespesasFunc.SelectParameters.Add("RegistroFunc", registroFunc);
        SqlDataSourceDespesasFunc.DataBind();
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void gridDespesas_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int numeroDespesa = Convert.ToInt16(((Label)gridDespesas.Rows[e.RowIndex].Cells[1].FindControl("LabelNumeroDespesa")).Text);

        DropDownList ddlStatus = (DropDownList)gridDespesas.Rows[e.RowIndex].Cells[12].FindControl("ddlStatus");

        double adiantamento = 0;
        Label lblAdiantamento = (Label)gridDespesas.Rows[e.RowIndex].Cells[6].FindControl("LabelAdiantamento");
        adiantamento = Convert.ToDouble(lblAdiantamento.Text);

        SqlDataSourceDespesas.UpdateParameters.Clear();
        SqlDataSourceDespesas.UpdateParameters.Add("Status", ddlStatus.SelectedValue);
        SqlDataSourceDespesas.UpdateParameters.Add("Adiantamento", adiantamento.ToString());
        SqlDataSourceDespesas.UpdateParameters.Add("NumeroDespesa", numeroDespesa.ToString());
        SqlDataSourceDespesas.Update();
    }
    protected void gridDespesas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //Número da despesa
        int numeroDespesa = Convert.ToInt16(((Label)gridDespesas.Rows[e.NewSelectedIndex].Cells[1].FindControl("LabelNumeroDespesa")).Text);

        //Valor total dos itens da despesa
        double totalDespesas = DespesaDAO.totalValorItensdeUmaDespesa(numeroDespesa);
        lblTotalDespesas.Text = totalDespesas.ToString("N2");

        
        Session["numeroDespesa"] = numeroDespesa;
        Page.ClientScript.RegisterStartupScript(GetType(),
                                                    "AbrirJanelaImprimir",
                                                    " abrirJanelaImprimir();",
                                                    true);
    }
    protected void btnPesquisar_Click(object sender, EventArgs e)
    {
        try
        {
            Convert.ToDateTime(txtDataInicial.Text);
            Convert.ToDateTime(txtDataFinal.Text);
        }
        catch
        {
            txtDataInicial.Text = "";
            txtDataFinal.Text = "";
            txtDataInicial.Focus();
            return;
        }

        if (gridFuncionarios.SelectedValue != null)
        {
            despesasPorPeriodo(txtDataInicial.Text, txtDataFinal.Text, gridFuncionarios.SelectedValue.ToString());
        }
        else
        {
            gridDespesas.DataSourceID = "SqlDataSourceDespesas";
            despesasPorPeriodo(txtDataInicial.Text, txtDataFinal.Text);
        }
    }
   

    protected void gridDespesas_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow linha in gridDespesas.Rows)
        {
            DropDownList ddlStatus = (DropDownList)linha.FindControl("ddlStatus");
            if (ddlStatus.Text.Equals("2"))
            {
                ((ImageButton)linha.FindControl("btnEditar")).Visible = false;
            }
            
            //Número da despesa
            Label LabelNumeroDespesa = (Label)linha.FindControl("LabelNumeroDespesa");
            int numeroDespesa = Convert.ToInt16(LabelNumeroDespesa.Text);

            //Valor total dos itens da despesa
            double totalDespesas = DespesaDAO.totalValorItensdeUmaDespesa(numeroDespesa);

            //Label de total das despesas
            Label LabelTotalDespesas = (Label)linha.FindControl("LabelTotalDespesas");
            LabelTotalDespesas.Text = totalDespesas.ToString("N2");
        }
    }

    protected void ButtonPesquisar_Click(object sender, EventArgs e)
    {
        gridFuncionarios.DataBind();
        gridFuncionarios.Visible = true;
        gridFuncionarios.SelectedIndex = -1;
    }

    protected void gridFuncionarios_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string dataInicio, dataFim;
        int registroFuncionario = Convert.ToInt16(((Label)gridFuncionarios.Rows[e.NewSelectedIndex].Cells[0].FindControl("lblRegistro")).Text);
        try
        {
            Convert.ToDateTime(txtDataInicial.Text);
            Convert.ToDateTime(txtDataFinal.Text);

            dataInicio = txtDataInicial.Text;
            dataFim = txtDataFinal.Text;
        }
        catch
        {
            string mes = DateTime.Now.Month.ToString();
            if (mes.Length == 1)
            {
                mes = "0" + mes;
            }

            //Ano atual
            string ano = DateTime.Now.Year.ToString();

            dataInicio = "01/" + mes + "/" + ano;

            string diaFinal = DateTime.DaysInMonth(Convert.ToInt16(ano), Convert.ToInt16(mes)).ToString();

            if (diaFinal.Length == 1)
            {
                diaFinal = "0" + diaFinal;
            }

            dataFim = diaFinal + "/" + mes + "/" + ano;

            txtDataInicial.Text = dataInicio;
            txtDataFinal.Text = dataFim;
        }

        gridDespesas.DataSourceID = "SqlDataSourceDespesasFunc";
        despesasPorPeriodo(dataInicio, dataFim, registroFuncionario.ToString());
    }

    protected void btnNumeroDespesa_Click(object sender, EventArgs e)
    {
        try
        {
            int numeroDespesa = Convert.ToInt32(txtNumeroDespesa.Text);

            gridDespesas.DataSourceID = "SqlDataSourceDespesasNumero";
            SqlDataSourceDespesasNumero.SelectParameters.Clear();
            SqlDataSourceDespesasNumero.SelectParameters.Add("NumeroDespesa", numeroDespesa.ToString());
            SqlDataSourceDespesasNumero.DataBind();
        }
        catch
        {
            
        }
    }
}