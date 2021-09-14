<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="Despesas de Viagem" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 47px;
        }

        #contentHolder table {
            border: none;
        }

        .auto-style4 {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    <table align="center" border="0" width="100%" frame="border">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblTitulo" runat="server" Text="Sistema de Controle de Despesas de Viagens"
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:MultiView ID="MultiView" runat="server">
                    <asp:View ID="ViewLogin" runat="server" EnableTheming="True">
                        <div class="linhaTitulo" align="center" height="30">
                            <asp:Label ID="lblTitulo0" runat="server" Text="Acesso Restrito"></asp:Label>
                        </div>


                        <div id="divLogin" align="center">

                            <img src="Imagens/Login.png" /><br />

                            <table align="center" style="text-align:left;"> 
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUsuario" runat="server" CssClass="texto" Font-Bold="False" Text="Usuário:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUsuario" runat="server" MaxLength="25"
                                            Width="230px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                                        ErrorMessage="*" CssClass="d-inline" Font-Bold="True" Font-Size="Large" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSenha" runat="server" CssClass="texto" Text="Senha:"
                                            Font-Bold="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control form-control-sm d-inline" MaxLength="25" TextMode="Password"
                                            Width="230px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtSenha"
                                        ErrorMessage="*" Font-Bold="True" Font-Size="Large" SetFocusOnError="True" CssClass="d-inline"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="50px;">
                                        <asp:Button ID="btnLogin" runat="server" Font-Size="14px" OnClick="btnLogin_Click"
                                            Text="Login" CssClass="btn btn-sm btn-default" Width="230px" />
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div style="text-align: center;">
                            <br />
                            <asp:Label ID="LabelErro" runat="server" Font-Bold="False" Font-Size="14px" ForeColor="Red"></asp:Label>
                        </div>
                    </asp:View>
                    <asp:View ID="ViewInicial" runat="server">
                        <table align="center" cellpadding="10" width="100%" border="0" cellspacing="0">
                            <tr id="linhaCadastrarNovoUsuario" runat="server">
                                <td align="center">
                                    <asp:Button ID="ButtonCadastrarNovoUsuario" runat="server"
                                        Text="Cadastrar Novo Usuário" OnClick="ButtonCadastrarNovoUsuario_Click" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaCriarDespesa" runat="server">
                                    <asp:Button ID="ButtonCriarDespesa" runat="server" OnClick="ButtonCriarDespesa_Click"
                                        Text="Criar uma despesa" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaConsultarDespesas" runat="server">
                                    <asp:Button ID="ButtonConsultarDespesa" runat="server" OnClick="ButtonConsultarDespesa_Click"
                                        Text="Consultar minhas despesas" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaAdministrarDespesas" runat="server">
                                    <asp:Button ID="ButtonAdministrarDespesa" runat="server" OnClick="ButtonAdministrarDespesa_Click"
                                        Text="Administrar Despesas" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaSolicitarAdiantamento" runat="server">
                                    <asp:Button ID="ButtonSolicitarAdiantamento" runat="server" Text="Solicitar adiantamento" Width="200px" OnClick="ButtonSolicitarAdiantamento_Click" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr id="linhaAdiantamento" runat="server">
                                <td align="center">
                                    <asp:Button ID="ButtonAdiantamentos" runat="server" OnClick="ButtonAdiantamentos_Click"
                                        Text="Adiantamentos" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaFuncionariosPendentes" runat="server" class="auto-style3">
                                    <asp:Button ID="ButtonDespesasPendentes" runat="server" OnClick="ButtonDespesasPendentes_Click"
                                        Text="Funcionários Pendentes" Width="200px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="linhaPosicaoFinanceira" runat="server" class="auto-style4">
                                    <asp:Button ID="ButtonPosicaoFinanceira" runat="server"
                                        Text="Posição Financeira" Width="200px" OnClick="ButtonPosicaoFinanceira_Click" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="ViewPergunta" runat="server">
                        <table align="center" cellpadding="2" width="100%">
                            <tr>
                                <td align="center" height="30" valign="bottom">Criar uma nova despesa,
                                    <asp:Label ID="labelNomeFuncionario" runat="server"></asp:Label>
                                    ?
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="40">
                                    <asp:Button ID="ButtonSim" runat="server" OnClick="ButtonSim_Click" Text="Sim" Width="55px" CssClass="btn btn-sm btn-default" />
                                    <asp:Button ID="ButtonNao" runat="server" CausesValidation="False" OnClick="ButtonNao_Click"
                                        Text="Não" Width="55px" CssClass="btn btn-sm btn-default" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
