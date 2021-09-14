<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="Funcionarios.aspx.cs" Inherits="Funcionarios" Title="Cadastro do Funcionário" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            background-color: #9DBDFF;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    <table align="center" cellpadding="4" cellspacing="0" width="82%">
        <tr>
            <td class="fonteTitulo" colspan="2" align="center">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Text="Cadastro do Funcionário"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" class="linhaAlternativa" width="105px">
                <asp:Label ID="lblRegistroFunc" runat="server" Text="Registro:"></asp:Label>
            </td>
            <td align="left" class="linhaAlternativa" width="305">
                <asp:TextBox ID="txtRegistroFunc" runat="server" BackColor="#F0F0F0" MaxLength="10"
                    ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblNomeFunc" runat="server" Text="Nome:"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="300px" BackColor="#F0F0F0"
                    ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaNome" runat="server" ControlToValidate="txtNome"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblCpf" runat="server" Text="CPF:"></asp:Label>
            </td>
            <td align="left" class="auto-style1">
                <asp:TextBox ID="txtCPF" runat="server" onkeyup="formataCPF(this,event);" MaxLength="14"
                    Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaCPF" runat="server" ControlToValidate="txtCPF"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlEmpresa" runat="server" DataSourceID="SqlDataSourceEmpresa"
                    DataTextField="NomeEmpresa" DataValueField="EmpresaId" Width="305px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [Empresa] ORDER BY [NomeEmpresa]">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaEmpresa" runat="server" ControlToValidate="ddlEmpresa"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" 
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="linhaAlternativa">
                <asp:Label ID="lblCentroCusto" runat="server" Text="Centro Custo:"></asp:Label>
            </td>
            <td align="left" class="linhaAlternativa">
                <asp:DropDownList ID="ddlCentroCusto" runat="server" DataSourceID="SqlDataSourceCentroCusto"
                    DataTextField="CentroCustoSetor" DataValueField="CentroCusto" Width="305px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCentroCusto" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT CentroCusto, Setor, Format(CustoExibicao, '000') &amp; ' - ' + Setor AS CentroCustoSetor FROM Setor ORDER BY Setor">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaCentroCusto" runat="server" ControlToValidate="ddlCentroCusto"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" 
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblBanco" runat="server" Text="Banco:"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlBanco" runat="server" DataSourceID="SqlDataSourceBanco"
                    DataTextField="Nome_do_Banco" DataValueField="Codigo" Width="305px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceBanco" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT [Codigo], [Nome do Banco] AS Nome_do_Banco FROM [Bancos] ORDER BY [Nome do Banco]">
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaBanco" runat="server" ControlToValidate="ddlBanco"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" 
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="linhaAlternativa">
                <asp:Label ID="lblAgencia" runat="server" Text="Agência:"></asp:Label>
            </td>
            <td align="left" class="linhaAlternativa">
                <asp:TextBox ID="txtAgencia" runat="server" MaxLength="6" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaAgencia" runat="server" ControlToValidate="txtAgencia"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblContaCorrente" runat="server" Text="Conta:"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtContaCorrente" runat="server" MaxLength="12" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaContaCorrente" runat="server" ControlToValidate="txtContaCorrente"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="linhaAlternativa">
                <asp:Label ID="lblUsuarioAD" runat="server" Text="Usuário AD:"></asp:Label>
            </td>
            <td align="left" class="linhaAlternativa">
                <asp:TextBox ID="txtUsuarioAD" runat="server" MaxLength="30" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" />
                &nbsp;<asp:Button ID="btnVoltar" runat="server" CausesValidation="False" OnClick="btnVoltar_Click"
                    Text="Voltar" />
                <br />
                <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
