<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="TodasDespesas.aspx.cs" Inherits="TodasDespesas" Title="Despesas do Funcionário" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    <table align="center" cellpadding="2" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblPesquisa" runat="server" Font-Bold="True" Text="Selecione as datas para pesquisar as despesas"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="d-flex justify-content-center">
                <asp:Label ID="LabelDataInicial" runat="server" Text="Data Inicial:"></asp:Label>
                <asp:TextBox ID="txtDataInicial" runat="server" Width="100px" CssClass="form-control form-control-sm d-flex" ClientIDMode="Static"></asp:TextBox>
                <img alt="" id="btnDataInicial" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor: pointer;" /><asp:RequiredFieldValidator ID="validaDataInicial" runat="server" ControlToValidate="txtDataInicial"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="pesquisar"></asp:RequiredFieldValidator>
                <asp:Label ID="LabelDataFinal" runat="server" Text="Data Final:"></asp:Label>
                <asp:TextBox ID="txtDataFinal" runat="server" Width="100px" CssClass="form-control form-control-sm d-flex" ClientIDMode="Static"></asp:TextBox>
                <img alt="" id="btnDataFinal" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor: pointer;" /><asp:RequiredFieldValidator ID="validaDataFinal" runat="server" ControlToValidate="txtDataFinal"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="pesquisar"></asp:RequiredFieldValidator>
                <asp:Button ID="btnPesquisar" runat="server" OnClick="btnPesquisar_Click" Text="Pesquisar"
                    ValidationGroup="pesquisar" CssClass="btn btn-sm btn-default btn-pesquisa" />

            </td>
        </tr>
        <tr>
            <td class="d-flex justify-content-center">&nbsp;</td>

        </tr>
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Text="Despesas do Funcionário"></asp:Label>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:GridView ID="gridDespesas" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" CssClass="textoGrid" DataKeyNames="Número" DataSourceID="SqlDataSourceDespesas"
        ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="gridDespesas_SelectedIndexChanging"
        AllowSorting="True" PageSize="5" EmptyDataText="Não existem despesas!" OnRowEditing="gridDespesas_RowEditing"
        Width="90%" OnDataBound="gridDespesas_DataBound"
        EnableModelValidation="True">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataRowStyle Font-Bold="True" Font-Size="13px" ForeColor="Black" Wrap="False" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnSelecionar" runat="server" CommandName="Select" ImageUrl="Imagens/Select.png"
                        ToolTip="Selecionar" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" SortExpression="Número">
                <ItemTemplate>
                    <asp:Label ID="LabelNumeroDespesa" runat="server" Text='<%# Bind("Número") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="LabelNumeroDespesa" runat="server" Text='<%# Eval("Número") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data" SortExpression="Data">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Data", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Acompanhante" SortExpression="Acompanhante">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Acompanhante") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Destino" SortExpression="Destino">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Destino") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Finalidade" SortExpression="Finalidade">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Finalidade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Moeda" SortExpression="Moeda">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Moeda") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Adiantamento" SortExpression="Adiantamento">
                <ItemTemplate>
                    <asp:Label ID="LabelAdiantamento" runat="server" Text='<%# Bind("Adiantamento", "{0:N2}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Despesas">
                <ItemTemplate>
                    <asp:Label ID="LabelTotalDespesas" runat="server"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlStatus" runat="server" Enabled="False" SelectedValue='<%# Bind("Status") %>'
                        Width="75px" Font-Size="11px">
                        <asp:ListItem Value="0">Aberto</asp:ListItem>
                        <asp:ListItem Value="1">Processo</asp:ListItem>
                        <asp:ListItem Value="2">Fechado</asp:ListItem>
                        <asp:ListItem Value="3">Devolvido</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="btnEditar" runat="server" CommandName="Edit" ImageUrl="Imagens/Edit.png"
                        ToolTip="Editar" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceDespesas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
        DeleteCommand="DELETE FROM Despesas WHERE (NumeroDespesa = @NumeroDespesa) OR (NumeroDespesa IS NULL) AND (@NumeroDespesa IS NULL)"
        InsertCommand="INSERT INTO Despesas(NumeroDespesa, EmpresaId, Data, CentroCusto, RegistroFunc, Acompanhante, Destino, Finalidade, Moeda, Adiantamento, Baixar) VALUES (@NumeroDespesa, @EmpresaId, CONVERT(datetime2, @Data, 103), @CentroCusto, @RegistroFunc, @Acompanhante, @Destino, @Finalidade, @Moeda, @Adiantamento, @Baixar)"
        ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT Despesas.NumeroDespesa AS Número, Convert(varchar, Despesas.Data, 103) AS Data, Despesas.RegistroFunc AS Funcionário, Funcionario.NomeFunc AS Nome, Empresa.NomeEmpresa AS Empresa, Despesas.CentroCusto AS [Centro Custo], Setor.Setor, Despesas.Acompanhante, Despesas.Destino, Despesas.Finalidade, Despesas.Moeda, Despesas.Adiantamento, Despesas.Status FROM Despesas INNER JOIN Empresa ON Despesas.EmpresaId = Empresa.EmpresaId INNER JOIN Funcionario ON Despesas.RegistroFunc = Funcionario.RegistroFunc INNER JOIN Setor ON Despesas.CentroCusto = Setor.CentroCusto WHERE (Despesas.RegistroFunc = @RegistroFunc) AND (Despesas.Data BETWEEN CONVERT(datetime2, @DataInicial, 103) AND CONVERT(datetime2, @DataFinal, 103)) ORDER BY Número DESC">
        <SelectParameters>
            <asp:Parameter Name="RegistroFunc" Type="Int32" />
            <asp:ControlParameter ControlID="txtDataInicial" Name="DataInicial" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtDataFinal" Name="DataFinal" PropertyName="Text" Type="Decimal" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="NumeroDespesa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NumeroDespesa" Type="Int32" />
            <asp:Parameter Name="EmpresaId" Type="Int32" />
            <asp:Parameter Name="Data" Type="DateTime" />
            <asp:Parameter Name="CentroCusto" Type="Byte" />
            <asp:Parameter Name="RegistroFunc" Type="Int16" />
            <asp:Parameter Name="Acompanhante" Type="String" />
            <asp:Parameter Name="Destino" Type="String" />
            <asp:Parameter Name="Finalidade" Type="String" />
            <asp:Parameter Name="Moeda" Type="String" />
            <asp:Parameter Name="Adiantamento" Type="Decimal" />
            <asp:Parameter Name="Baixar" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <table align="center" cellpadding="2" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblSubTitulo" runat="server" Font-Bold="True" Text="Itens da Despesa"></asp:Label>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:GridView ID="gridItemsDespesa" runat="server" AutoGenerateColumns="False" CellPadding="4"
        CssClass="textoGrid" DataSourceID="SqlDataSourceItensDespesa" ForeColor="#333333"
        GridLines="None" Width="90%" EmptyDataText="A despesa não tem itens!"
        EnableModelValidation="True">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" />
        <EmptyDataRowStyle Font-Bold="True" Font-Italic="False" Font-Size="13px" Font-Underline="False"
            ForeColor="Black" HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="ItemDespId" HeaderText="ID" InsertVisible="False" SortExpression="ItemDespId">
                <HeaderStyle Width="50px" />
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data"
                SortExpression="Data">
                <HeaderStyle Width="50px" />
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="TipoDespesa" HeaderText="Descrição da Despesa" SortExpression="TipoDespesa">
                <HeaderStyle Width="250px" />
                <ItemStyle Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="Valor" DataFormatString="{0:N2}" HeaderText="Valor" SortExpression="Valor">
                <HeaderStyle Width="50px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceItensDespesa" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
        ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM [ItemDespesa] WHERE ([NumeroDespesa] = @NumeroDespesa) ORDER BY [Data] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="gridDespesas" DefaultValue="0" Name="NumeroDespesa"
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table align="center" cellpadding="2" width="100%">
        <tr>
            <td class="fonteTitulo" align="center" width="33%">
                <asp:Label ID="lblRodapeAdiantamento" runat="server" Font-Bold="True" Text="Adiantamento:"></asp:Label>
                &nbsp;<asp:Label ID="lblTotalAdiantamento" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
            <td class="fonteTitulo" align="center" width="34%">
                <asp:Label ID="lblRodapeTotal" runat="server" Font-Bold="True" Text="Total dos itens:"></asp:Label>
                &nbsp;<asp:Label ID="lblTotalDespesas" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
            <td class="fonteTitulo" align="center" width="33%">
                <asp:Label ID="lblRodapeSaldo" runat="server" Font-Bold="True">Saldo:</asp:Label>
                <asp:Label ID="lblSaldo" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" width="100%" colspan="3" height="30">
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" CssClass="btn btn-sm btn-default" />
            </td>
        </tr>
    </table>


    <link href="Jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <script src="Jquery-ui/jquery.js"></script>
    <script src="Jquery-ui/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#txtDataInicial").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnDataInicial").click(function () {
                $("#txtDataInicial").focus();
            });

            $("#txtDataInicial").attr("autocomplete", "off");

            $("#txtDataFinal").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnDataFinal").click(function () {
                $("#txtDataFinal").focus();
            });

            $("#txtDataFinal").attr("autocomplete", "off");
        });
    </script>

</asp:Content>
