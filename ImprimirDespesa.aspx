<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimirDespesa.aspx.cs"
    Inherits="ImprimirDespesa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imprimir Despesa</title>
    <link href="Estilo.css" rel="stylesheet" type="text/css" />

</head>
<body style="font-family: Segoe UI; font-size: 12px;">
    <form id="form" runat="server">
        <div>
            <table align="center" width="1000" height="100%" cellpadding="0" cellspacing="0"
                style="border-style: solid; border-width: 1px; border-color: #888888; padding: 0px; margin: 0px; height: 100%; width: 1200px; border-spacing: 0px;"
                border="0">
                <tr>
                    <td align="center" colspan="2" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888"
                        height="40">
                        <asp:Label ID="lblEmpresa" runat="server" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Comprovação Despesas de Viagem" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888"
                        height="20">
                        <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Número:"></asp:Label>
                        <asp:Label ID="lblNumero" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Data:"></asp:Label>
                        <asp:Label ID="lblData" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Nome:"></asp:Label>
                        <asp:Label ID="lblNome" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelRegistro" runat="server" Font-Bold="True" Text="Registro:"></asp:Label>
                        <asp:Label ID="lblRegistro" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelCpf" runat="server" Font-Bold="True" Text="CPF:"></asp:Label>
                        <asp:Label ID="lblCPF" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelCentroCusto" runat="server" Font-Bold="True" Text="Centro Custo:"></asp:Label>
                        <asp:Label ID="lblCentroCusto" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabelCodAX" runat="server" Font-Bold="True" Text="Cód. AX:"></asp:Label>
                        <asp:Label ID="lblCodAX" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabelGrupo" runat="server" Font-Bold="True" Text="Grupo:"></asp:Label>
                        <asp:Label ID="lblGrupo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888"
                        height="20">
                        <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Banco:"></asp:Label>
                        <asp:Label ID="lblBanco" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Agência:"></asp:Label>
                        <asp:Label ID="lblAgencia" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Conta Corrente:"></asp:Label>
                        <asp:Label ID="lblContaCorrente" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Tipo de Conta:"></asp:Label>
                        <asp:Label ID="lblTipoConta" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888"
                        height="20">
                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Destino:"></asp:Label>
                        <asp:Label ID="lblDestino" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Acompanhante:"></asp:Label>
                        <asp:Label ID="lblAcompanhante" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Finalidade:"></asp:Label>
                        <asp:Label ID="lblFinalidade" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="MB:"></asp:Label>
                        <asp:Label ID="lblMB" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp; <strong>Moeda</strong>:<asp:Label ID="lblMoeda" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="33%" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888; border-right-style: solid;"
                        height="20">
                        <asp:Label ID="Label8" runat="server" Text="Discriminação:" Font-Bold="True"></asp:Label>
                    </td>
                    <td valign="middle" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888; border-right-style: solid;">
                        <asp:Label ID="Label12" runat="server" Text="Dia/Mês -&gt;" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="border-width: 1px; border-color: #888888; padding: 0px; margin: 0px; border-bottom-style: solid;">
                        <asp:DataList ID="dlDespesaDatas" runat="server" DataSourceID="SqlDataSourceDespesaDatas"
                            RepeatColumns="10" RepeatDirection="Horizontal" Font-Bold="True" CellPadding="0"
                            Height="100%" BorderStyle="None" OnItemDataBound="dlDespesaDatas_ItemDataBound">
                            <ItemTemplate>
                                <table cellpadding="2" cellspacing="0" style="border-style: solid; padding: 0px; margin: 0px; border-width: 1px; border-color: #888888; height: 100%; width: 68px; border-spacing: 0px;">
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="Data" runat="server" Text='<%# Eval("Data", "{0:dd/MM}") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourceDespesaDatas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                            ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT Data, SUM(Valor) AS Expr1 FROM ItemDespesa WHERE (NumeroDespesa = @numeroDespesa) GROUP BY Data ORDER BY Data">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="numeroDespesa" SessionField="numeroDespesa" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding: 0px; margin: 0px;">
                        <asp:DataList ID="dlCategoriasDespesas" runat="server" DataKeyField="Codigo" DataSourceID="SqlDataSourceCategoriasDespesas" Width="100%" CellPadding="0"
                            Height="100%">
                            <ItemTemplate>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" width="150" style="padding: 0px; margin: 0px; border-bottom-style: solid; border-width: 1px; border-color: #888888; border-right-style: solid;">
                                            <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' Visible="False" />
                                            <asp:Label ID="NomeCategoriaLabel" runat="server" Text='<%# Eval("NomeCategoria") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourceCategoriasDespesas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                            ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [CategoriasDespesas] ORDER BY [Ordem]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="border-width: 1px; border-color: #888888; padding: 0px; margin: 0px; border-right-style: solid;">
                        <asp:Label ID="Label13" runat="server" Text="Subtotal:" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="padding: 0px; margin: 0px;">
                        <asp:DataList ID="dlDespesaSubTotais" runat="server" DataSourceID="SqlDataSourceDespesaSubTotais"
                            RepeatColumns="10" RepeatDirection="Horizontal" Font-Bold="True" CellPadding="0"
                            BorderStyle="None" Height="100%" OnItemDataBound="dlDespesaSubTotais_ItemDataBound">
                            <ItemTemplate>
                                <table cellpadding="2" cellspacing="0" style="border-style: solid; padding: 0px; margin: 0px; border-width: 1px; border-color: #888888; height: 100%; width: 68px;">
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="SubTotal" runat="server" Text='<%# Eval("SubTotal", "{0:F}") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourceDespesaSubTotais" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                            ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT Data, SUM(Valor) as SubTotal FROM ItemDespesa WHERE NumeroDespesa = @numeroDespesa GROUP BY Data ORDER BY Data ASC">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="numeroDespesa" SessionField="numeroDespesa" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" height="50">
                        <table width="100%">
                            <tr>
                                <td align="center" rowspan="4" width="320px" style="padding: 0px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Assinatura:"></asp:Label>
                                    <asp:Label ID="lblData0" runat="server">________________________</asp:Label>
                                </td>
                                <td align="center" rowspan="4" width="320px" style="padding: 0px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Visto Chefe:"></asp:Label>
                                    <asp:Label ID="lblData1" runat="server">________________________</asp:Label>
                                </td>
                                <td align="center" rowspan="4" width="20%" style="padding: 0px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Aprovado:"></asp:Label>
                                    <asp:Label ID="lblData2" runat="server">________________________</asp:Label>
                                </td>
                                <td align="left" width="110" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Adiantamento:"></asp:Label>
                                </td>
                                <td align="right" width="80" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid;">
                                    <asp:Label ID="lblAdiantamento" runat="server" Font-Bold="True">0,00</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Total Despesas:"></asp:Label>
                                </td>
                                <td align="right" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid;"
                                    width="80">
                                    <asp:Label ID="lblTotalDespesas" runat="server" Font-Bold="True">0,00</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Saldo a Receber:"></asp:Label>
                                </td>
                                <td align="right" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid;"
                                    width="80">
                                    <asp:Label ID="lblSaldoReceber" runat="server" Font-Bold="True">0,00</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid; border-right-style: solid;">
                                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Saldo a Devolver:"></asp:Label>
                                </td>
                                <td align="right" style="padding: 2px; margin: 0px; border-width: 1px; border-color: #888888; border-top-style: solid;"
                                    width="80">
                                    <asp:Label ID="lblSaldoDevolver" runat="server" Font-Bold="True">0,00</asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />

        <asp:GridView ID="GridViewDespesasFinal" runat="server"
            CellPadding="4" CssClass="textoGrid"
            ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False"
            DataSourceID="SqlDataSourceDespesas" PageSize="12"
            EnableModelValidation="True"
            OnRowDataBound="GridViewDespesas_RowDataBound" Visible="False">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EmptyDataRowStyle Font-Bold="True" Font-Size="15px" ForeColor="Black" />
            <Columns>
                <asp:TemplateField HeaderText="Ordem">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Ordem") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelOrdem" runat="server" Text='<%# Bind("Ordem") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data" SortExpression="Data">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Data") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabeL" runat="server"
                            Text='<%# Bind("Data", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Despesa" SortExpression="TipoDespesa">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TipoDespesa") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDespesa" runat="server" Text='<%# Bind("TipoDespesa") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Valor" SortExpression="Valor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Valor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblValor" runat="server" Text='<%# Bind("Valor", "{0:f}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDespesas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
            DeleteCommand="DELETE FROM ItemDespesa WHERE ItemDespId=@ItemDespId" ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>"
            SelectCommand="SELECT DISTINCT ID.ItemDespId, ID.Data, ID.TipoDespesa, ID.Valor, TD.Ordem FROM ItemDespesa AS ID INNER JOIN TipoDespesa AS TD ON TD.TipoDespesa = ID.TipoDespesa WHERE (ID.NumeroDespesa = @NumeroDespesa) ORDER BY ID.Data">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblNumero" DefaultValue="0" Name="NumeroDespesa"
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
