<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LancarAdiantamento.aspx.cs" Inherits="LancarAdiantamento" Title="Lançar Adiantamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 167px;
        }
        .auto-style2 {
            width: 35%
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Deseja lançar o adiantamento?")) {
                confirm_value.value = "Sim";
            } else {
                confirm_value.value = "Não";
            }
            document.forms[0].appendChild(confirm_value);
        }

        function abrirJanelaImprimir() {
            window.open('ImprimirAdiantamento.aspx', '_blank');
        }

        function imprimirAdiantamento(codigo) {
            window.open('Relatorios/Adiantamento' + codigo + '.pdf', '_blank');
        }
    </script>

    <table align="center" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblLancarAdiantamento" runat="server" Font-Bold="True"
                    Text="Dados do Adiantamento"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" cellpadding="4" cellspacing="0" width="100%">
                    <tr>
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="Label4" runat="server" CssClass="texto" Text="Data da Viagem"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtDataViagem" runat="server" CausesValidation="True" MaxLength="10"
                                Width="120px" CssClass="form-control form-control-sm d-inline" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnCalendario" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaDataViagem" runat="server" ControlToValidate="txtDataViagem"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width:15%;"></td>
                    </tr>

                    <tr class="linhaAlternativa">
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="Label6" runat="server" CssClass="texto" Text="Cliente:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtCliente" runat="server" Width="300px" CausesValidation="True" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaCliente" runat="server" ControlToValidate="txtCliente"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="labelAcompanhante" runat="server" Text="Acompanhante:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtAcompanhante" runat="server" CausesValidation="True" MaxLength="50"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaAcompanhante" runat="server" ControlToValidate="txtAcompanhante"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="labelDestino" runat="server" Text="Destino:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtDestino" runat="server" CausesValidation="True" MaxLength="50"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaDestino" runat="server" ControlToValidate="txtDestino"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="labelFinalidade" runat="server" Text="Finalidade:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtFinalidade" runat="server" CausesValidation="true" MaxLength="200"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaFinalidade" runat="server" ControlToValidate="txtFinalidade"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="Label5" runat="server" CssClass="texto" Text="Valor:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="txtValorAdiantamento" runat="server" Width="120px"
                                MaxLength="8" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaValorAdiantamento" runat="server" ControlToValidate="txtValorAdiantamento"
                                ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                ValidationGroup="lancar"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="lblMoeda" runat="server" CssClass="texto" Text="Moeda:"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:DropDownList ID="ddlTipoMoeda" runat="server" Width="120px" DataSourceID="SqlDataSourceTiposMoeda"
                                DataTextField="Moeda" DataValueField="Moeda" CssClass="form-control form-control-sm d-inline">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceTiposMoeda" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT [Ordem], [Moeda] FROM [Moeda] ORDER BY [Ordem]"></asp:SqlDataSource>
                        </td>
                        <td></td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td></td>
                        <td></td>
                        <td  align="left" >
                            <asp:Button ID="btnLancar" runat="server" Text="Solicitar" OnClick="btnLancar_Click" OnClientClick="Confirm()"
                                ValidationGroup="lancar" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click"
                                CausesValidation="False" CssClass="btn btn-sm btn-default" />
                            <br />
                        </td>
                        <td></td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small"
                    ForeColor="Red"></asp:Label>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Timer ID="MyTimer" runat="server" Interval="5000" OnTick="MyTimer_Tick">
                </asp:Timer>
            </td>
        </tr>
    </table>


    <link href="Jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <script src="Jquery-ui/jquery.js"></script>
    <script src="Jquery-ui/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#txtDataViagem").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnCalendario").click(function () {
                $("#txtDataViagem").focus();
            });

            $("#txtDataViagem").attr("autocomplete","off");
        });
    </script>

</asp:Content>
