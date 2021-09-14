<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="FrmLancamentos.aspx.cs" Inherits="FrmLancamentos" Title="Lançamentos" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 223px;
        }
        .auto-style3 {
            width: 35%;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    <script type="text/javascript">
        function button_click(objTextBox, objBtnID) {
            if (window.event.keyCode == 13) {
                document.getElementById(objBtnID).focus();
                document.getElementById(objBtnID).click();
            }
        }

        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Deseja excluir o lançamento?")) {
                confirm_value.value = "Sim";
            } else {
                confirm_value.value = "Não";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

    <table align="center" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblDadosLancamento" runat="server" Font-Bold="True"
                    Text="Dados do Lançamento"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" cellpadding="4" cellspacing="0" width="100%">
                    <tr class="linhaAlternativa">
                        <td class="auto-style3"></td>
                        <td align="left" class="auto-style1" style="width:10%">
                            <asp:Label ID="Label12" runat="server" Text="Data:"></asp:Label>
                        </td>
                        <td align="left" class="linhaAlternativa d-flex justify-content-start">
                            <asp:TextBox ID="txtData" runat="server" Width="100px" Font-Bold="True" CssClass="form-control form-control-sm d-flex" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnData" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaData" runat="server" ControlToValidate="txtData"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width:20%;"></td>
                    </tr>
                    
                    <tr>
                        <td class="auto-style3"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="label13" runat="server" Text="Conta:"></asp:Label>
                        </td>
                        <td align="left" class="d-flex justify-content-start">
                            <asp:DropDownList ID="ddlConta" runat="server" Width="400px" DataSourceID="SqlDataSourceConta"
                                DataTextField="descricao" DataValueField="numconta" AutoPostBack="true" OnSelectedIndexChanged="ddlConta_SelectedIndexChanged" CssClass="form-control form-control-sm d-flex">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="validaConta" runat="server" ControlToValidate="ddlConta"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSourceConta" runat="server" ConnectionString="<%$ ConnectionStrings:ConexaoPosicaoFinanceira %>"
                                ProviderName="<%$ ConnectionStrings:ConexaoPosicaoFinanceira.ProviderName %>" SelectCommand="SELECT numconta, cast(numconta + ' - ' + banco_conta as varchar) as descricao FROM [VW_ContaCorrente] ORDER BY [banco_conta]"></asp:SqlDataSource>
                        </td>
                        <td></td>
                    </tr>

                    <tr class="linhaAlternativa">
                        <td class="auto-style3"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="label1" runat="server" Text="Categoria:"></asp:Label>
                        </td>
                        <td align="left" class="linhaAlternativa d-flex justify-content-start">
                            <asp:DropDownList ID="ddlCategoria" runat="server" Width="300px" DataSourceID="SqlDataSourceCategoria"
                                DataTextField="categoria" DataValueField="codigo" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control form-control-sm d-flex">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="validaCategoria" runat="server" ControlToValidate="ddlCategoria"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSourceCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:ConexaoPosicaoFinanceira %>"
                                ProviderName="<%$ ConnectionStrings:ConexaoPosicaoFinanceira.ProviderName %>" SelectCommand="SELECT codigo, categoria FROM [Categoria] ORDER BY [categoria]"></asp:SqlDataSource>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="label2" runat="server" Text="Tipo:"></asp:Label>
                        </td>
                        <td align="left" class="d-flex justify-content-start">
                            <asp:DropDownList ID="ddlTipo" runat="server" Width="300px" DataSourceID="SqlDataSourceTipo"
                                DataTextField="tipo" DataValueField="codigo" CssClass="form-control form-control-sm d-flex">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="validaTipo" runat="server" ControlToValidate="ddlTipo"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSourceTipo" runat="server" ConnectionString="<%$ ConnectionStrings:ConexaoPosicaoFinanceira %>"
                                ProviderName="<%$ ConnectionStrings:ConexaoPosicaoFinanceira.ProviderName %>" SelectCommand="SELECT codigo, tipo, categoria FROM Tipo WHERE (categoria = @categoria) ORDER BY tipo">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCategoria" Name="categoria" PropertyName="SelectedValue" DefaultValue="0" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td></td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td class="auto-style3"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="Label5" runat="server" CssClass="texto" Text="Valor:"></asp:Label>
                        </td>
                        <td align="left" class="linhaAlternativa d-flex justify-content-start">
                            <asp:TextBox ID="txtValorLancamento" runat="server" Width="197px"
                                MaxLength="50" AutoPostBack="false" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaValorLancamento" runat="server" ControlToValidate="txtValorLancamento"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td></td>
                        <td align="left">
                            <asp:Button ID="btnLancar" runat="server" Text="Lançar"
                                ValidationGroup="lancar" OnClick="btnLancar_Click" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar"
                                ValidationGroup="lancar" OnClick="btnAtualizar_Click" Visible="false" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar"
                                CausesValidation="False" OnClick="btnVoltar_Click" CssClass="btn btn-sm btn-default" />
                            <br />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" class="linhaAlternativa">
                <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small"
                    ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <table align="center" cellpadding="2" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Text="Lançamentos da conta"></asp:Label>
            </td>
        </tr>
    </table>
    <div align="center"> 
        <asp:GridView ID="gridLancamentos" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" CssClass="texto" DataKeyNames="ID" DataSourceID="SqlDataSourceLancamentos"
        Font-Size="11px" ForeColor="#333333" GridLines="None"
        AllowSorting="True"
        PageSize="5" EmptyDataText="Não existem lançamentos!" Width="98%" OnDataBound="gridLancamentos_DataBound" OnSelectedIndexChanging="gridLancamentos_SelectedIndexChanging" OnRowDeleting="gridLancamentos_RowDeleting">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle Font-Bold="True" Font-Size="13px" ForeColor="Black" />
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:TemplateField HeaderText="ID" SortExpression="ID" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data" SortExpression="Data">
                <ItemTemplate>
                    <asp:Label ID="lblData" runat="server" Text='<%# Bind("Data", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Banco" SortExpression="Banco">
                <ItemTemplate>
                    <asp:Label ID="lblBanco" runat="server" Text='<%# Bind("Banco") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Conta" SortExpression="Conta">
                <ItemTemplate>
                    <asp:Label ID="lblConta" runat="server" Text='<%# Bind("Conta") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                <ItemTemplate>
                    <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                <ItemTemplate>
                    <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor" SortExpression="Valor">
                <ItemTemplate>
                    <asp:Label ID="lblValor" runat="server" Text='<%# Bind("Valor", "{0:N2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnSelecionar" runat="server" CommandName="Select" ImageUrl="Imagens/Edit.png"
                        ToolTip="Selecionar" CausesValidation="False" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btnExcluir" runat="server" CommandName="Delete" ImageUrl="Imagens/Delete.png"
                        ToolTip="Excluir" CausesValidation="False" OnClientClick="Confirm()" />
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
    <asp:SqlDataSource ID="SqlDataSourceLancamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ConexaoPosicaoFinanceira %>"
        ProviderName="<%$ ConnectionStrings:ConexaoPosicaoFinanceira.ProviderName %>" SelectCommand="select L.id, L.[data] as 'Data', CO.banco_conta as 'Banco', CO.numconta as 'Conta', CA.categoria as 'Categoria', T.tipo as 'Tipo', L.valor as 'Valor' from Lancamentos L left outer join Tipo T on T.codigo = L.tipo left outer join Categoria CA on CA.codigo = T.categoria left outer join VW_ContaCorrente CO on CO.numconta = L.conta WHERE (CO.numconta = @conta) AND (L.[data] = @data) ORDER BY [Data] DESC" DeleteCommand="delete Lancamentos where id = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlConta" Name="conta" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtData" Name="data" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>


    <link href="Jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <script src="Jquery-ui/jquery.js"></script>
    <script src="Jquery-ui/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#txtData").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnData").click(function () {
                $("#txtData").focus();
            });

            $("#txtData").attr("autocomplete","off");
        });
    </script>


</asp:Content>
