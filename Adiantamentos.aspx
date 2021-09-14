<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="Adiantamentos.aspx.cs" Inherits="Adiantamentos" Title="Adiantamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }

        .auto-style3 {
            height: 34px;
            width: 140px;
        }

        .auto-style7 {
            margin-top: 0px;
        }

        .auto-style10 {
            width: 140px;
            height: 35px;
        }
        .auto-style11 {
            height: 35px;
        }
        .auto-style12 {
            width: 35%;
        }
        .auto-style17 {
            width: 140px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <script type="text/javascript">
        function abrirJanelaImprimir() {
            window.open('ImprimirAdiantamento.aspx', '_blank');
        }

        function imprimirAdiantamento(codigo) {
            window.open('Relatorios/Adiantamento' + codigo + '.pdf', '_blank');
        }
    </script>
    <table align="center" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td class="fonteTitulo" align="center" colspan="3">
                <asp:Label ID="lblFuncionarios" runat="server" Font-Bold="True" Text="Selecione o funcionÃ¡rio"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style17">
                  <asp:Label ID="Label2" runat="server" CssClass="texto" Text="Nome do funcionÃ¡rio:"></asp:Label>
            </td>
            <td >
                <div class="form-inline">
                    <asp:TextBox ID="txtNomeFuncionario" runat="server" Width="230px" CssClass="form-control form-control-sm d-inline-block"></asp:TextBox>
                    &nbsp;<asp:Button ID="ButtonPesquisar" runat="server" Text="Pesquisar"
                        OnClick="ButtonPesquisar_Click" CssClass="btn btn-sm btn-default btn-pesquisa d-inline-block" />
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div align="center">
                    <asp:GridView ID="gridFuncionarios" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        CssClass="textoGrid mt-3" DataKeyNames="RegistroFunc" DataSourceID="SqlDataSourceFuncionarios"
                        ForeColor="#333333" GridLines="None"
                        Width="98%" Font-Bold="False" OnSelectedIndexChanging="gridFuncionarios_SelectedIndexChanging"
                        PageSize="5" Visible="False">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EmptyDataRowStyle CssClass="textoGrid" Font-Bold="True" Font-Size="13px"
                            HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="Registro" SortExpression="RegistroFunc">
                                <EditItemTemplate>
                                    <asp:Label ID="lblRegistro" runat="server" Text='<%# Eval("RegistroFunc") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRegistro" runat="server" Text='<%# Bind("RegistroFunc") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nome" SortExpression="NomeFunc">
                                <ItemTemplate>
                                    <asp:Label ID="lblNome" runat="server" Text='<%# Bind("NomeFunc") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                            <asp:TemplateField HeaderText="Alterar" ShowHeader="False" Visible="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="btnAceitar" runat="server" CausesValidation="False" CommandName="Update"
                                        ImageUrl="Imagens/Select.png" ToolTip="Atualizar" />
                                    &nbsp;<asp:ImageButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="Imagens/Delete.png" ToolTip="Cancelar" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEditar" runat="server" CausesValidation="False" CommandName="Edit"
                                        ImageUrl="Imagens/Edit.png" ToolTip="Editar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Selecionar" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnSelecionar" runat="server" CausesValidation="False" CommandName="Select"
                                        ImageUrl="Imagens/Select.png" ToolTip="Selecionar" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
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
                </div>


                <asp:SqlDataSource ID="SqlDataSourceFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    DeleteCommand="DELETE FROM [Funcionario] WHERE (([RegistroFunc] = @RegistroFunc) OR ([RegistroFunc] IS NULL AND @RegistroFunc IS NULL))"
                    InsertCommand="INSERT INTO [Funcionario] ([RegistroFunc], [NomeFunc], [CPF], [Adiantamento]) VALUES (@RegistroFunc, @NomeFunc, @CPF, @Adiantamento)" SelectCommand="SELECT TOP 5 [RegistroFunc], [NomeFunc], [CPF] FROM [Funcionario] WHERE ([NomeFunc] LIKE '%' + @NomeFunc + '%')  and Ativo = 1 ORDER BY [NomeFunc]"
                    UpdateCommand="UPDATE Funcionario SET Adiantamento = @Adiantamento WHERE RegistroFunc = @RegistroFunc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNomeFuncionario" Name="NomeFunc" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="RegistroFunc" Type="Int16" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Adiantamento" Type="Decimal" />
                        <asp:Parameter Name="RegistroFunc" Type="Int16" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RegistroFunc" Type="Int16" />
                        <asp:Parameter Name="NomeFunc" Type="String" />
                        <asp:Parameter Name="CPF" Type="String" />
                        <asp:Parameter Name="Adiantamento" Type="Decimal" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Panel ID="PanelFuncionario" runat="server">
                    <table align="center" cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td class="fonteTitulo" align="center">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True"
                                    Text="Dados do Funcionario"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table align="center" cellpadding="4" cellspacing="0" width="100%">
                        <tr class="linhaAlternativa">
                            <td class="auto-style12"></td>
                            <td align="left" class="auto-style10">
                                <asp:Label ID="Label7" runat="server" CssClass="texto" Text="Nome:"></asp:Label>
                            </td>
                            <td align="left" class="auto-style11">
                                <asp:TextBox ID="txtNome" runat="server" Width="250px" Enabled="False"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12"></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="Label4" runat="server" CssClass="texto" Text="Registro:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtRegistro" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRegistro"
                                    ErrorMessage="*" Font-Bold="False" SetFocusOnError="True"
                                    ValidationGroup="lancar"></asp:RequiredFieldValidator>
                            </td>
                           
                        </tr>
                        <tr class="linhaAlternativa">
                           <td class="auto-style12"></td>
                            <td class="auto-style3" align="left">
                                <asp:Label ID="lblCpf" runat="server" Text="CPF:"></asp:Label>
                            </td>
                            <td align="left" class="auto-style1">
                                <asp:TextBox ID="txtCPF" runat="server" MaxLength="14"
                                    Width="200px" Enabled="False"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                           <td class="auto-style12"></td>
                            <td class="auto-style17" align="left">
                                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlEmpresa" runat="server" DataSourceID="SqlDataSourceEmpresa"
                                    DataTextField="NomeEmpresa" DataValueField="EmpresaId" Width="305px" Enabled="False">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [Empresa] ORDER BY [NomeEmpresa]"></asp:SqlDataSource>
                            </td>
                           
                        </tr>
                        <tr class="linhaAlternativa">
                           <td class="auto-style12"></td>
                            <td class="auto-style17" align="left">
                                <asp:Label ID="lblCentroCusto" runat="server" Text="Centro Custo:"></asp:Label>
                            </td>
                            <td align="left" >
                                <asp:DropDownList ID="ddlCentroCusto" runat="server" DataSourceID="SqlDataSourceCentroCusto"
                                    DataTextField="CentroCustoSetor" DataValueField="CentroCusto" Width="305px" Enabled="False">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceCentroCusto" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT CentroCusto, Setor, cast(CustoExibicao as varchar(3)) + ' - ' + Setor AS CentroCustoSetor FROM Setor where ativo = 1 ORDER BY CentroCusto"></asp:SqlDataSource>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="auto-style12"></td>
                            <td class="auto-style17" align="left">
                                <asp:Label ID="lblBanco" runat="server" Text="Banco:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBanco" runat="server" DataSourceID="SqlDataSourceBanco"
                                    DataTextField="Nome_do_Banco" DataValueField="Codigo" Width="305px" Enabled="False">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceBanco" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT [Codigo], [Nome do Banco] AS Nome_do_Banco FROM [Bancos] ORDER BY [Nome do Banco]"></asp:SqlDataSource>
                            </td>
                           
                        </tr>
                        <tr class="linhaAlternativa">
                            <td class="auto-style12"></td>
                            <td class="auto-style17" align="left">
                                <asp:Label ID="lblAgencia" runat="server" Text="AgÃªncia:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAgencia" runat="server" MaxLength="6" Width="200px" Enabled="False"></asp:TextBox>
                            </td>
                         
                        </tr>
                        <tr>
                            <td class="auto-style12"></td>
                            <td class="auto-style17" align="left">
                            <asp:Label ID="lblContaCorrente" runat="server" Text="N Conta:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtContaCorrente" runat="server" MaxLength="12" Width="200px" Enabled="False"></asp:TextBox>
                            </td>
                           
                        </tr>
                        <tr class="linhaAlternativa">
                            <td class="auto-style12"></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="Label9" runat="server" Text="Tipo de Conta:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlTipoConta" runat="server" MaxLength="12" Width="168px" DataSourceID="SqlDataSourceTipoConta" DataTextField="descricao" DataValueField="codigo" Enabled="False"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="validaTipoConta" runat="server" ControlToValidate="ddlTipoConta"
                                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSourceTipoConta" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM TipoConta"></asp:SqlDataSource>
                            </td>
                           
                        </tr>
                        <tr>
                           <td class="auto-style12"></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="lblCodAX" runat="server" Text="CÃ³d. AX:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCodAX" runat="server" MaxLength="20" Width="200px" Enabled="False"></asp:TextBox>
                            </td>
                             
                        </tr>
                       
                    </table>
                </asp:Panel>
            </td>
        </tr>


        <tr>
            <td style="padding: 0;" colspan="3">
                <asp:Panel ID="PanelAdiantamento" runat="server" Visible="False">
                    <table align="center" cellpadding="4" cellspacing="0" width="100%" class="auto-style7">
                        <tr>
                            <td class="fonteTitulo" align="center">
                                <asp:Label ID="lblLancarAdiantamento" runat="server" Font-Bold="True"
                                    Text="Dados do Adiantamento"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <table align="center" cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td style="width:35%"></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="Label6" runat="server" CssClass="texto" Text="CÃ³digo:"></asp:Label>
                            </td>
                            <td align="left" class="d-flex justify-content-start">
                                <asp:TextBox ID="txtCodigoAdiantamento" runat="server" Width="150px"
                                    MaxLength="8" Enabled="False" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="linhaAlternativa">
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="Label8" runat="server" CssClass="texto" Text="Cliente:"></asp:Label>
                            </td>
                            <td align="left" class="linhaAlternativa d-flex justify-content-start">
                                <asp:TextBox ID="txtCliente" runat="server" Width="350px" CausesValidation="True" Enabled="False" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="labelAcompanhante" runat="server" Text="Acompanhante:"></asp:Label>
                            </td>
                            <td align="left" class=" d-flex justify-content-start">
                                <asp:TextBox ID="txtAcompanhante" runat="server" CausesValidation="True" MaxLength="50"
                                    Width="350px" Enabled="False" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="linhaAlternativa">
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="labelDestino" runat="server" Text="Destino:"></asp:Label>
                            </td>
                            <td align="left" class="linhaAlternativa d-flex justify-content-start">
                                <asp:TextBox ID="txtDestino" runat="server" CausesValidation="True" MaxLength="50"
                                    Width="350px" Enabled="False" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="labelFinalidade" runat="server" Text="Finalidade:"></asp:Label>
                            </td>
                            <td align="left" class="d-flex justify-content-start">
                                <asp:TextBox ID="txtFinalidade" runat="server" CausesValidation="true" MaxLength="200"
                                    Width="350px" Enabled="False" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="linhaAlternativa">
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="lblMoeda" runat="server" CssClass="texto" Text="Moeda:"></asp:Label>
                            </td>
                            <td align="left" class="linhaAlternativa d-flex justify-content-start">

                                <asp:DropDownList Width="150px" ID="ddlTipoMoeda" runat="server" DataSourceID="SqlDataSourceTiposMoeda"
                                    DataTextField="Moeda" DataValueField="Moeda" Visible="true" Enabled="False" CssClass="form-control form-control-sm d-flex">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label10" runat="server" CssClass="texto" Text="Valor:" Width="38px"></asp:Label>
                                <asp:TextBox ID="txtValor" runat="server" Enabled="False" MaxLength="8" Width="140px" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                                <asp:SqlDataSource ID="SqlDataSourceTiposMoeda" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>"
                                    SelectCommand="SELECT DISTINCT [Ordem], [Moeda] FROM [Moeda] ORDER BY [Ordem]"></asp:SqlDataSource>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td align="left" class="auto-style17">
                                <asp:Label ID="Label1" runat="server" CssClass="texto" Text="Status:"></asp:Label>
                            </td>
                            <td align="left" class=" d-flex justify-content-start">
                                <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SqlDataSourceStatus" DataTextField="Descricao" DataValueField="Status" Width="150px" CssClass="form-control form-control-sm d-flex">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" CssClass="texto" Text="Saldo:" Width="38px"></asp:Label>
                                <asp:TextBox ID="txtSaldo" runat="server" MaxLength="8" Width="140px" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="validaSaldo" runat="server" ControlToValidate="txtSaldo" ErrorMessage="*" Font-Bold="False" SetFocusOnError="True" ValidationGroup="lancar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>


                        <tr class="linhaAlternativa">
                            <td></td>
                            <td class="auto-style17"></td>
                            <td style="padding: 7px; text-align: left;" colspan="2">
                                <asp:Button ID="btnAtualizar" runat="server" OnClick="btnAtualizar_Click" Text="Atualizar" CssClass="btn btn-sm btn-default" />
                                <asp:Button ID="btnImprimr" runat="server" Text="Imprimir" OnClick="btnImprimr_Click" CssClass="btn btn-sm btn-default" />
                                <asp:Button ID="btnLancar" runat="server" Text="LanÃ§ar" OnClick="btnLancar_Click"
                                    ValidationGroup="lancar" Style="height: 26px" Visible="False" CssClass="btn btn-sm btn-default" />
                                <asp:Button ID="btnDevolver" runat="server" Text="Devolver" OnClick="btnDevolver_Click"
                                    ValidationGroup="lancar" Visible="False" CssClass="btn btn-sm btn-default" />
                                <br />
                                <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small"
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="padding: 0;" colspan="3">
                <asp:Panel ID="PanelGridAdiantamentos" runat="server">
                    <table align="center" cellpadding="4" cellspacing="0" width="100%" class="auto-style7">
                        <tr>
                            <td class="fonteTitulo" align="center">
                                <asp:Label ID="lblHistorico" runat="server" Font-Bold="True"
                                    Text="Adiantamentos do FuncionÃ¡rio"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:GridView ID="gridAdiantamento" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    DataKeyNames="CodigoAdiantamento" DataSourceID="SqlDataSourceAdiantamento" ForeColor="#333333"
                                    GridLines="None" OnRowUpdating="gridAdiantamento_RowUpdating"
                                    Width="98%" AllowPaging="True"
                                    EmptyDataText="NÃ£o existem adiantamentos para esse funcionÃ¡rio!"
                                    CssClass="textoGrid"
                                    RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" OnSelectedIndexChanged="gridAdiantamento_SelectedIndexChanged">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EmptyDataRowStyle Font-Bold="True" Font-Size="13px" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="CÃ³digo" SortExpression="Codigo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("CodigoAdiantamento") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("CodigoAdiantamento") %>'></asp:Label>
       (       $                   &        </EditItemtemplate>
     $                        "         </asp>TemplateField>
 "     $                               <qsp:TeiplateBiel$ HeaferText="Data2 SorvExpressinn="Data">
       )    0       ` "                     8É|elTempla4e>Š     °   $     !                                <as0:Label )D5"lblData" zunat="serverb
   !      !                           (    0       $Text-'<%# Cind("DataRequishcao", "{0:dd/MM+yyYy}")`%6'></asp;Label>
                   "   (    `     0         </IpemTeMplcTe>J    `                `      ! "        </asp:TemplateField>Š  !                (     $ ¨"    %      <asp:TemplaTeFiEld"HeaderText="Funcionƒ¡rio" SoòtExpres3ion5"NomeFunc">            (0                     $   !    8Itgmtemplate>         "   `         `00       ` "         (  <!sp:Label ID="ìblNommFunc" runat="server"
             (                                      Tuzt='<%# Bmnd("NomeFunc") ->'></asp:Labmn
   ¤ !                !   `                 </ItemTemplite:
         !                              <asp:TemtlateFiåld>
    "                  0                <ásp:TeMplateVield headerDext="Moeda" SortExpres{ion="MoeDa&<*! `                   "           ` 0       <ITemTemplate>
"  0     8   0        `"                  (     |asp:Laben ID8"lblMoeda" Runat="server"
                                             `$     Text='<%# Bénd("Loeda#) %>'></awp*Label>
               !                      !    `</IôemTeo`late>
   "  `     $       (           (      0</asp:TemplateField>
       (   0      ("     (      `       <!sp:|emplaTåFigld Headmrext="V!lob" SortExpression"WalortiAntamento">
 $      `         "    !                  ! <ItemT%mplate.Š `           (     !            0           "   <asp:Labdl ID=lblValo2" runat="server&-* 0                 ! 2                             "Text='<%# Âind("ValorAdiantamento"$ "{0:f}") %>'></asp:La`el>	
!$                                          >/ItemTempl1tD>       `            (   !"       !      >/asP:TempdiveField>:   `     $"      "             "(       >asp2TgmpìateFie,d XeaderText=*Saldo" SoòtEhpråssion="Saldo">
            "                  "   *        <ItemTemplate>
 "   00                           0             ~asp:Labem ID="lBlSAldo" runat}"Sd2ver"
                            $                       Texô='<%# Bind(&Saldo", #{ :f}") %>'></aup:Label>
                 !`!     (            $ (   </ItemTemplate>
                                        </asp:TempmateField>J                  $              0      <asp:empla4åFieèà HeaddrTcxt=2Ótatus" SoptExpressAon½"Status">
      (!   (                 (              <It$mTem0l!te>
  !     $ `                   ( ` `   !         >%-% <asx:DropDownList ID="ddlStatus" ruîat="server* ENabled="alse" DateTextField="deóc"icao" DataValueField="Statur"
   $        (    0 ( ( `0           SeLectedValue='<%# B)nd*"Stauus¢i %>' Wxdth5 85`p¢ DataSourseID="SqlDataSouraeSvatus&>                                </asp:DrOpDoWnList>--%>*              "              "          `       <asp:LaBel ID=*lb|Status& Text='<%# Bénd"StetusDescricao") %>' runat="se2ver />
             0    !                   0     =?	TemTum0late>
                          $  "            ` <EditItemTe}plate>
        `             "                  $  0   <asp:DropDownList ID="udìStatus  runat="sasvur" DataT%xtField="descréA!o" Datav!lueFielD=*Stitus"
                  $                    `         !  elebuedVelue='<%# Bind("Stat5s") %6' Width="85px" DataSourceI@="SqlDataSourceStatus">
        `        (                (            $</aqp:@ropDïwfList>
          `     !   0             $       ! =/EdieItemTemp|ate>
                           !            </asp:TemplateFi%nd>
                 $ "  `            $    <asp:TemplateField HeAderTExt?"Editar"(Visible="False">
$         "                   ("            <ItEmTemplate>
                            !         (         <asp:Im!gdFuuton ID=#"tnEditar" runav="server" ausesValidatikn="False"
    $   !       $   !   `                "   $      CommaîdN`me="Edit" ImageUrl="Imagens/EdiT.`ng" TïolTip=bEditarb />
                     8  (            "     !</IdemTeiplate>
                           "   `            <EditItemTemplatg>
   $         $    !             $            $  4a3p:ImageButton ID="btjAtualizar" runat-"server& ÃausdsalidatioN="False"
              `           0      !0        ! "      CommandName="Urdave" MeageUrl="Imagens/update.p~gb ToolTip="Atualizar" />
     $   0  !         0    (   (            !   <asp:ImageBut|on K="btnCancelar" rwnat="servåR" CausesÖalidation="Fáhqe"
                                                    CommandName="Cancam" ImageUrl="Imace.Q/cancel*rng" ooLDip="Cancelar" />
            ( 0      !           `  "    "  </EditIt!mTemplate>
                    "             ¤     </asp:TemplateFielt>
  (    0        (                     ` <asp:CommandFie|d B}ttonTyðe="Imagu" Se,ectImageUrl="~/Ilagens/Selest.p~g" ShowSelectButton="True"h/>
!           `   0        !        $"</Columns>
  "           !                     <FooterStxle CackColír="#õD7B¹D" Font-Bold="Trwe" ForeBolor="Whkte" />
              !           0         <Pageb[tylE BackColob="#284675" ForecolOr="Wiite" HorizontalAli'n9¢Centes" />
                !0  !      ! "*(    <SelectedRo÷Style BackColor="E²DUE6"(Font-Bolä="True" F/reColor="#33#333" ?>
                 `   (         (    <Headårstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor?"White" o>
 `                      ($          ¼EditÒowStyle BeCkCo,or="#999999" +>
  0  `              $      0       `8AlternetingRowStyle BackColor="White" ÂoreColor="#28477µ" />
  0               $     $       </asq:OridView>	
$ ¢                         0 $ <asp2SqlDa4aSource ID="Sq,ÄataSourcåAdiantamento" rulat5"cer6er"        `    °                      conndctioNS4rijg="<%$ Con~ectio~S42ings:Co~exao %6b
0              " !    "         $  DeleteCommafd="DULETE ADiantameNtos WHERA(CodigkAdiantamento = @cndag/AdkaNtamento"
           "  ! (           0    0  ProvIdebName<"<%$ ConneatiOfStrings:Conexao.ProtadmrName %>"-
      0       "               °     SelectCnmeaod="SELECU A.SodigoAdia~tamendo, A.D`taequisibao, Æ.NomeFunc, A.Moeda, A.ValorAdiantamento, A.Saldo, A.[Status],4S.[Desbricao] as StatuóDmscricco
 ( $ " !  `         FROO [@diantamEntos] A inngr join KSuqtusAdiantamentoM$S 0on A.[Status] = S.[StatusU
inner join Funciolerio F on F.RegistrïFunc =dA/CodigoFunCioniri/ where NmleFUnc like '%'+@NomeFuncionariï+%#0ORDER BY KDataRequisicao]!desc. F.NomeFunc asc "
 $                                  EpdaTaCommand=buptate Adiantamento[ set Status = @Status, Cï$igoAdminisp2ador = @ColigoQdministvaäor  wèdrg CodigoAdiantamento = @odigoAdiantamendo" FalterEXpression<"NomeF}nk likE '%{0}%'"=
$      (        "   "      `        <DeleteParametups>
                 ¤   !        0$    !   <asp:Paramever Jame="Codigktiantaeentï" PypE=¦Ilt3"" />
                                    </LeleteParameters>    !            $  a       a     $ <VilterParameters>-
                                        <asp:ControlP!zameter ControlIÄ=btxtOomeGuncionario"`Ncme="newparameter" ropertyname="Text" T}pe="CTbi.g"":
                    0 0             >/FilterPara-eteró>      ( `           "      !     $  <SelestParaketers.
          ` ` `   `(            "       <asp:Contro,ParaMeter ContrglÉD="uxTNome" Name="NomeFUncionario" PropestyName½"Texv" Type="String" />
 $``   !           0                </Se,ec4Parameters>                                   $<UpdateParamdters>
 (   $        `             0      "    <awp:Parametår Name="Status" Type="Inv32" /®
         "     "      (  $              >asp:Parametmr Naíe9"CodigoAemini3tredor" Ty`e<"Int32 />
 €   "       $   $                      <asp:Parameter Name="CodigoAdiantamento" Type½"Int32* />
                                   </Updevåp`rameveró~
       $              `   0     ¼/as0:SqlDataSouvcg>
0   !               $        " `<asp:SqlDataSourcg ID=2SqlDapaSourceS4qtus" sunat="sarver" SelecrCommánd="select * from StatusAdiantamento order by Status asc" ConnectionString="<%$ ConnectionStrings:Conexao %>" ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </td>
        </tr>


        <tr>
            <td class="fonteTitulo" colspan="3">&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click"
                    CausesValidation="False" CssClass="btn btn-sm btn-default" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
    <asp:Timer ID="MyTimer" runat="server" Interval="2000" OnTick="MyTimer_Tick">
    </asp:Timer>
</asp:Content>
