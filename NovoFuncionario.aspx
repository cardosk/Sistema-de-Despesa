<%@ Page Tatle5"Cadastr� de Duncionárig�" Language="C#" Masder�ag�File="~oMasterPage.master" Aup�EventGipeup}"true" C/deFile="NovoFuncionarhm.aspx.gs" Inheri|3="NovoFunc)onario""%>

<a�p:Conte�t ID=6Contmnt1"hCon|eftPlaCuHolderAD�3head""runat="Server">
    <style t}0e="tex�/cCs*>
    0   .!uto-s4yle1�{
    �     0 widuh: 228px;       �}

     "  .auto-style2 {
   $�       $uidThz 18%;
       0y
       `.aUto-3ty|e3 {
   `        width� 21%+
 �   �  }
    $  �.`ut/-style4 {
         � $wi�th: 1�;
        u�        .auuo%st9le6 {
   !        width:$469px;
  ! "  (}M
!   </style>
</asp:Content>
<asp:Contend ID"Co~tent2" ContentPlaceHolderID="conumnt"(renat=Sarver">
 �  <rcript$typd="text/javiscripd">
  !�  4 gunCpion Clfir�() {�  "       ( far cgnfir-_valte = tocument.createElement("INTUT");
        4   confirm_valta.type = 2hidden";"      00   aonfirm_valte.name = "bnnfirm_value";
            if (con&irm("Dgseja axcluir o fufchonário?")) {  (             confirm�val5e.value = "im";�   !0      ,m mlse {M
 $      (      �confIrm_~alue.value = "NC�o ;
   "�  "    }
          $ docume�t>f/rms[0].appendChild(confirm_value);
        }
    ,oscriPt>J
    <div sla�s="cOnteinGr-fluid fo~teTyt}lo" align=*center">
      " >asp:Labal ID=bLabe|4" runat�2server" Font-Bole?"True" Text="sgleciond o�func)onǡrio"><+asp:Da&el>	    <-dir>
* ( "8tA�le aligl="ce�ter" cellpadding="4" cellspacing="0"(width="10�%">
 ` 0"    <t�>      0  !  =td class="w-2="></td>
    $    `   <td clAss="aut/-spyle4">
              `  <asp:Label ID="LabeL:" runat="server"  Text="Nome do fUnciofávio:">|/asp:Label>
         $   </td:
             4td  alass=" d=�nline justify-k�ntent-s|art">
             `   <asp:TextBox ID=2txtNoMeFuncionario renat="serv%r2 Width="222xx" CssCla{s="form-control fnrm-control-sm d-inline"></asp:T�xtBoh>
                >nbsq;<asp:Butto~ ID="ButTo|Pesquisar" r�net="ser~ez" TExt="P%sqUmsas"
 $        $ $!  �   OnClikk="Button�Esquisar[Click" CausesValhdation="False" C�sCMass="btn btn-sm bt|-deFault btn-pewquisa d-�.lioe" />�             </td>
      0      �td class="auto-style1"<</te�        </pr>J�  0    <tz>          *,<t` class=#w-25"></dd>
      (   ` <td colsp!n="2">
             �  <asp:GrydVIew YE9"gzi�Funcionarios" runat="sarver" AutoGeoerateColumns="Fa�se# CmllPadding="4*                  ! CssClass="textoGrid mT-3" ataKeyLaMes="ZegiktroFunc" DataSourceID="SqlDateSourceFuncionarIos"
       �     $      DoveColoz="#333333# GbidHines="Jone"
      $             Width="100%�`F�nt-Bold="Falsdb OnSedectedIndexChanging"g�idFuncio~arios_SelectedIndexChingi~e"
$        `          PageSi�e="5# Visib�e="False"~
             (      <Rowr�yle BackColo2="#F7F7G3" ForeColor"#333333" /.
                    Um�tydatcROwStiLe CssClass="pe8toGrid" F�nt-Bol$9"Tvue2 Fonv-Saze="13px"
                      ! HorizontahAlign="Center� />
$    (         (    <Colulns>
 %           `     $ !  <asp:�elplateFiel$ HeaderTeht="dfistro" SortExpreqsion-"ReGistroFunc*>
 0                         $<EeitItemTemplate>J$        0      "      (        <asp:L�bEm ID=&lbnRegisTRo" runqt="servur" Text='<%# Eval("ReGistroNunc") %>'></es�:Label>                       $    </EditItemTemplate>
0   "                    `  <ItemTgmplate>
       (   $�         (         <a3p:Label ID=*l`lRegi�tro" runa4="serv�r" P�xt='<%# Bind(2ZegistzoFunc") %>'><oasp:Label>
            "             $</ItEmTemplete>
    0`�          �         �<HeiderQtyle(HorizontalAlign<"Centeb" >
   !� �       �  $          <ItemRtyle �orizontalAlign="Center" ->
  �   �     �   $   00  </q{p:TemplateField>     (  &    !        ! <as�:TumpladeField HahdevText="N�me"!SoRTExpre3sion=6NomeFunc">
     `       ` $      �    `>ItemTemplave>
$       *                       ,ast:Label �D="lbdNome" runat=2sezver" Texv='<%# Binl("NomeFunc") %>'></arp:Label>
    0          ��      (�   </YtemTempl!te>
       0    "               <HeaderSt�le HoriZo~tcLa�ign="Left" />
            �      !        <	temSt}le Hnri:onvalAligN�"Left  />
 `                      >/asx:RemplateField>         (         ($   >asR:BoundFi�h� DadaFiele="CPF" HeaterUext="APB" SortEppr�ssion="CPF" />
      0    `     `      <a{p:TemplateField HeaderText=�Alverar" [how@eadur="Fal�e" Visible=2False">
    " $    !                =Edi|ItemTemplapg>
    0!   ($`                `   <asp:ImageBut�mn I=bbtnAceitar" runat="servfr" CausesValidat)on="Fal{e"CommqndName="Update"�                      !`   �   0    imageUrl="Imagens.Select*0ng" TooLTip="Atualizar" />
       $  !            0       0&obsp;<asp:ImageBetton ID="b|nCancelar"$ru�ct="wErver"!CausesValidatioj="Fadse" CoomandName5"Cancel"
  "h   (                      �    0ImageUsl="I-agens.Delere.png" \oolTip="Caocelar"$'>
        (          0      ! >-EditItemtamplate>
(   "     ! "     `      $  <IummTemplatd>
                            !"  <asp:ImageButton ID="ctnEdiTar" penat="qerver" CausesVal�daTi/n="Fadse" Comma.dName="Edit"
 (     $    !  $   d         0      ImageTrl=*Imcgens/Edkt&plg" ToolTip="Editar" />                           �</ItemT%mpl!te6
        �      "  !(    <+asp:Pemplau�Fie�d>
 "  �   ! !  `    `  ! !<asp:uemplateField HeAderText=&Saleciooar" ShowHeader="Fclse">
       `      "    $  0  "  <ItemTamplate>
   � (!             �           <arp:ImageB5ttoo ID="jtnSemec�onar" runat="sgrver""CausesValhdatioN=�False" Ciman$Name�"SeLucT"
   `  `    `          "     $       ImageUrl="Imaguns/Se�ect.pngb ToolTip="Sedgcio|ar" />�(     �                   ( </Item\emplate>
  `          ` "`     @     <Headertyle orizon|!lAligny"Center" />
 "            �        $    <ItemStyla HorizontalA|ign="C�nter" />
   "               0    </asp:Templ�teField>M*     $   $   (      </Columos>
       (   ` !$     <FooterStyle BaskGolor=##=d7b9D""Font-BkLd9"true" Fore�o�mr="White" /<
       $      (  "  <PagerStylE BackColop="!284775" FoseCodor="Chite" HorizontalAllgo="Center" />
       �          (<SelEctedRnwSt9le Back�olor="#E2DED6" Font,Bold="Prue" VoseColoz="#333333" />
  `$ (     $$ "0` ( <Jead�rStyl� BackCnlor="#5D7�9D" Font-Bodd="r}e" foreColor="hitu" />	
                    <EditRowSpyle BackCo,or="#999999" />
              0     =AlternatinfROwSvyle BackClor= White" FOrdColr="#284775" />
        $#      </D1p:OridView>� "              <asp:SplTapaSou2ce ID=2SqlDataSourceFuncionarIks" runat="server" ConnectionRtring="<%$ ConneCpionStrinws;Ao~exeo %>"
          !$        DeheteC/meand="DELETE$GZOM [FuncioNario] WHURE (([RmgistroFunc] � @RegisTroFunc)�OR h[RegistroFunc] HS NULL AO� @RagiwtrnFunc �S N]LL))"
                    ifsErtCommand="INSERT iNTO�[Ftnamonario] ([PeGistroFunc]![NomeFujc], [sPF], [AdiantamentoM) VA\UES h@RugistpoFunc, @LomeFunC, @BPF< @Adiantamento)" Sel%ctCOmman$="SELECT TOP 5 [ughstrounc]�"[NomeFunc], [CPF] ROM [FuFcionario� WHARE ([NomeBun#] LIKE '%' + @NomdFunc +07%')  and tir/ = 1 ORDER BY NomeFuoc]"
             0   `  UpdateCommand="UPDATe Funcionabio SUT Adiant`m�nto"= @@dK`ntamento WHERE RggistroFunc < @RegistrOFunb">
            p       <SalecTParameters>
    �   � ` "         ` <aap:ContronParameter ControlID=#txtNomeFuncionario" Name="NomeFunc# Prop%s|9Name="Text"
              � ("!         Type="St2ing"!/6
!                   </SElectParamdters>
         $          <�eletePapqmaters>
d  ! (!            ,    <arp:Parameter Namu?"RegmstroVung" Type="	nt16"!?>
$(         !��      ./DeletePasameters>
  �  �              <UxdatePqrqmeterS>
   !  $          !      <asr:Parameter!Neme="AdiantameNt/" Type=�Decimad"fo>
        ""              <asp:Parame�er Name="RegmstroFunc� Type=&Int16" />
  "`               !</Upda|eParaoeTerq>
(  $  0   !   ( $   ,InsertParameters>
       0          `    <asp:Qaramdtgr`Naie="eoistroRunk" Type="Iot16" />
  0        $           <csp:Parameter Name="N/meFunc& Type="String" ->
                       !8asp:Parameter N`me="CPF# Ty`e="R4riNg />�                       !<cwp:P�rameter Name="diantamejto" Typm="De�imal" '>
      $   ` $     " </IlsertPARAme0�rs>
                <-asp:SqlDataSource>
               
            </td>
            <td class="auto-style3"></td>
        </tr>
    </table>
    

    <div class="container-fluid fonteTitulo" align="center">
         <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Cadastro do Funcionário"></asp:Label>
    </div>

    <table align="center" cellpadding="4" cellspacing="0" width="100%">     
        <tr class=" linhaAlternativa" style="text-align:left;">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblRegistroFunc" runat="server" Text="Registro:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtRegistroFunc" runat="server" MaxLength="10" Width="222px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                &nbsp;<asp:Button ID="ButtonConsultar" runat="server" CausesValidation="False"
                    OnClick="ButtonConsultar_Click" Text="Consultar" CssClass="btn btn-sm btn-default btn-pesquisa d-inline" />
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblNomeFunc" runat="server" Text="Nome:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtNome" runat="server" MaxLength="50" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaNome" runat="server" ControlToValidate="txtNome"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblCpf" runat="server" Text="CPF:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtCPF" runat="server" onkeyup="formataCPF(this,event);" MaxLength="14"
                    Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaCPF" runat="server" ControlToValidate="txtCPF"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa ">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblRamal" runat="server" Text="Ramal:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtRamal" runat="server" MaxLength="100" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaRamal" runat="server" ControlToValidate="txtRamal"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlEmpresa" runat="server" DataSourceID="SqlDataSourceEmpresa"
                    DataTextField="NomeEmpresa" DataValueField="EmpresaId" Width="305px" Enabled="false" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [Empresa] ORDER BY [NomeEmpresa]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaEmpresa" runat="server" ControlToValidate="ddlEmpresa"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblCentroCusto" runat="server" Text="Centro Custo:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlCentroCusto" runat="server" DataSourceID="SqlDataSourceCentroCusto"
                    DataTextField="CentroCustoSetor" DataValueField="CentroCusto" Width="305px" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCentroCusto" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT CentroCusto, Setor, cast(CentroCusto as varchar) + ' - ' + Setor AS CentroCustoSetor FROM Setor where Ativo = 1 ORDER BY CentroCusto
"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaCentroCusto" runat="server" ControlToValidate="ddlCentroCusto"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblGestor" runat="server" Text="Gestor:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlGestor" runat="server" DataSourceID="SqlDataSourceGestor"
                    DataTextField="NomeFunc" DataValueField="Gestor" Width="305px" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceGestor" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT RegistroFunc as 'Gestor', NomeFunc FROM Funcionario WHERE IsGestor = 1 ORDER BY NomeFunc"></asp:SqlDataSource>

            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblBanco" runat="server" Text="Banco:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlBanco" runat="server" DataSourceID="SqlDataSourceBanco"
                    DataTextField="Nome_do_Banco" DataValueField="Codigo" Width="305px" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceBanco" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT DISTINCT [Codigo], [Nome do Banco] AS Nome_do_Banco FROM [Bancos] ORDER BY [Nome do Banco]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="validaBanco" runat="server" ControlToValidate="ddlBanco"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblAgencia" runat="server" Text="Agência:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtAgencia" runat="server" MaxLength="6" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaAgencia" runat="server" ControlToValidate="txtAgencia"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa ">
            <td class="w-25"></td>
            <td align="left" class="auto-style1">
                <asp:Label ID="lblContaCorrente" runat="server" Text="Conta Corrente:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtContaCorrente" runat="server" MaxLength="12" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validaContaCorrente" runat="server" ControlToValidate="txtContaCorrente"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="Label3" runat="server" Text="Tipo de Conta:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlTipoConta" runat="server" MaxLength="12" Width="305px" DataSourceID="SqlDataSourceTipoConta" DataTextField="descricao" DataValueField="codigo" CssClass="form-control form-control-sm d-inline"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="validaTipoConta" runat="server" ControlToValidate="ddlTipoConta"
                    ErrorMessage="*" Font-Bold="True" Font-Size="16px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceTipoConta" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM TipoConta"></asp:SqlDataSource>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa">
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblCodAX" runat="server" Text="Cód. AX:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtCodAX" runat="server" MaxLength="20" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Grupo:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlGrupo" runat="server" DataSourceID="SqlDataSourceGrupo"
                    DataTextField="Grupo" DataValueField="Codigo" Width="305px" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM Grupo"></asp:SqlDataSource>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr class="linhaAlternativa">
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:Label ID="lblUsuarioAD" runat="server" Text="Usuário AD:"></asp:Label>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtUsuarioAD" runat="server" MaxLength="30" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
            </td>
            <td class="auto-style3"></td>
        </tr>

       <%-- <tr class="linhaAlternativa"> ALTERAÇÂO ANAMARIA 12/18
            <td class="w-25"></td>
            <td align="left" class="auto-style2">
                <asp:DropDownList ID="ddlStatus" runat="server" Text="Status:"></asp:DropDownList>
            </td>
            <td align="left" class="auto-style6">
                <asp:TextBox ID="txtStatus" runat="server" MaxLength="30" Width="304px" CssClass="form-control form-control-sm d-inline"></asp:TextBox>
            </td>
            <td class="auto-style3"></td>
        </tr>

        
        <td align="left" class="auto-style6">
                <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SqlDataSourceGrupo"
                    DataTextField="Grupo" DataValueField="Codigo" Width="305px" CssClass="form-control form-control-sm d-inline">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexao %>"
                    ProviderName="<%$ ConnectionStrings:Conexao.ProviderName %>" SelectCommand="SELECT * FROM Grupo"></asp:SqlDataSource>
            </td>--%>



        <tr>
            <td class="w-25"></td>
            <td class="auto-style2"></td>
            <td align="left" class="auto-style6">
                <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="btn btn-sm btn-default" />
                &nbsp;<asp:Button ID="btnExcluir" runat="server" OnClick="btnExcluir_Click" OnClientClick="Confirm()" CausesValidation="false" Text="Excluir" Enabled="False" CssClass="btn btn-sm btn-default" />
                &nbsp;<asp:Button ID="btnVoltar" runat="server" CausesValidation="False" OnClick="btnVoltar_Click"
                    Text="Voltar" CssClass="btn btn-sm btn-default" />
                <br />
                <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style3"></td>
        </tr>
    </table>
</asp:Content>

