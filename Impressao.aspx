<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Impressao.aspx.cs" Inherits="Impressao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Impressão</title>
    <style type="text/css">
        .titulo
        {
            font-size: 20px;
            font-family: Segoe UI;
            font-weight: bold;
        }
        .texto
        {
            font-size: 16px;
            font-family: Segoe UI;
        }
    </style>
</head>
<body onload="window.print();">
    <form id="form1" runat="server">
    <div>
        <table align="center" cellpadding="4" width="700px" border="1" 
            bordercolor="Black" cellspacing="0">
            <tr>
                <td align="center" colspan="2">
                    <img alt="" src="Imagens/cabecalho.png" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:GridView ID="gridDespesa" runat="server" CssClass="texto" AutoGenerateColumns="False"
                        BorderStyle="None" BorderWidth="0px" DataSourceID="AccessDataSourceDespesa" OnDataBound="gridDespesa_DataBound"
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="NomeFunc" HeaderText="NomeFunc" SortExpression="NomeFunc" />
                            <asp:BoundField DataField="Agencia" HeaderText="Agencia" SortExpression="Agencia" />
                            <asp:BoundField DataField="Banco" HeaderText="Banco" SortExpression="Banco" />
                            <asp:BoundField DataField="ContaCorrente" HeaderText="ContaCorrente" SortExpression="ContaCorrente" />
                            <asp:BoundField DataField="Setor" HeaderText="Setor" SortExpression="Setor" />
                            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="AccessDataSourceDespesa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConexaoOleDB %>" 
                        ProviderName="<%$ ConnectionStrings:ConexaoOleDB.ProviderName %>" 
                        SelectCommand="SELECT Funcionario.NomeFunc, Funcionario.Agencia, Funcionario.Banco, Funcionario.ContaCorrente, Setor.Setor, Despesas.Data FROM ((Funcionario INNER JOIN Despesas ON Funcionario.RegistroFunc = Despesas.RegistroFunc) INNER JOIN Setor ON Setor.CentroCusto = Despesas.CentroCusto) WHERE (Despesas.NumeroDespesa = ?)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="@numero" SessionField="numero" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="40">
                    <asp:Label ID="Label1" runat="server" Text="Descrição das Despesas de Viagem"
                        CssClass="titulo"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text=" - Número:" CssClass="titulo" 
                        Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblNumero" runat="server" CssClass="titulo" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Data:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblData" runat="server" CssClass="texto"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label10" runat="server" Text="Centro de Custo:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblCentroCusto" runat="server" CssClass="texto"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Nome:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblNome" runat="server" CssClass="texto"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label11" runat="server" Text="Banco:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblBanco" runat="server" CssClass="texto"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Acompanhante:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblAcompanhante" runat="server" CssClass="texto"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label12" runat="server" Text="Agência:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblAgencia" runat="server" CssClass="texto"></asp:Label>
                    <asp:Label ID="lblContaCorrente" runat="server" Text="C/C:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblCC" runat="server" CssClass="texto"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Destino:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblDestino" runat="server" CssClass="texto"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label7" runat="server" Text="Finalidade:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblFinalidade" runat="server" CssClass="texto"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;
                    <asp:Label ID="Label8" runat="server" Text="Moeda:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblMoeda" runat="server" CssClass="texto"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Adiantamento:" CssClass="texto" Font-Bold="True"></asp:Label>
                    <asp:Label ID="lblAdiantamento" runat="server" CssClass="texto"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:GridView ID="gridDespesas" runat="server" CssClass="texto" AutoGenerateColumns="False"
                        BorderStyle="None" BorderWidth="1px" DataSourceID="AccessDataSourceItensDespesa"
                        OnDataBound="gridDespesas_DataBound" Width="100%" BackColor="White" 
                        BorderColor="#CCCCCC" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="ItemDespId" HeaderText="ItemDespId" InsertVisible="False"
                                SortExpression="ItemDespId" Visible="False" />
                            <asp:BoundField DataField="NumeroDespesa" HeaderText="NumeroDespesa" SortExpression="NumeroDespesa"
                                Visible="False" />
                            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data"
                                SortExpression="Data">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TipoDespesa" HeaderText="Despesa" SortExpression="TipoDespesa">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Valor" DataFormatString="{0:f}" HeaderText="Valor" SortExpression="Valor">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="AccessDataSourceItensDespesa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConexaoOleDB %>" 
                        ProviderName="<%$ ConnectionStrings:ConexaoOleDB.ProviderName %>" 
                        SelectCommand="SELECT * FROM [ItemDespesa] WHERE ([NumeroDespesa] = ?) ORDER BY [Data]">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="NumeroDespesa" 
                                SessionField="numero" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td height="60" align="center">
                    &nbsp;
                    <asp:Label ID="lblTotal" runat="server" Text="Total das despesas:" CssClass="texto"
                        Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="lblTotalDespesas" runat="server" CssClass="texto" 
                        Font-Bold="True"></asp:Label>
                </td>
                <td height="20" align="center">
                    <asp:Label ID="lblSaldoDevolverReceber" runat="server" Text="Saldo a receber ou (devolver):"
                        CssClass="texto" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="lblSaldo" runat="server" CssClass="texto" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="30">
                    <asp:Label ID="lblAssinaturas" runat="server" Text="Assinaturas" CssClass="texto"
                        Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" height="80" valign="middle" width="50%">
                    _______________________________<br />
                    <asp:Label ID="Label13" runat="server" Text="Funcionário" CssClass="texto"></asp:Label>
                </td>
                <td align="center" height="80" valign="middle" width="50%">
                    _______________________________<br />
                    <asp:Label ID="Label14" runat="server" Text="Chefe" CssClass="texto"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
