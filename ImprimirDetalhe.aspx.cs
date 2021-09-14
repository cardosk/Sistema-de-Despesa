using System;
using System.Web.UI.WebControls;
using System.Web;

public partial class ImprimirDetalhe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario func = (Funcionario)Session["funcionario"];
        if (func == null)
        {
            Response.Redirect("Default.aspx");
        }

        //Recupera o número da despesa
        int numeroDespesa = 0;
        try
        {
            numeroDespesa = Convert.ToInt32(Session["numeroDespesa"].ToString());
        }
        catch
        {
        }
        lblNumero.Text = numeroDespesa.ToString();

        //Dados da despesa
        Despesa despesa = new Despesa();
        Funcionario funcionario = new Funcionario();
        if (numeroDespesa > 0)
        {
            despesa = DespesaDAO.pesquisar(numeroDespesa);
            if (despesa != null)
            {
                lblAcompanhante.Text = despesa.Acompanhante;
                lblData.Text = despesa.Data.Substring(0, 10);
                lblDestino.Text = despesa.Destino;
                lblAcompanhante.Text = despesa.Acompanhante;
                lblFinalidade.Text = despesa.Finalidade;
                lblAdiantamento.Text = despesa.Adiantamento.ToString("N2");

                //Dados do funcionário
                funcionario = FuncionarioDAO.pesquisar(despesa.RegistroFunc);
                if (funcionario != null)
                {
                    //lblEmpresa.Text = funcionario.Empresa;
                    lblEmpresa.Text = AuxiliarDAO.pesquisarEmpresa(funcionario.Empresa);

                    lblNome.Text = funcionario.NomeFunc;
                    lblCPF.Text = funcionario.CPF;
                    lblCentroCusto.Text = AuxiliarDAO.buscarCustoExibicao(funcionario.CentroCusto);
                    lblBanco.Text = AuxiliarDAO.pesquisarBanco(funcionario.Banco);
                    lblAgencia.Text = funcionario.Agencia;
                    lblContaCorrente.Text = funcionario.ContaCorrente;
                    lblRegistro.Text = funcionario.RegistroFunc.ToString();
                }

                double totalDespesas = DespesaDAO.totalValorItensdeUmaDespesa(numeroDespesa);
                lblTotalDespesas.Text = String.Format("{0:N}", totalDespesas);

                double saldo = totalDespesas - despesa.Adiantamento;

                //Se saldo positivo, então receber
                if (saldo > 0)
                {
                    lblSaldoDevolver.Text = String.Format("{0:N}", "0,00");
                    lblSaldoReceber.Text = String.Format("{0:N}", saldo);
                }
                else if (saldo < 0)
                {
                    lblSaldoDevolver.Text = String.Format("{0:N}", saldo * -1);
                    lblSaldoReceber.Text = String.Format("{0:N}", "0,00");
                }
                else
                {
                    lblSaldoDevolver.Text = String.Format("{0:N}", "0,00");
                    lblSaldoReceber.Text = String.Format("{0:N}", "0,00");
                }
            }
        }
    }
}