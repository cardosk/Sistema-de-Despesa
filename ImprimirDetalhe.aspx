<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimirDetalhe.aspx.cs"
    Inherits="ImprimirDetalhe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imprimir Despesa</title>
    <link href="Estilo.css" rel="stylesheet" type="text/css" />

    <script language="javascript">
        function imprimir() {
            window.print();
        }
    </script>

</head>
<body onload="imprimir()" style="font-family: Segoe UI; font-size: 12px;">
    <form id="form" runat="server">
    <div>
        <table align="center" height="100%" cellpadding="4" cellspacing="0" border="1" width="650">
            <tr>
                <td align="center" height="100%" width="800px">
                    <asp:Label ID="lblEmpresa" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Comprovação Detalhada Despesas de Viagem"
                        Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" height="100%" width="800px">
                    <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Número:"></asp:Label>
                    <asp:Label ID="lblNumero" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Data:"></asp:Label>
                    <asp:Label ID="lblData" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" height="100%" width="800px">
                    &nbsp;<asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Nome:"></asp:Label>
                    <asp:Label ID="lblNome" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Registro:"></asp:Label>
                    <asp:Label ID="lblRegistro" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelCpf" runat="server" Font-Bold="True" Text="CPF:"></asp:Label>
                    <asp:Label ID="lblCPF" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelCentroCusto" runat="server" Font-Bold="True" Text="Centro Custo:"></asp:Label>
                    <asp:Label ID="lblCentroCusto" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" height="100%" width="800px">
                    <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Banco:"></asp:Label>
                    <asp:Label ID="lblBanco" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Agência:"></asp:Label>
                    <asp:Label ID="lblAgencia" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Conta Corrente:"></asp:Label>
                    <asp:Label ID="lblContaCorrente" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" height="100%" width="800px">
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Destino:"></asp:Label>
                    <asp:Label ID="lblDestino" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Acompanhante:"></asp:Label>
                    <asp:Label ID="lblAcompanhante" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Finalidade:"></asp:Label>
                    <asp:Label ID="lblFinalidade" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" width="800px" height="100%">
                    <asp:Label ID="Label8" runat="server" Text="Discriminação:" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" width="800px" height="100%">
                    <asp:GridView ID="GridViewDespesas" runat="server" CellPadding="4" CssClass="textoGrid"
                        ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceDespesas" PageSize="12">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EmptyDataRowStyle Font-Bold="True" Font-Size="15px" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="Ordem" HeaderText="Ordem">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
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
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
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
                        SelectCommand="SELECT DISTINCT ID.ItemDespId, ID.Data, ID.TipoDespesa, ID.Valor, TD.Ordem FROM ItemDespesa AS ID INNER JOIN TipoDespesa AS TD ON TD.TipoDespesa = ID.TipoDespesa WHERE ID.NumeroDespesa = @NumeroDespesa ORDER BY TD.Ordem ASC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblNumero" DefaultValue="0" Name="NumeroDespesa"
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center" width="800px" height="100%">
                    <table width="100%">
                        <tr>
                            <td align="left" width="35%">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Adiantamento:"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblAdiantamento" runat="server" Font-Bold="True">0,00</asp:Label>
                            </td>
                            <td align="right" width="35%">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Total Despesas:"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblTotalDespesas" runat="server" Font-Bold="True">0,00</asp:Label>
                            </td>
                            <td align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Saldo a Receber:"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblSaldoReceber" runat="server" Font-Bold="True">0,00</asp:Label>
                            </td>
                            <td align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Saldo a Devolver:"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblSaldoDevolver" runat="server" Font-Bold="True">0,00</asp:Label>
                            </td>
                            <td align="right">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
