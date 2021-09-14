<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimirAdiantamento.aspx.cs" Inherits="ImprimirAdiantamento" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imprimir adiantamento</title>
    <link href="Estilo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style-default {
            text-align: left;
            font-size: 20px;
            height: 22px;
            padding: 0px;
            padding-bottom: 8px;
        }


        .auto-style2 {
            font-size: large;
        }

        .auto-style4 {
            font-family: Tahoma;
        }

        .auto-style6 {
            font-size: 22px;
        }

        .auto-style7 {
            font-family: Tahoma;
            font-size: 22px;
        }

        .auto-style14 {
            text-align: center;
            width: 950px;
        }

        .auto-style23 {
            height: 25px;
        }

        .auto-style29 {
            width: 152px;
        }

        .auto-style60 {
            width: 666px;
            text-align: center;
            vertical-align: top;
            padding-top: 8px;
        }

        .tabela-principal {
            border: 1px solid #000;
            padding: 15px;
            font-size: 20px;
        }

        * {
            letter-spacing: 0.5px;
        }
        .auto-style61 {
            text-align: left;
            font-size: 20px;
            height: 22px;
            padding-bottom: 8px;
            width: 60%;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
        }
        .auto-style62 {
            width: 1013px;
        }
        </style>
</head>
<body style="font-family: Segoe UI; font-size: 12px;">
    <form id="form" runat="server">
        <div class="tabela-principal">
            <table align="center" width="1000" height="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="1" style="padding: 0px; margin: 0px;" class="auto-style29">
                        <asp:Image runat="server" ImageUrl="~/Imagens/cabecalhoEditado.png" Height="55px" Width="155px" />
                    </td>
                    
                    <td class="auto-style60">

                        &nbsp;<asp:Label ID="lblTitulo" runat="server" CssClass="auto-style2" Font-Bold="True" Font-Underline="True" Text="REQUISI√á√ÉO DE VERBA PARA VIAGEM" Font-Size="21px"></asp:Label>

                    </td>
                    <td></span></span><span class="auto-style4"><span class="auto-style6">N¬∫ </span></span><span class="auto-style2">
                            <asp:Label ID="lblCodigoAdiantamento" runat="server" CssClass="auto-style7" ForeColor="#FF3300" Text="00000"></asp:Label>
                        <br />
                        Valor <asp:Label Text="text" ID="lblMoeda" runat="server" >R$</asp:Label>
                        <asp:Label ID="lblValor" runat="server" Text="valor"></asp:Label>
                    </td>
                </tr>
                <tr style="height:10px;">
                    <td style="height:10px;"></td>
                </tr>
            </table>
           
               
                
               

            
            <table align="center" width="1000" cellpadding="0" cellspacing="0" class="auto-style23">
                 <tr>
                    <td   class="auto-style-default" style="width:60%">Nome:
                        <asp:Label ID="lblNomeFunc" runat="server" Text="nomeFunc"></asp:Label>
                    </td>
                    <td  class="auto-style-default">CPF:
                        <asp:Label ID="lblCpf" runat="server" Text="12345678910"></asp:Label>
                    </td>
                    
                   
                </tr>
                 <tr>
                    <td class="auto-style-default">E-mail:
                        <asp:Label ID="lblEmail" runat="server" Text="email"></asp:Label>
                    </td>
                     <td class="auto-style-default">Cod AX:
                        <asp:Label ID="lblCodAx" runat="server" Text="codAx"></asp:Label>
                    </td>

                </tr>
                <tr>
                     <td class="auto-style-default">Centro de Custo:
                        <asp:Label ID="lblCentroCusto" runat="server" Text="centrocusto"></asp:Label>
                        </td>
                   
                    <td class="auto-style-default">Registro:
                        <asp:Label ID="lblRegistro" runat="server" Text="123"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style-default">Banco:
                        <asp:Label ID="lblBanco" runat="server" Text="banco"></asp:Label>
                    </td>
                    <td class="auto-style-default">Ag√™ncia:
                        <asp:Label ID="lblAgencia" runat="server" Text="agencia"></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                     <td class="auto-style-default"">

                        Tipo de Conta:
                        <asp:Label ID="lblTipoConta" runat="server" Text="tipoconta"></asp:Label>

                    </td>
                    <td class="auto-style-default">
                        Conta:
                        <asp:Label ID="lblConta" runat="server" Text="conta"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style-default">Data da Req:
                        <asp:Label ID="lblDataRequisicao" runat="server" Text="dd/MM/yyyy"></asp:Label>
                    </td>
                    <td class="auto-style-default">Data Viagem:
                        <asp:Label ID="lblDataViagem" runat="server" Text="dd/MM/yyyy"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style-default">Destino:
                        <asp:Label ID="lblDestino" runat="server" Text="destino"></asp:Label>
                    </td>
                    <td class="auto-style-default">Cliente:
                        <asp:Label ID="lblCliente" runat="server" Text="cliente"></asp:Label>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style-default">Acompanhante:
                        <asp:Label ID="lblAcompanhante" runat="server" Text="acompanhante"></asp:Label>
                    </td>

                    <td class="auto-style-default">Finalidade:
                        <asp:Label ID="lblFinalidade" runat="server" Text="finalidade"></asp:Label>

                    </td>
                </tr>
              
                <tr>
                     <td class="auto-style81">
                        Valor cart√£o corp.: _____________________
                    </td>                    
                    <td class="auto-style61">
                        Pag. liberado: ______/______/____________
                    </td>           
                </tr>
                 <tr>
                     <td class="auto-style80">
                        N¬∫ do cart√£o: ___________________________
                    </td> 
                    <td class="auto-style80">
                        Valor em esp√©cie: _______________________
                    </td>                    
                </tr>
                <tr>
                    <td class="auto-style-default">                       
                        Ass.: _____________________________________________
                 </td>
                 <td class="auto-style-default">
                        <asp:Label ID="Label2" runat="server" Font-Italic="True"  Text="Assinado Digitalmente (e-mail)"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td></td>
                </tr>
                
            </table>
        </div>
       
       <div style="height:375px;" ></div>
        
        
        <div class="tabela-principal">
            <table align="center" width="1000" height="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="1" style="padding: 0px; margin: 0px;" width="152">
                        <asp:Image runat="server" ImageUrl="~/Imagens/cabecalhoEditado.png" Height="55px" Width="155px" />

                    </td>
                    
                    <td class="auto-style60">

                        <asp:Label ID="lblTituloCopia" runat="server" Font-Bold="True" Font-Underline="True" Text="REQUISI√á√ÉO DE VERBA PARA VIAGEM" CssClass="auto-style2" Font-Size="21px"></asp:Label>

                    </td>
                    <td>

                        </span></span><span class="auto-style4"><span class="auto-style6">N¬∫ </span></span><span class="auto-style2">
                            <asp:Label ID="lblCodigoAdiantamentoCopia" runat="server" CssClass="auto-style7" ForeColor="#FF3300" Text="00000"></asp:Label>
                        <br />
            Valor <asp:Label Text="R$" ID="lblMoedaCopia" runat="server" ></asp:Label>
                        <asp:Label ID="lblValorCopia" runat="server" Text="valor"></asp:Label>
                        </span>

                    </td>
                </tr>
                <tr style="height:10px;">
                    <td style="height:10px;"></td>
                </tr>
            </table>
           
            <table align="center" width="1000" height="100%" cellpadding="0" cellspacing="0">
                 <tr>
                    <td  class="auto-style61">Nome:
                        <asp:Label ID="lblNomeFuncCopia" runat="server" Text="nomeFunc"></asp:Label>
                    </td>
                      <td class="auto-style-default">CPF:
                        <asp:Label ID="lblCpfCopia" runat="server" Text="12345678910"></asp:Label>
                    </td>
                </tr>
                 <tr>
                     <td class="auto-style61">E-mail:
                        <asp:Label ID="lblEmailCopia" runat="server" Text="email"></asp:Label>
                    </td>
                    <td class="auto-style-default">Cod AX:
                        <asp:Label ID="lblCodAxCopia" runat="server" Text="codAx"></asp:Label>
                    </td>
                </tr>
                <tr>
                     <td class="auto-style61">Centro de Custo:
                        <asp:Label ID="lblCentroCustoCopia" runat="server" Text="departamento"></asp:Label>
                    </td>
                   
                    <td class="auto-style-default">Registro:
                        <asp:Label ID="lblRegistroCopia" runat="server" Text="123"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style61">Banco:
                        <asp:Label ID="lblBancoCopia" runat="server" Text="banco"></asp:Label>
                    </td>
                    <td class="auto-style-default">Ag√™ncia:
                        <asp:Label ID="lblAgenciaCopia" runat="server" Text="agencia"></asp:Label>
                    </td>
                </tr>
                <tr>
                   
                    <td class="auto-style61">
                        Tipo de Conta:
                        <asp:Label ID="lblTipoContaCopia" runat="server" Text="tipoconta"></asp:Label>
                        </td>
                     <td class="auto-style-default">

                         Conta:
                        <asp:Label ID="lblContaCopia" runat="server" Text="conta"></asp:Label>

                     </td>
                </tr>
                <tr>
                    <td class="qw|omstyle60">@ata ea Req:
†                   0  !<asp:Mabel ID"l‚lDitaRequisicaoCopia" rqnat="Ûerver" Te|t="dd/MM/yYyy"6/asp8Label>
   `      )         </Ùd>
    !          †   `<td s,css="auto-{tyle-default">data Via'e-: <asp:L!beÏ iD5"lblDataViagemCopia" 2uÓat="Smrvur" Te|t9bd$+MM/9yyy"></asp:LabElæ
           `        </td>
      †  †  !$  </tr>]
           `    <tÚ>
  `      0     "    te claÛs="auto-st}le61">Destin/:           `       0  0 <asp:Nabel ID="LblƒestinoCkpia" rwnat"server" T%xt="detino"></aspzLabel>
     !       00(    </tf>
     †        $     <td clasw?"auto-style,default">ClieotE:
      (         "       |asp:LABel ID="lbmClienteCo0ia" runaÙ="sgrver* Tez|=bcdiefte"></asp∫Label|
   (             (  |'td>	
    !           <'tr>

 !   0 !        <dr<
       ( †   (      <Td classΩ"auto-style61">agompanhante:
           †  (         <asp:abel ID=¢lblAcompanhanteCopi·* run`t?"serˆer" Text= acompanhafte"~</qsp8Label>B   0" 0        0    </td>M
     †             "<td class="auto-style-eefault">inamidade:
                        <asp∫Label ID="lblFinalidgddCopia" runat="smrver" Text=¢f)nqlidade"></asp:Labed>
                    </td6
      (   `     </ur>
          †  ! 
                <tr>
               §  †  <td class="aıto-style81#>
    ""     %          ! VeloÚ cartC£n aorp.: __]____W__^___^___[
    "       (   $   </td>            †   "   
        `       "  (<td class="autÔ-s4yle61">
        $   `        !( Peg. liberado: ______/______/__]___[_____
                    </td>       0 ` 
           (    </tr>  †&             <tr>
  "         ( !      <ud clcss="aUto-styde80">
                        N¬∫ do cart√£o:"___________________________
              (  ( †<otd> 
    (  `      ("    td klass="qıto-s4yde80">
     !     !    " !0    Valor em esp√©cie: _^____________________
 a         "  `    0</tdæ      †            !
 `         †`   <Øtr>
   †            <tr.                `   <td class5*a5to-style-defaplt">    $  " 0    $ †0    †
                       ass.: __________}______ﬂ_________W[____]_________
         `   0$  </td>
 $               <t` cl!ss="a5to-qtyle-deÊault">
   `    ! "             <asp:Label ID="Label1" runat5"server¢ Font-Italic="True*  TEx6="@ssinado0D…gitalmenge (%%Ìaili"></asp>Label>
"                $  ,/td>
                </tb>

     !    @     <|r>ç
  0           $     <tD<</t$>
 !  !           <'tr>
     !     a    
            <table>
$       </divæ
 (  </form>J</b/dy>
</html>
