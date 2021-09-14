using System;
using System.Web;
using System.Web.UI.WebControls;

public partial class Impressao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gridDespesa.Visible = true;

        HttpContext context = HttpContext.Current;

        //try
        //{
        lblNumero.Text = context.Items["numero"].ToString();
        lblData.Text = context.Items["data"].ToString();
        lblCentroCusto.Text = context.Items["centroCusto"].ToString();
        lblNome.Text = context.Items["nome"].ToString();
        lblAcompanhante.Text = context.Items["acompanhante"].ToString();
        lblDestino.Text = context.Items["destino"].ToString();
        lblFinalidade.Text = context.Items["finalidade"].ToString();
        lblMoeda.Text = context.Items["moeda"].ToString();
        lblAdiantamento.Text = String.Format("{0:N}", Convert.ToDecimal(context.Items["adiantamento"].ToString()));
        //}
        //catch
        //{

        //}
        Session["numero"] = lblNumero.Text;
    }

    protected void calcularTotal()
    {
        decimal total = 0;
        decimal subtotal = 0;
        decimal saldo = 0;
        decimal saldoFinal = 0;

        foreach (GridViewRow linha in gridDespesas.Rows)
        {
            subtotal = decimal.Parse(linha.Cells[4].Text);
            total += subtotal;
        }
        lblTotalDespesas.Text = total.ToString();

        //Saldo
        saldo = Convert.ToDecimal(lblAdiantamento.Text);
        saldoFinal = saldo - total;

        //Se o adiantamento maior que o total
        if (saldo > total)
        {
            lblSaldo.Text = "(" + saldoFinal.ToString() + ")";
        }
        else
        {
            lblSaldo.Text = (saldoFinal * -1).ToString();
        }
    }

    protected void gridDespesas_DataBound(object sender, EventArgs e)
    {
        calcularTotal();
    }
    protected void gridDespesa_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow linha in gridDespesa.Rows)
        {
            lblNome.Text = linha.Cells[0].Text;
            lblAgencia.Text = linha.Cells[1].Text;
            lblBanco.Text = linha.Cells[2].Text;
            lblCC.Text = linha.Cells[3].Text;
            lblCentroCusto.Text = linha.Cells[4].Text;
        }
        gridDespesa.Visible = false;
    }
}