<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="Despesas.aspx.cs" Inherits="Despesas" Title="Despesas" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">

    <script language="javascript">
        function abrirJanelaImprimir() {
            var left = (screen.width - 750) / 2;
            var top = (screen.height - 600) / 2;
            window.open('ImprimirDespesa.aspx', '_blank');
        }
        function abrirJanelaImprimirDetalhado() {
            var left = (screen.width - 750) / 2;
            var top = (screen.height - 550) / 2;
            window.open('ImprimirDetalhe.aspx', 'page', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=750,height=550, top=' + top + ', left=' + left);
        }
        
    </script>

    <style type="text/css">
        .auto-style1 {
            background-color: #C1D6FF;
            width: 118px;
        }
        .auto-style2 {
            width: 118px;
        }
        .auto-style3 {
            background-color: #C1D6FF;
            width: 33%;
        }
        .auto-style4 {
            width: 33%;
        }
    </style>

    </asp:Content>
<asp:Content ID="ContentConteudo" ContentPlaceHolderID="content" runat="Server">
    <table align="center" border="0" width="100%" frame="border" unselectable="off">
        <tr>
            <td align="center" class="linhaCor">
                <table align="center" cellpadding="4" cellspacing="0" width="100%">
                    <tr>
                        <td align="center" class="fonteTitulo" colspan="3">
                            <asp:Label ID="lblSubTitulo" runat="server" Font-Bold="False" Text="Detalhes da Despesa de n?mero:"></asp:Label>
                            <asp:Label ID="lblNumero" runat="server" Text="0"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="left" class="auto-style3"></td>
                        <td align="left" class="auto-style1">
                            <asp:Label ID="labelData" runat="server" Text="Data:"></asp:Label>
                        </td>
                        <td align="left" class="linhaAlternativa" width="400px">
                            <div class="d-inline justify-content-start">
                                <asp:TextBox ID="textData" runat="server" CausesValidation="True" MaxLength="10"
                                    Width="150px" CssClass="form-control form-control-sm d-inline" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnData" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaDataDesesa" runat="server" ControlToValidate="textData"
                                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="salvarDespesa"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblRegistroFuncionario" runat="server" Visible="False"></asp:Label>
                                </div>                      
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelFuncionario" runat="server" Text="Funcion?rio:"></asp:Label>
                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:TextBox ID="textFuncionario" runat="server" CausesValidation="True" MaxLength="6"
                                Width="300px" Enabled="False" ReadOnly="True" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaEmpresa" runat="server" ControlToValidate="ddlEmpresa"
      (  0                  (   ErrorOessaom="*" Fon|-Bld="True" F?n?-Smza="16px" SetFocusOnError="True* VAlieationroup="sadvarDuspesa"></asp:Ruqui?ed?ieldVilidator.
                   $   "</td>
"           "          
       ?         $  </tR>
       0(     0  0  =tr klass="lmnhaAlternativeb>M
            "(    (     <td alicn=&left" class= auto-style4& ?</t`>
    `    ""?    0       td align="left" #liss="audo-styme:">
      0   !       )    ? 0 !<asp:Lafel T="labelCQF" run?t="server"?Text?"CPF:*?<+c?p:Labe?-
   ?    ?        " "   `<+td>
   0                ?   <td alIgn="left& blAss="linhaAlternativa d-inL?ne jus?)fy-c?ntent-staru">
         !      `           <asp:TextBox ID="teXtKPF" runat="seRvev" CapsesValidation="True" EaxLength="6" Width=?300Px"
     0      $    ?  ! !         Enablge="False" ReadOlly5"Tjue" CssClass="fOrm-cOntrOl form-konprol-sm d-inlmne"?</asp:TextBox>
"                       <otd>
       $ `           ? 
              $  ` </tR.
       0            =tr>            ?           (td amign="left" cla?s="auto-style4"></pd??
 `       " 2            <td align=&left""clcss<"auto-stYle2">
  0             `      ?   <ast:Labal!ID="lab?lEmpresa"`runet9"se?ver" Text="Empresa:"></asp:\abel>
             !         `?/td>
 ` !    "               <td ahign="?eft" Class="`-inline justify-?onte.t?ptart2>
                        0   <aqp:Dr?p?ownList ID="ddlEmpresa" r5nat="qerver" Width}"305pz" DataSou?ceID="SqlDataSourceEmPrEsas"-
?               $              DateTex|Field="NomeEmpres!" DataFalueField5(Empre3aI`" Enabled=*FalwU* CssClasw="form-kontron form-control-sm d-inline">
            !       !       </aqp:D?opDownLisu>
 !                   ,(`  ( <asp:RequiredFIeldWa,idqTor aD="validaCC" runat=?server? ControlToVAliDate="dDlCdltroCusvm"
  "    ?               ?        E?RorMesseee="*  Font=Bold="T2ue" Font-Size="16px" S?tFocusOnEbrmr="T?ue" ValidctinGr?up="salvarDgwpesa":</csp:RequiredFieldValiDator>
?   $               0!      <cs`?SqlData[kurce ID="SqlDadaSourcuEmpresas" runat="server" onne?tionStp)Ng= <%$ ConnectionStrings*Conex#g %>??
         ?         $   `  `0    P?oviderName="=%$"ConnecpionStringr:Conex?k.Provi?erNAme %>" SelgctCommand="SELEGT DISTINGT * FR_M K?mpresa] LER BY [NomeEmpr%sa]"></asP:SqlDe?aSourae~
        ?           $? !</td>
     ?      0 (        
       `  (         >/tr>
"      a            <tr class=LanhaAlternativa">
,             `         <td align="left" class;"auuo-style3"></te?
                        <td amign=?left" class="auvo-style2" >
       ! "                  <asp:LabE, IE"labelCentroCusto" runat=server" Texd="centro de Custo:"><?qsq:Label>
     $      "!          </td>
         `          ( $ <td align="left" klass="linhaA?te?nqtIva d-inline justif}-Content/start">
           ?    !           <asp:DropDo7nLisp ID="ddlCentroCusto" runat?"server? Widt(=#305px"?DataSource?D="SqlDatiSo5rceCentrosCusto"
                   ! `          DataTextF?ald?"Setoz" DctaValueFie,d="CentroCusto" nabled=*False" CssClqss=formmcontrol fOrm-contron-s? d-innine">
         (?               ! </asp:DrOpDewnli?t>
  `      2   "              <asp:R%15i?edBieldValidator ID="vadid!FuncioNario" v}jat-"serwer"(C?ntrolToVamiEate="textFqnckonerio"   $   ?   0              0     ErrnvMessagu="*" FoNt-Bnld="Pru%"!Fond-Siz%="16px" Se4FOc?sOnArror="True& Valydq?ionGrour="salvarDespesa"></csp:Requi?edFieldVahi`ator>
           ) "            ! <arp*SqlDqtaSour?e I="SqlDAtaSourCeCentrksCusto" ru.av="server" ConnectinStri?g="<%%`Confec4ionsdrings:Conex!o %"
   (            $  0?    2     ?ProwiderNamu="<%$ CnnectionSdrings:Conmxao.ProviderNamu %?"0SelecdCommand="SUHACT DISINCT [Cen?rocusto],0[Setor] FROM [etor] ORDER BX [Setor]"></asp:sdDataQoqsce6
   !     `(   ?         =/Td>  $          ?  $       
                ` ! ?/tz>J      0        % `  <tr>
   $           !        ?t  align="left" cless="auto-?tyle4"></td>
    ( $   0  "    !h    <td$align="legt" cla#s="aut/-style6">
          (      (          <asp;Labe? ID="labelBanco" punat9"3erver" Texv="Banco:"></asp{La"el>
  !"                 "0 </td>
      (   "    (   ?   0<td cliGn= left" class="d-inlang justidy)content-starv">
       $$                   <asp:DropDownlist I@="ddlBanco" runat= servdr" Wydth="305px" DataSgurceID="SqlDataSourcCB!ngo"M
"            (       0"         DqtaeXt?ielD9#Nome_do]Banco? DataValumField="Codagob ENabled="Valse" Cs#Cdass="form-control form-coltrol-sm d-inlinE*>
(                      `!   |/asp8DropDoWnList>
 "     "     0     `  ?   as?:Spl?atsSo?rce ?D="SqlDataSouRge@anko" runat5"server" ConlectiOnString=">%$ ConnectionStrings:Co.Exao %>"
   `              ?          !  ProviderNale="<%$ ConnectionStrings:Cknexa.PRovkdEsName %>?`RelectCommand="SELECT ZCodigo], [ome do Banco] @S Nome_do_Bajco FSOM [Bancos"></asp:Sq,DataSourse>
        $               </td>
 !                    
                    <+tr>
       0       `    <tp  c,ass="linhaAlt%rnativa">
`      $     " (  ! !   <td$align="Left"!blass="auvo-style3&></td> (`  (`(       ?       "<td0anign="left"`clas3="auto-styl%2">
         $              "   =asp:L!bel ID="labehgencia" runaT="serveb"!Text="Ag?ncia:"<</acp:Label>
   ?      $      " `    <?td>
                       "=pd align= le?t class="linhaAlternativa $-ifline jus?ify-cnte?t-start#>
`   ?        ( `            4asp:TuxvBox ID="textAgenrka" runat="server" CausesValidation-"True" MaxLength="6"
"    0"     ?        (  "       Width5"300px" na`led=#False" B%ad?nly="True& ?ssClass?"Form-cOnt?ol form-gon|rolsm d-inlmne"></asp:TextRkX>
              ?        ?<+td>
                   !    
" `    ?     ! `    </tv>   !0?   0  !       <tr>
    ?  ( `"      0     <td aligN="left"%cless="iuto-style6"></td>
    0 0   ?             <td align="left" class9"!ut-style2">
  0      $    $        ?`   <asp2Label ID="labelC/ntaCorrente" stnat="servdR" tmxt="Conta Corrunte:"></!sp>La"el>
        "  $          $ >/td>
 ?           $          <td alion="L?vt" slas3=#d/ioline jqstify-c/ntent-start">
        %              ?  (<asp:TextBox ID="textCont?Correjte" runat="werve?" CausesFalIdation=?Tpqe" MaxLejgth="6"
  ?        "                    Width="300px" Enabled="False RdadOnlY="Urue" Css?lass="form-control?form-control-?m d-inline"></asp:TextJoX>       ""   $      $ " !</td>?
           `     "   $  (    "              <otr>-
   $       " 0      <tr cl?ss="lanhcAlternativa">
                        <td align=2left" class="awto-s4yle4"></td>
                   `    <td clign="?evt" class=?auto-style2">J             !      $$  (   asp:abel IL="label1" ruNad="server& Texd="Tipo de Conta:"></asp?Labex?M
   $       ?            </4d>
      "     "          $<td align="left  clasS="e-in?ind hustify-contenT-sdart">
          "          `   !  <asp:DrotDownLis? ID=ddlTipoConta" runat="sErver" Width="305px Da?aourCeID="SqlD`taSourcaTipoConta"
        (             (         DauaTextFidld5"descricao" DatcValueField="codigo" Enabled="False"`Cs{Cdass="?orm-ckjtrol vori-cmntrOl=3o d-illine">
!$$           "       !   $ </!sp:DropDown\ist>J  (     !            `   $  <csp:SqlDauaSo5rce ID9"SqlFataS?urcETip/Conta# runqt="server" ConnectionStrinw=b<%$ ConnectionSTrings:Cgneyao %>*
     0        `                 P?ovidgvName="<%$ ConnEctionStrings:conexao.ProviderNqee %>" SelectCommand="SEHECT(? FOM TipoCof4a"></asp:S?lDataSource>
                     !  </ud>
     0                 
   !                </4r>
         $          =tr>              b         <td ilign="left class5auto%style4"></vd.M
                   !  ` <4d align5"left" CLass="aqto-style2?>              (     "  !   ?<asp.Label ID<"label@com?anhante" rufet="server" Text="Acompanhante:"></!sp:Larel?K       ?  `    ?      ( </td>
`    (   ` 0        (  <td ali'n=bldft"$class="d-inling j}Stify-content-st`bp">
      ` ?          !   `    <asp:TextBx ID="textAcom`ajhante" runat="serverB CausesValadation=#True" MaxLength-"502
    ?    "    *         (!   "  Width="320px" KssClass="form-cnntvol form-Co?tRol-sm$dminline"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelDestino" runat="server" Text="Destino:"></asp:Label>
                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:TextBox ID="textDestino" runat="server" CausesValidation="false" MaxLength="50"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelFinalidade" runat="server" Text="Finalidade:"></asp:Label>
                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:TextBox ID="textFinalidade" runat="server" CausesValidation="false" MaxLength="200"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelMB" runat="server" Text="MB:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="textMB" runat="server" MaxLength="6"
                                Width="300px" CssClass="form-control form-control-sm float-left"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="TextMBValidator" ControlToValidate="textMB" runat="server" ErrorMessage="Digite apenas n?meros" ValidationExpression="\d+" ValidationGroup="salvarDespesa" CssClass="float-left"></asp:RegularExpressionValidator>
                        </td>
                       
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelTipoMoeda" runat="server" Text="Tipo Moeda:"></asp:Label>
                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:DropDownList ID="ddlTipoMoeda" runat="server" Width="100px" DataSourceID="SqlDataSourceTiposMoeda"
                                DataTextField="Moeda" DataValueField="Ordem" CssClass="form-control form-control-sm d-inline">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceTiposMoeda" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT [Ordem], [Moeda] FROM [Moeda] ORDER BY [Ordem]"></asp:SqlDataSource>
                            &nbsp;</td>
                        
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">Adiantamento:</td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:TextBox ID="textAdiantamento" runat="server" CausesValidation="True" MaxLength="8"
                                Width="300px" Enabled="False" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnLancarAdiantamento" runat="server" Text="Lan?ar" OnClick="btnLancarAdiantamento_Click" CssClass="btn btn-sm btn-default btn-pesquisa" />
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2"></td>
                        <td align="left"></td>
                       
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="center" class="fonteTitulo" colspan="3">
                            <asp:Label ID="lblSubTitulo0" runat="server" Font-Bold="False" Text="Adicionar Despesa"></asp:Label>
                        </td>
                       
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelDataDespesa" runat="server" Text="Data:"></asp:Label>
                        </td>
                        <td align="left">
                            <div class="d-inline justify-content-start">
                                <asp:TextBox ID="textDataDespesa" runat="server" CausesValidation="True" MaxLength="10"
                                    Width="300px" CssClass="form-control form-control-sm d-inline" ClientIDMode="Static"></asp:TextBox>
                            <img alt="" id="btnDataDespesa" src="Imagens/calendar.png" width="18px;" height="18px;" style="cursor:pointer;"  /><asp:RequiredFieldValidator ID="validaData" runat="server" ControlToValidate="textDataDespesa"
                                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="adicionarDespesa"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblMensagemData" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                            </div>                        

                        </td>
                       
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelCategoriaDespesa" runat="server" Text="Categoria:"></asp:Label>
                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:DropDownList ID="ddlCategoriaDespesa" runat="server" Width="305px" DataSourceID="SqlDataSourceCategoriasDespesas"
                                DataTextField="NomeCategoria" DataValueField="Codigo" CssClass="form-control form-control-sm d-inline" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoriaDespesa_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCategoriasDespesas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM [CategoriasDespesas] ORDER BY [NomeCategoria]"></asp:SqlDataSource>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelTipoDespesa" runat="server" Text="Tipo:"></asp:Label>
                        </td>
                        <td align="left" colspan="2">
                            <asp:DropDownList ID="ddlTipoDespesa" runat="server" Width="305px" DataSourceID="SqlDataSourceTiposDespesa"
                                DataTextField="TipoDespesa" DataValueField="Ordem" CssClass="form-control form-control-sm d-inline float-left">
                            </asp:DropDownList>
                            <asp:TextBox ID="textOutraDespesa" runat="server" CausesValidation="True" MaxLength="50"
                                Width="245px" CssClass="form-control form-control-sm d-inline float-left" Visible="False"></asp:TextBox>
                            <asp:Button ID="ButtonOutra" runat="server" OnClick="ButtonOutra_Click" Text="+"
                                ToolTip="Outra despesa" Width="28px" CssClass="btn btn-sm btn-default btn-pesquisa d-inline float-left" Visible="False" />
                            <br />
                        </td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="left" class="auto-style4"></td>
                        <td align="left" class="auto-style2">
                            <asp:Label ID="labelValorDespesa" runat="server" Text="Valor:"></asp:Label>

                        </td>
                        <td align="left" class="d-inline justify-content-start">
                            <asp:TextBox ID="textValorDespesa" runat="server" CausesValidation="True" MaxLength="8"
                                Width="300px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validaValorDespesa" runat="server" ControlToValidate="textValorDespesa"
                                ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True" ValidationGroup="adicionarDespesa"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblMensagemValor" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                        </td>
                       
                    </tr>
                    <tr>
                        <td align="center" class="auto-style4"></td>
                        <td class="auto-style2"></td>
                        <td align="left" colspan="2">
                            <asp:Button ID="ButtonAdicionarDespesa" runat="server" Text="Adicionar" OnClick="ButtonAdicionarDespesa_Click"
                                ValidationGroup="adicionarDespesa" CssClass="btn btn-sm btn-default" />
                             <br />
                             <asp:Label ID="lblItemRepetido" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr class="linhaAlternativa">
                        <td align="center" class="fonteTitulo" colspan="3">
                            <asp:Label ID="lblSubTitulo1" runat="server" Font-Bold="False" Text="Despesas Adicionadas"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="False" Font-Size="Small">Voc? pode adicionar at? 10 datas de despesas.</asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:GridView ID="GridViewDespesas" runat="server" CellPadding="4" CssClass="textoGrid"
                                ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSourceDespesas"
                                OnRowDeleting="GridViewDespesas_RowDeleting" PageSize="12">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EmptyDataRowStyle Font-Bold="True" Font-Size="15px" ForeColor="Black" />
                                <Columns>
                                    <asp:BoundField DataField="ItemDespId" HeaderText="Id" InsertVisible="False" SortExpression="ItemDespId" />
                                    <asp:BoundField DataField="Ordem" HeaderText="Ordem" />
                                    <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data"
                                        SortExpression="Data" />
                                    <asp:BoundField DataField="TipoDespesa" HeaderText="Despesa" SortExpression="TipoDespesa">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Valor" DataFormatString="{0:f}" HeaderText="Valor" SortExpression="Valor">
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ButtonExcluir" runat="server" CommandName="Delete" ImageUrl="Imagens\Delete.png" />
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
                            <asp:SqlDataSource ID="SqlDataSourceDespesas" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                DeleteCommand="DELETE ItemDespesa WHERE ItemDespId = @ItemId" ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>"
                                SelectCommand="SELECT DISTINCT ID.ItemDespId, ID.Data, ID.TipoDespesa, ID.Valor, TD.Ordem FROM ItemDespesa AS ID LEFT OUTER JOIN TipoDespesa AS TD ON TD.TipoDespesa = ID.TipoDespesa WHERE (ID.NumeroDespesa = @NumeroDespesa) ORDER BY ID.Data">
                                <DeleteParameters>
                                    <asp:Parameter Name="ItemId" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblNumero" DefaultValue="0" Name="NumeroDespesa"
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceTiposDespesa" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                                ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT TipoDespesa, Ordem, CategoriasDespesas FROM TipoDespesa WHERE (CategoriasDespesas = @CategoriasDespesas)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCategoriaDespesa" Name="CategoriasDespesas" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center" class="fonteTitulo" colspan="3">
                            <asp:Label ID="lblSubTitulo2" runat="server" Font-Bold="False" Text="A??es"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Button ID="ButtonImprimir" runat="server" Text="Imprimir Despesa"
                                Width="120px" CausesValidation="False" OnClick="ButtonImprimir_Click" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="ButtonImprimirDetalhe" runat="server" Text="Imprimir Detalhe"
                                Width="120px" CausesValidation="False" OnClick="ButtonImprimirDetalhe_Click" CssClass="btn btn-sm btn-default" />
                            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" OnClick="ButtonVoltar_Click"
                                Width="70px" CausesValidation="False" CssClass="btn btn-sm btn-default" />
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                        </td>
                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>



    <link href="Jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <script src="Jquery-ui/jquery.js"></script>
    <script src="Jquery-ui/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#textDataDespesa").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnDataDespesa").click(function () {
                $("#textDataDespesa").focus();
            });

            $("#textDataDespesa").attr("autocomplete", "off");

             $("#textData").datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
            });

            $("#btnData").click(function () {
                $("#textData").focus();
            });

            $("#textData").attr("autocomplete", "off");
            
        });
    </script>


</asp:Content>

