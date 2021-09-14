using System;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void btnSair_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["funcionario"] != null)
        {
            LabelMensagem.Text = "Bem-Vindo, " + (Session["funcionario"] as Funcionario).NomeFunc;
        }
    }

    public void ExibirLabelNome()
    {
        
    }
}