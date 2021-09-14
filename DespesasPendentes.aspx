<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="DespesasPendentes.aspx.cs" Inherits="DespesasPendentes" Title="Despesas Pendentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <table align="center" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblFuncionarios" runat="server" Font-Bold="True" Text="Funcion�rios com Despesas Pendentes"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gridFuncionarios" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    CssClass="textoGrid" DataKeyNames="RegistroFunc" DataSourceID="SqlDataSourceFuncionarios"
                    ForeColor="#333333" GridLines="None"
                    Width="98%"
                    EmptyDataText="N�o existem funcion�rios com despesas pendentes!" Font-Bold="False"
                    PageSize="5" OnDataBound="gridFuncionarios_DataBound" AllowPaging="True">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EmptyDataRowStyle CssClass="textoGrid" Font-Bold="True" Font-Size="13px" />
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
                        <asp:TemplateField HeaderText="Adiantamento">
                            <ItemTemplate>
                                <asp:Label ID="lblAdiantamento" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Despesas">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalDespesas" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Saldo" SortExpression="Adiantamento">
                            <ItemTemplate>
                                <asp:Label ID="lblSaldo" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alterar" ShowHeader="False" Visible="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="btnAceitar" runat="server" CausesValidation="False" CommandName="Update"
                                    ImageUrl="Imagens/Select.png" ToolTip="Atualizar" />
                                &nbsp;<asp:ImageButton ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="Imagens/cancel.png" ToolTip="Cancelar" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEditar" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="Imagens/Edit.png" ToolTip="Editar" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
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
                <asp:SqlDataSource ID="SqlDataSourceFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    DeleteCommand="DELETE FROM [Funcionario] WHERE (([RegistroFunc] = @RegistroFunc) OR ([RegistroFunc] IS NULL AND @RegistroFunc IS NULL))"
                    InsertCommand="INSERT INTO [Funcionario] ([RegistroFunc], [NomeFunc], [CPF], [Adiantamento]) VALUES (@RegistroFunc, @NomeFunc, @CPF, @Adiantamento)" SelectCommand="SELECT DISTINCT F.RegistroFunc, F.NomeFunc FROM Funcionario AS F LEFT JOIN Despesas AS D ON F.RegistroFunc   = D.RegistroFunc WHERE ((D.Status = 0 OR D.Status =1) OR F.Adiantamento &lt;&gt; 0)
and F.Ativo = 1"
                    UpdateCommand="UPDATE Funcionario SET Adiantamento = @Adiantamento WHERE RegistroFunc = @RegistroFunc">
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
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblDespesasPendentes" runat="server" Font-Bold="True"
                    Text="Despesas Pendentes"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gridDespesas" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" CssClass="texto" DataKeyNames="N�mero" DataSourceID="SqlDataSourceDespesas"
                    Font-Size="11px" ForeColor="#333333" GridLines="None"
                    OnRowUpdating="gridDespesas_RowUpdating" AllowSorting="True"
                    PageSize="5" Width="98%"
                    OnDataBound="gridDespesas_DataBound">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="13px" ForeColor="Black" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID" SortExpression="N�mero">
                            <ItemTemplate>
                                <asp:Label ID="LabelNumeroDespesa" runat="server" Text='<%# Bind("N�mero") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data" SortExpression="Data">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Data", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="C�digo" SortExpression="Funcion�rio" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Funcion�rio") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acompanhante" SortExpression="Acompanhante">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Acompanhante") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Destino" SortExpression="Destino">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Destino") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Finalidade" SortExpression="Finalidade">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Finalidade") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Moeda" SortExpression="Moeda">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Moeda") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Adiantamento" SortExpression="Adiantamento">
                            <ItemTemplate>
                                <asp:Label ID="LabelAdiantamento" runat="server" Text='<%# Bind("Adiantamento", "{0:N2}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Despesas">
                            <ItemTemplate>
                                <asp:Label ID="LabelTotalDespesas" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" Enabled="False"
                                    SelectedValue='<%# Bind("Status") %>' Width="75px" Font-Size="11px">
                                    <asp:ListItem Value="0">Aberto</asp:ListItem>
                                    <asp:ListItem Value="1">Processo</asp:ListItem>
                                    <asp:ListItem Value="2">Fechado</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server"
                                    SelectedValue='<%# Bind("Status") %>' Width="75px" Font-Size="11px">
                                    <asp:ListItem Value="0">Aberto</asp:ListItem>
                                    <asp:ListItem Value="1">Processo</asp:ListItem>
                                    <asp:ListItem Value="2">Fechado</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:ImageButton ID="btnAceitar" runat="server" CommandName="Update" ImageUrl="Imagens/Select.png"
                                    ToolTip="Atualizar" CausesValidation="False" />
                                &nbsp;<asp:ImageButton ID="btnCancelar" runat="server" CommandName="Cancel" ImageUrl="Imagens/cancel.png"
                                    ToolTip="Cancelar" CausesValidation="False" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEditar" runat="server" CommandName="Edit" ImageUrl="Imagens/Edit.png"
                                    ToolTip="Editar" CausesValidation="False" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
           0   `    ,Se�ectedZoCtyle BaakColor="#E2DED2" Font-Bold="\reg2 ForeColor= #333333& ?:
              0     <�eaderStyle BaskColos="#5D7B9D"(ojt-Bold="True"�ForeColos="Whidg" />
  a              "  <EditRowStyle BackColor<"#91)9)9b />
$`        "$        <AlternatingRowStxle BackCohor="WhIte" FozEoloz="#28477" />$             ( </!sp:GridVyew>
�               <as�:SqlDataSource ID="SqlDataSourceDespusas" runat= serve2" ConnaationString="<�$ GonnecvioNSt�ings:Conexao %>
0�                  DeleteCommand="DELETD FPG] Despes�s]"WHGRE0(([NumeroDespm�a] � @NumeroD%spesa) OR ([Nume�oDespesa] IS NULL AND0@NtmeroDespera IS!NULL))"
$      $    $    `  InsertKommand="INSE�\ INTO [Despescq] ([NumeroDespesa], [EmpresaId],!YData], {CeltroCusto], [Rgg)stvoFunc], [aCkmpanhante]� [Ddstino], [Finalidade]l YMoedc]� [Adiantamento], [Ba�xaz]) VALUE� (@NumeroDeapesa, @EmpresaID,�@Da|a, @CentroCust�, @Registro�unc, @Acompanhante, @Destino, @Finalidade, @Moada,  atiantamento, @Aixar)" S%le#uComm�nd="SELECT Despesas.NumeroDecpesa CS N�merg, Cgnv�rt(varchar, Fespesas&Data, 103) A� D�ua, Despesas.ReGistroFulc AS!Funcion�rio< Funcionario.NomgFunc AS(Nome, Empres!.NomeEmpresa AS"Emprese, LEspeSas.CentroCusto A Centro Custo], Setor.Sator, Deypeses.Acomp�nhAnte, Despes�s.Destino, De�0esas.Fknali$adm, Despmsa{.Moe``, Despesar.Adian4amenpo, Ees�esaw.Status FROM (,(Despesas INNER JOIN Empresa ON Despesas.EmprescId = Empresa,GmxresAId) INNER JOYN Funcionarim ON despesas&Registro�unc = Funcionario.RugistroFung) INNER JOIN Setor ON Despe{as.CentRgCwspo = Setor.CentrC5sTo)
WHERE (Eespesas.RegistrmFunc = @PegisDroFunc AND Despewac.Statuc = 0 OR Despesas.Status(51))`
ifd F5ncio.ario.ArIvO = q�ORDGR BY Destesas.NumeroDespeqa DESC"
     0     "        UpDateCommqnd=2UPDATE Despesas SET Despesas.Status ? @S|atus, Despesar.adiqntaoentn�= @Atiantamento WHERE Nummrod%�pesc = @NumeroEespesi">
       �            |[elegtParameters>
       0                <as�:ControlParameter ControlID=bg2idFunciolarios""Nama="Regis|roFunc"
 $  0     0                Pr�perty^ame="SelectedValua" />
     "  �           </Sele#tParam%~ers>
              �     <DeletePapameters>*      �  ,        �     <asp:RarametEr Name="NumerDuspese" Type="Int32" />
  0      (""0       </DeleteParametGrs.
         �          <UpdateParameters<
�              ! ��     8qsp:Papametez Name="Status" Type="Int32� /�
     "                  8asp:Parameter Name="AdiantameNto  TypM?"Doqrld" o>
   "`0         �   �    <as�:Parameter Name="Lumgr/Despesa" T}pe=&Int32" />M       $ `    $     </Update@arameters
      !             <InsertPapame|ers>
      $  �            0 �asp:Parameter Ncme="N�meroEespesa* Type="Int33" />�(      0   "            <aqp:ParameteR name="EmpresaHd" Type="Int32" />
  d           0         <isp:Parameter Name-"Data" Ty�e="Datet�me2 />
)      !                �asp:PaRameter Name="CentroCusto"$Type=bByte#!/>
   `           !0  "    <acp:ParAmetEr Name=fRugistroun#2 Type="In|16" />
    �              `�   <asp:PaRameter Name=Acompanhante""Type="Strilg" /�
  � `            ,     !<asp:P`rameter Lame=&Destino" T}pe="Stringb`?�
     *        `         4asp:Parameter Name9"Finalidade" Tyte="Spring" />
                      0 <asp:Parameter Nal�="Moeda"$Ty�e=�Strijc" >
0         0            <�sp:Parameter Nam�= Adianta�ent�* Tqpe="Deci-al2 />
   �0 !   "       (   ! <asp:Parameper Name="B!ixar" Type="BoOlea�" />
                    </InseRtPaRameterq>
                </asq:SqlDataSo5rce>
            </td>
        <otr>*" !     <tr>
            <td class="fon4eTitulo">&nbsp;
  "      $  =/td>
$       �-tr>
    0   �tr>
           $<4d align="ce�ter">
       � `      <!sp:Button IL=&btnVolta2"(Runat="servev"(Text="VoltaR" OnClick�"btnVoltar_Slick"
$ �                 Ca�sesValidatin�="False" CssClass="btn btn-3m btn-default"(/>
 $       "! �/|d>
!   "   8/tr>
    8/taBle>
</`sp:Content>
