<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="AdminDespesas.aspx.cs" Inherits="AdminDespesas" Title="AdministraÁ„o das Despesas" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" language="javascript">
        function abrirJanelaImprimir() {
            var left = (screen.width - 750) / 2;
            var top = (screen.height - 600) / 2;
            window.open('ImprimirDespesa.aspx', '_blank');
        }
    </script>
</asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    
    <table align="center" cellpadding="2" width="100%">
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblPesquisaDespesa" runat="server" Font-Bold="True" Text="N˙mero de despesa"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="d-flex justify-content-center">
                <asp:TextBox ID="txtNumeroDespesa" runat="server" CssClass="form-control form-control-sm d-flex" Width="116px"></asp:TextBox>
                &nbsp;<asp:Button ID="btnNumeroDespesa" CssClass="btn btn-sm btn-default btn-pesquisa" runat="server" Text="Pesquisar" CausesValidation="False" OnClick="btnNumeroDespesa_Click" />
            </td>
        </tr>
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblPesquisa" runat="server" Font-Bold="True" Text="Selecione as datas para pesquisar as despesas"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="d-flex justify-content-center">
                <asp:Label ID="Label12" runat="server" Text="Data Inicial:"></asp:Label>
                <asp:TextBox ID="txtDataInicial" runat="server" Width="100px" CssClass="form-control form-control-sm d-flex" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnDataInicial" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaDataInicial" runat="server" ControlToValidate="txtDataInicial"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="pesquisar"></asp:RequiredFieldValidator>
                <asp:Label ID="Label13" runat="server" Text="Data Final:"></asp:Label>
                <asp:TextBox ID="txtDataFinal" runat="server" Width="100px" CssClass="form-control form-control-sm d-flex" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnDataFinal" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaDataFinal" runat="server" ControlToValidate="txtDataFinal"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="pesquisar"></asp:RequiredFieldValidator>
                <asp:Button ID="btnPesquisar" runat="server" OnClick="btnPesquisar_Click" Text="Pesquisar"
                    ValidationGroup="pesquisar" CssClass="btn btn-sm btn-default btn-pesquisa" />
                
            </td>
        </tr>
        <tr>
            <td class="d-flex justify-content-center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblFuncionarios" runat="server" Font-Bold="True" Text="Selecione o funcion·rio"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="d-flex justify-content-center">
                 <asp:Label ID="Label2" runat="server" CssClass="texto" Text="Nome do funcion·rio:"></asp:Label>
                <asp:TextBox ID="txtNomeFuncionario" runat="server" Width="200px" CssClass="form-control form-control-sm d-flex"></asp:TextBox>
                &nbsp;<asp:Button ID="ButtonPesquisar" runat="server" Text="Pesquisar" CausesValidation="False" OnClick="ButtonPesquisar_Click" CssClass="btn btn-sm btn-default btn-pesquisa" />
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
               
                <asp:GridView ID="gridFuncionarios" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    CssClass="textoGrid" DataKeyNames="RegistroFunc" DataSourceID="SqlDataSourceFuncionarios"
                    ForeColor="#333333" GridLines="None"
                    Width="98%" Font-Bold="False"
                    PageSize="5" Visible="False" OnSelectedIndexChanging="gridFuncionarios_SelectedIndexChanging">
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
                <asp:SqlDataSource ID="SqlDataSourceFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    DeleteCommand="DELETE FROM [Funcionario] WHERE (([RegistroFunc] = @RegistroFunc) OR ([RegistroFunc] IS NULL AND @RegistroFunc IS NULL))"
                    InsertCommand="INSERT INTO [Funcionario] ([RegistroFunc], [NomeFunc], [CPF], [Adiantamento]) VALUES (@RegistroFunc, @NomeFunc, @CPF, @Adiantamento)" SelectCommand="SELECT TOP 5 [RegistroFunc], [NomeFunc], [CPF] FROM [Funcionario] WHERE ([NomeFunc] LIKE '%' + @NomeFunc + '%') and Ativo = 1 ORDER BY [NomeFunc]"
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
            <td class="fonteTitulo" align="center">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Text="AdministraÁ„o das Despesas"></asp:Label>
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:GridView ID="gridDespesas" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" CssClass="texto" DataKeyNames="N˙mero" DataSourceID="SqlDataSourceDespesas"
        Font-Size="11px" ForeColor="#333333" GridLines="None" OnRowUpdating="gridDespesas_RowUpdating"
        OnSelectedIndexChanging="gridDespesas_SelectedIndexChanging" AllowSorting="True"
        PageSize="5" EmptyDataText="N„o existem despesas!" Width="98%" OnDataBound="gridDespesas_DataBound">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataRowStyle Font-Bold="True" Font-Size="13px" ForeColor="Black" />
        <Columns>
            <asp:TemplateField HeaderText="ID" SortExpression="N˙mero">
                <ItemTemplate>
                    <asp:Label ID="LabelNumeroDespesa" runat="server" Text='<%# Bind("N˙mero") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data" SortExpression="Data">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Data", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CÛdigo" SortExpression="Funcion·rio" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Funcion·rio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nome" SortExpression="Nome">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateDield>  0         <asp:TeeplAteFidld headerext="Empresa"!Sor4Exprdssion="Empresa">
      "(     ` (<ItemTeeplate>
             !      <asp:L·bel KD="Lab`l5" Runat="sesver"$Text='<%# Find*"Emprera"- 5>'></awp:LabeÏ>
    $` 0  †     </IteTemplate<-
      (     </!sp:TemplateFiÂÏd>
   "        <asp:TemphateField IEad%rText=CC" SkrtExpressaoo=#Centr"Cqsto" Vasiblg="Felse">
            ""  =ItemTem`late>
        "       $   <asr2Laben Iƒ="Label6" rulat="server" Text='<%#0B}l$ {Centro"CusTo]") %>'>|/asp:Label> `$             </Item%mplape>
     "      </esp:TemplaÙeField        0   <!sq:UÂmplateField HeaderText="SeT/r" SortExpresSion=¢Setor" VhsiblE9"False">            †   <ItemTemp|ate∫
       †    `      !<aÒp:Label(ID="LabEl7¢ r}nat="rerter" TÂxt='<%# Bind("Setor") %~'>|/asp:Labe,>
!             ` </It%mTe}plaÙe>:           </arp:TemplqteFi%ld>
            <asp:TemplateFIyle HeaDerDexÙ="Ackmpanhanta" SoRtExpzeqsiol="Acomtanhanue" VisÈble="False">
                <KuemUEmplate>
   0     (          <asq:Labe- KD="Label8# runat="Ûurver" Text='<•# Bind("QcOÌpanhanteb) %>'></asp:Ha"el:
     $       !  /Itemtemqlate:
            ,/as12TemplateFigld
   †        <asp:TemtlateFigld(H%aderText="Desti.Ô" SortExpression="DeStino¢>
      †   †     <ItemTemplate>
                    <asp:Lafel Id="Lebdl9b ruf·t="serves" TÂxt='<%# Bifd("Destino")!%>ß.>/asp:Label>
  †     $ $   ( </	temTemplate>
 0      0  $/asp:TemqlateField?
      0 ``  <asp:TemplaÙ%Field0HeaderTe8t="Finalidade" Qos~Exprecsion="Finalidad%">
        "  $    <…temTemplate>
       !        $   <asp:afel ID="Label10" runat=2serveÚ" Text='<e# Bind("FinaliDade") %'></„sx2Label>  "   `         </MtemTemqlate>ã  `( $      </asp:TEepletÂField>M
        "   ºaSp:TemplateFie|d HaaderTaxt="oefa  ”ortExpression="Ooeda">:                <ItemTemplate>
          (  `     !|asp:Label ID="L`bg,q1" rtnat="server" Text='<g#`Rin$("Mkeda")$->g.<?a3p:Label>ä   $        $   </ItmmTemplate>
            </asx2TemplateField.
  "$$ 0    !<asp*TemplateField @eadmrTextΩ"Aeianpamen4o" RortExpressyon="QdaanTammnto":
              ` <ItemTempn!te>
†                (  <arpLajen ID="LabelAdiantamento" runat="servEr" Text='<%# BiÓd("Adi·ntamento",  {0:N2}") %>/><-csp:Label>-
   !"      #    </Item\emqlatÂ>
                ,Mte}Style HgR)zkntalAlign="Right" />ä            </csp:emplateField>
 0       0  <asp:TdmpladeFiUld HeaderText="Despes·s">
      "  $      >ItemTemplat·:
       `       ``   <As0:Labgl IE"LibedTotamDesesas" r}.ad="serˆer"></asp:Laben>
               (</KtemTem0late>
` (  `      </asp:TempleteVIeld>	
    !       <csp:TemplateFÈeld J•adeÚText-"Statuq"†sortExpression="Status2>ä         !   !  ,KtemTemplaue>
  !  !        $`    <asp:DropDowNList Iƒ="ddlStatus& runat="Qerver" EoacledΩ"Falsd"(Select$d÷a¸ue=&<%#!Bknd("SÙAtus") %>'
           !     (      Widti="'5qx" Font-ize="11px">
     †(   b  $  !     0 <asp:ListItem Vadue="0">Abe2to</qsp:ListAtem>
     `     ,    0       <asp:ListItem Value="1">Processo<.asp:LIstitem>
    !                † <asp>LiwtItem Vilıe<"2">Fe#he`o</asp:LIstItem>
                      $ <as2:ListItem ÷aluc<"1"6DevolvÌdm<oasq:ListItem>
!    (  0  b       `<-a{p:DropDo7nLict>
     0          </IfamTmmplate>
                <EditITemTemplate^           †$ !!    <asp:DroPDÔwndist ID="ddlStauus* renat="Servar" Sele#tedValue='<%# Bi~l("Status") %>7
          $             WIdth="75px* Font-Size=211px">
                        <esp:LhstItel Vimue="&>Aberuo</asp:LispAtem>	
 `                      <asp:HmsvIte| Value="1">Zrocesso</aq`:Lis|Item>*    †    p  !   " (   † <asp:ListIuem Value="2">Fechado</asp:ListItem>
         $     0        <asp:Li3tItem`Vclwe="7">Ddvolvido</asp:ÃistItem>
  "          ( Ä   0</asp:DropDownLast>
  †  "     $   `|/EdydItemTÂmpmate>
     !      <?aspTemplateFmeld>
0           <awp8TemplateNiÂld>
0             ``<ItemTee0late>
           (      †<asp:Ima'e‚uttoN AD?"bÙnSemeaionar" rın!t="se2ver" C/mmandName="Selact" AmageUrl="~/Imagens/0rinter.png"
   `                    ToolTip="SalEcionar" CausesValidation5"Fals'2  Visible="tr}e" Heiwht="18px# />   <!--%#( Eval("Status").oString() == "0b) %)-> 
!         $     </ItemTemplate>M
     (      <oasp8TÂmpnQteField~         $  <asx∫TEmplateField>
              † <ditItemTeMplate>M
    0               <qsp:ImageButton ID="btnCceitar" runat?"serV%r" CommandNamd="Update" …mageUrl=bIm)gU.s/Select.png"
           $        †   ToolTip="Etua|yzar" CausesValidation="False" /> 0  "      !    $   &nbsp;<csp:ImageButton ID=#btnCancelar !runad=seRˆer"`ComÌandName"Cancel& IMaoeUrl="…Mage~soD%lete.png"
†        "          (0  ToolTip-"CaNcelar" CauSgsVd|ieation="False" />!   "" "        </E`itItemTemplaÙe>
      $ `(      <Item‘emxlate>
†                 `(ºasp:ImageButton ID="btnEditar"0runat="smrvdr" CommandNaMd="Edit" ImageUrh="Imacens/Edit.png"
               $ !  $   TooLTap=*Editar"0Causes÷elidatkon9"False" /ç
               `</IvamTem0late>
 $"     !`  ~/asp:‘e-platmFielf>
 !$     </Coltins6
 0     (<FoovdrStYle BackColor5"#7D7B9Fb Font-Bold="Vrue" ForaCOlor="White" />
        <PagebStylm BackColor="#284775" ForeCOlor="hite" XosyzontalAlig.="Calper" />
 †     0|Sehekte$RcStyle BackColor="#E2DED6" Font-BOld="T2ue" ForeColor="#33333" />ä$  "    =Header”Tyle BackColor}"#5D7B9D" F/nt=Bold="True" ForeColor="Wlkte" />
        <EditRowSpyle BaccSolor="#999;9" ?>-
 `      <AlturnatiogRowStylg BackColor9"Whkte"$ForeColor<"#284775" />-
 $† 8/qsp:GridVies>
    </div>
   †<asp:qhEataSource ID="SqlDataSourceDespesas" rqnIt="servEr" ConfectionString="¥%$ ConnectionStrings;ConÂxAo %>2
$  ∞    DeÏeteC'mMand="DELET≈ FROM [DespEsas] WHERE (([OumeroDespesa] =†@Nu}eroDespusa) OR ([ŒueeroDespeÛa] IS NULL!AND`@NumeroDespesa IS`NULL))"J        InsebtCommand5"INSERT ILTO Despesas(N5meroDestesa, mpÚes`Id, D·|a, CentÚOCusto, RegistroFunc, Acompanhantd, Destino, Finalid!le, Momda, AEiagtame.to, Baixar) VILWES (@NumeroDe[peÛa, @Empre{aId, CONVEZT(daTetime2, @Dada, q03), `CentroCusvo, @Ragistvounc, @AcompajhantÂ, PDestino, @inalydade,(@Moeea,(@Adia.tamenpo$ @Bai¯ar)"
  !     PrkvÈ`erNaÔe="<%$`ConnecuionStrings>Ronexeo.providerName %>" SelectCommand="SELECT Dgspesas.NumerOD%spesh AW N˙mero, Con7ert(varchar, DespesasÆData. 1∞3! AS Data, Despesas.Se')stroFunc a[ ∆un#ionÈrio, Funcionario.NomeFunc AS oie, Empresa.NomeEÌpbesa AS Empresa, Despesas.CendsoCusto AS [Centro Cwsto], Smtor.Sgvor, Despewis.Acompalhante,"DeSpÂsas.Dastino,"Despdsas.Finalydade, DgspesasÓMoeda, espusas.Adiant!mdlto, DEspesas.Sta|us FROM0(((DeÛqusas INNER JOIŒ EmpreSc MŒ Fespesis.Emxresa…d = Emprmsa.EmpzeSaMd) INŒUR JOIN$Fencio.ario ON†Despesas$Regi#uroFunc = Vunci_naÚio.segkstboFuns+ INNER JOIN Setor ON EespeÛas.CentroCusto = Set/r.CeÓTroCusto)äWHERE(DespesaÛ.Data BETEEN CONVERT(datetime2,"@DataInicial, !03!"AND CONVART(datetiÌe2, PDataFinal, 103)
ORƒER BY Des`esas.NumeroDmstesa FESC"
       †UpdcteCO}mand9bUPDATE"Deqpesis QET!Dmspmses.StItus - @Stat}s. Despesas.adiantamdnt = @Adiantimento WERA NumeroDesqesa - @N5meroDespesa">
        <Selgc|Parameqers>
    †    !  <asp:ContzolPara}etqr ControlI@="4ptDa|aInicial" N·mg="DataInicial" PropertyN`mu5"Text" Type="DateTime# />
     $      <asp:Gojtrol@araieÙer Con4rolID="txtDadaFinal" ^cme="DetaFinal" ProtertyNdme="Text" ‘ype="DeteTimÂ" />
 "      </SelectRarameters
        <ƒeleteXarameters?
            <aqP*Tarameter Nqmd="NumeboDÂspesa" Type="I>t32" />
  †     </DeluteParameters>
`0 $  ! <’pdapePAramed%2s>
    !    "  <asp:X·zameter dedaultVaÏu%="# Namd="Adia~TamentO"†/>
   (    ‡   <asp:Pareme4ep Name="NuempoDesxeÛa"0Tqpe="	n412" DefaultVAlue8"8" />ä            ,isp(Paramuter`DefaultValte="" Naoe="Status" Dqtu="Int32" +>       </updaveParameters>
†`      <InsertTaramuter3
            <a3p:Parameter Name="LumeroFeRpesa" \ype}"Int32" />          ¢ <asp:Parameter Name<bEmpresAI$" Pyqe="Int32  />
    !(   $  <asp:PqrametEr Name="Data"`T9qe="DatuTime" />
            >asp:Parcmmtdr Name="BejtroCAsto" Type=ÇByte"`/>
        !   <asp:PAra}eter NamE="Regist"mFunc" T{pg=Int16" />
    `!      <asp:Parameter Name="Acompanhante" Type="String" />
            <asp:Parameter Name="Destino" Type="String" />
            <asp:Parameter Name="Finalidade" Type="String" />
            <asp:Parameter Name="Moeda" Type="String" />
            <asp:Parameter Name="Adiantamento" Type="Decimal" />
            <asp:Parameter Name="Baixar" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDespesasFunc" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
        DeleteCommand="DELETE FROM [Despesas] WHERE (([NumeroDespesa] = @NumeroDespesa) OR ([NumeroDespesa] IS NULL AND @NumeroDespesa IS NULL))"
        InsertCommand="INSERT INTO Despesas(NumeroDespesa, EmpresaId, Data, CentroCusto, RegistroFunc, Acompanhante, Destino, Finalidade, Moeda, Adiantamento, Baixar) VALUES (@NumeroDespesa, @EmpresaId, CONVERT(datetime2, @Data, 103), @CentroCusto, @RegistroFunc, @Acompanhante, @Destino, @Finalidade, @Moeda, @Adiantamento, @Baixar)"
        ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT Despesas.NumeroDespesa AS N˙mero, Convert(varchar, Despesas.Data, 103) AS Data, Despesas.RegistroFunc AS Funcion·rio, Funcionario.NomeFunc AS Nome, Empresa.NomeEmpresa AS Empresa, Despesas.CentroCusto AS [Centro Custo], Setor.Setor, Despesas.Acompanhante, Despesas.Destino, Despesas.Finalidade, Despesas.Moeda, Despesas.Adiantamento, Despesas.Status FROM (((Despesas INNER JOIN Empresa ON Despesas.EmpresaId = Empresa.EmpresaId) INNER JOIN Funcionario ON Despesas.RegistroFunc = Funcionario.RegistroFunc) INNER JOIN Setor ON Despesas.CentroCusto = Setor.CentroCusto)
WHERE Funcionario.RegistroFunc = @RegistroFunc AND Despesas.Data BETWEEN CONVERT(datetime2, @DataInicial, 103) AND CONVERT(datetime2, @DataFinal, 103)
ORDER BY Despesas.NumeroDespesa DESC"
        UpdateCommand="UPDATE Despesas SET Despesas.Status = @Status, Despesas.adiantamento = @Adiantamento WHERE NumeroDespesa = @NumeroDespesa">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtDataInicial" Name="DataInicial" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtDataFinal" Name="DataFinal" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="RegistroFunc" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="NumeroDespesa" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="" Name="Adiantamento" />
            <asp:Parameter Name="NumeroDespesa" Type="Int32" DefaultValue="0" />
            <asp:Parameter DefaultValue="" Name="Status" Type="Int32" />
        </UpdateParameters>
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
    <asp:SqlDataSource ID="SqlDataSourceDespesasNumero" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
        DeleteCommand="DELETE FROM [Despesas] WHERE (([NumeroDespesa] = @NumeroDespesa) OR ([NumeroDespesa] IS NULL AND @NumeroDespesa IS NULL))"
        InsertCommand="INSERT INTO Despesas(NumeroDespesa, EmpresaId, Data, CentroCusto, RegistroFunc, Acompanhante, Destino, Finalidade, Moeda, Adiantamento, Baixar) VALUES (@NumeroDespesa, @EmpresaId, CONVERT(datetime2, @Data, 103), @CentroCusto, @RegistroFunc, @Acompanhante, @Destino, @Finalidade, @Moeda, @Adiantamento, @Baixar)"
        ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT Despesas.NumeroDespesa AS N˙mero, Convert(varchar, Despesas.Data, 103) AS Data, Despesas.RegistroFunc AS Funcion·rio, Funcionario.NomeFunc AS Nome, Empresa.NomeEmpresa AS Empresa, Despesas.CentroCusto AS [Centro Custo], Setor.Setor, Despesas.Acompanhante, Despesas.Destino, Despesas.Finalidade, Despesas.Moeda, Despesas.Adiantamento, Despesas.Status FROM (((Despesas INNER JOIN Empresa ON Despesas.EmpresaId = Empresa.EmpresaId) INNER JOIN Funcionario ON Despesas.RegistroFunc = Funcionario.RegistroFunc) INNER JOIN Setor ON Despesas.CentroCusto = Setor.CentroCusto)
WHERE NumeroDespesa = @NumeroDespesa
ORDER BY Despesas.NumeroDespesa DESC"
        UpdateCommand="UPDATE Despesas SET Despesas.Status = @Status, Despesas.adiantamento = @Adiantamento WHERE NumeroDespesa = @NumeroDespesa">
        <SelectParameters>
            <asp:Parameter Name="NumeroDespesa" Type="DateTime" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="NumeroDespesa" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="" Name="Adiantamento" />
            <asp:Parameter Name="NumeroDespesa" Type="Int32" DefaultValue="0" />
            <asp:Parameter DefaultValue="" Name="Status" Type="Int32" />
        </UpdateParameters>
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
        CssClass="texto" DataSourceID="SqlDataSourceItensDespesa" Font-Size="11px" ForeColor="#333333"
        GridLines="None" Width="98%" EmptyDataText="A despesa n„o tem itens!">
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
            <asp:BoundField DataField="TipoDespesa" HeaderText="DescriÁ„o da Despesa" SortExpression="TipoDespesa">
                <HeaderStyle Width="250px" />
                <ItemStyle Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="Valor" DataFormatString="{0:N2}" HeaderText="Valor" SortExpression="Valor">
                <HeaderStyle Width="50px" />
                <ItemStyle HorizontalAlign="Right" Width="50px" />
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
                <asp:Label ID="lblTotalAdiantamento" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
            <td class="fonteTitulo" align="center" width="34%">
                <asp:Label ID="lblRodapeTotal" runat="server" Font-Bold="True" Text="Total dos itens:"></asp:Label>
                <asp:Label ID="lblTotalDespesas" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
            <td class="fonteTitulo" align="center" width="33%">
                <asp:Label ID="lblRodapeSaldo" runat="server" Font-Bold="True">Saldo:</asp:Label>
                <asp:Label ID="lblSaldo" runat="server" Font-Bold="True" Text="0,00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" width="100%" colspan="3" height="30">
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click"
                    CausesValidation="False" CssClass="btn btn-sm btn-default" />
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

            $("#txtDataFinal").attr("autocomplete","off");
        });
    </script>



</asp:Content>
