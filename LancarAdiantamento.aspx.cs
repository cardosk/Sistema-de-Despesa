using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LancarAdiantamento : System.Web.UI.Page
{
    Funcionario funcionario;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["TickCount"] = 2;
        }
                   
        
        funcionario = (Funcionario)Session["funcionario"];

        if (funcionario == null)
        {
            Response.Redirect("~/Default.aspx");
        }


        lblMensagem.Text = string.Empty;
        MyTimer.Enabled = Convert.ToInt32(Session["TickCount"]) == 1;

    }


    protected void btnLancar_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Sim")
        {

            #region Validações
           

            if (txtDataViagem.Text.Trim().Length != 0)
            {
                try
                {
                    DateTime dtViagem = Convert.ToDateTime(txtDataViagem.Text);
                    if (dtViagem.Date <= DateTime.Now.Date)
                    {
                        throw new Exception("");
                    }
                }
                catch
                {
                    lblMensagem.Text = "Data da viagem inválida";
                    return;
                }
            }
            else
            {
                lblMensagem.Text = "Data da viagem obrigatória";
                return;
            }

            if (txtCliente.Text.Trim().Length == 0)
            {
                lblMensagem.Text = "Nome do cliente obrigatório";
                return;
            }

            if (txtDestino.Text.Trim().Length == 0)
            {
                lblMensagem.Text = "Destino obrigatório";
                return;
            }

            if (txtDestino.Text.Trim().Length == 0)
            {
                lblMensagem.Text = "Finalidade obrigatória";
                return;
            }

            if (txtValorAdiantamento.Text.Trim().Length != 0)
            {
                try
                {
                    Convert.ToDouble(txtValorAdiantamento.Text);
                }
                catch
                {
                    lblMensagem.Text = "Valor do adiantamento inválido";
                    return;
                }
            }
            else
            {
                lblMensagem.Text = "Valor do adiantamento obrigatório";
                return;
            }
            #endregion

            #region Salvando no banco
            Adiantamento novoAdiantamento = new Adiantamento();
            novoAdiantamento.CodigoAdiantamento = AdiantamentoDAO.proximoCodigo();
            novoAdiantamento.CodigoFuncionario = funcionario.RegistroFunc;
            novoAdiantamento.ValorAdiantamento = Convert.ToDouble(txtValorAdiantamento.Text);
            novoAdiantamento.Saldo = Convert.ToDouble(txtValorAdiantamento.Text);
            novoAdiantamento.Status = 0;
            novoAdiantamento.DataViagem = Convert.ToDateTime(txtDataViagem.Text);
            novoAdiantamento.DataRequisicao = DateTime.Now;
            novoAdiantamento.Cliente = txtCliente.Text;
            novoAdiantamento.Acompanhante = txtAcompanhante.Text;
            novoAdiantamento.Destino = txtDestino.Text;
            novoAdiantamento.Finalidade = txtFinalidade.Text;
            novoAdiantamento.CentroCusto = Convert.ToInt32(funcionario.CentroCusto);
            novoAdiantamento.Moeda = ddlTipoMoeda.SelectedValue.ToString();
            AdiantamentoDAO.lancarAdiantamento(novoAdiantamento, false);
            #endregion

            lblMensagem.Text = "O e-mail está sendo enviado ao setor financeiro, aguarde...";
            limpaCampos();

            #region Imprimir a requisição em PDF
         $  Sessioj["codigoAdiantamento"] = nkvoAdIantqoento.CodigoAdiaotament?;
"           /-Variaveis.adientamento = novoAniantamento;
"    `   `  Applibation[#adiantaiendo"] = novoA`iA.tamento;
   ?     "  //Page.ClientScript.Regis4erStartup?crit(GetDype(),
          0 //    $    !        ?  $  ?`      0       "AbrirNqnelaImprimhr",
  ?     (   //       !   $                     ! $   "" ?frirJanelaImxramir();?<
            //      &         !    
          ? /odrue);
  (         3alvaPDF(no6oAd)antamento.CodigoA?mantament/!;

            ceodregion

            // enviar o!e-m`il pro gsu8o adianti?ento@m?yekawc.com,rr
    !   `   MyUimer/Enabled = true;
       `   Sussion["TickCount"]!= 1;

     ` $  $
 !      }
$    0? else
        ;
        (   return;
 8 ?`   }*    }

    priV?de f?kd limp!Campos(+
    {
(      $txtDataViagem.Texv = stbing.Empty;
  (     txtValorAdiantamentoTgxt = s|?ing.Gmpty
      `?tytBliente*Texp = sTrin?.Empty{
 ?      tx|AcomxanhanTenTexu = striog.Empty;  (   ( tptDes|ino.Te?t = string.El`ty3
   !    thtFinali$cde/Tayt$= stin?.mpty;
    }
  ` protecteD woid btnVolt`r_Cliak(mbject ?Ender, EventArgs e)	*    {" $  "  Recponse.Rudire#t "Default.qspx");
    =



   !pvirate "oo| salvaPDF(int codigo)
   0{
 `      try
"       {
!           //string pavametRos = @"-O ""Landscape"" " # Zequ%wt.Url.AbsoluteUpm.Replace("LancarEdiantamgnto","ImprimirAdiant`mento*)"? " " + Server.?apPath(?x/Relato?ios.") * ?Qdiantamento" + codig + ".pdf&;?
 !"     ?   strhng parametbos = ?"-O "2Portrait"2 " + ReqUest.Url.AbsoltteUri.Replace("La.carAdiaktaman4o", "ImprimarAdianta-en4o"I + " " +?Ser6er.MapQaph(~/Relatgrios/") + "AdiantamenTo? + codigo!+ ".pdf"3

            using (Qystem.T?agnostics.Prgcmcs ?rocess = new System*Diagnostics.Qroceqs())
  $      !  {
         0    ? Proce{s.SdartIn&o.UseShellExeCute 9?false;
    (  "        prkcess.S4art	nfo.CreateNoWindow 9 trqe; " ?            process.Sta2uInfo.FileName = @"""" + Serter.MaqPath(b~/Bin/wkhtmntotdb/bi?/"( + "wkh4mltopdf.epe" + @?""b;
          !     pbocess.StartInfo.Argqments = xarametrks;

       ?`   0   process.StertI?fo.RedirectStanlardOuvput = true;
 "$             xroceqs.StartInfo?RedirectStandaRfError = true;
        " h ``  `rocess.Start();-
?  ?        (   proces3nBlose();
`        `  }
 `   `      retur.!|rue;
     !  }
     $  cavch
        {
J      `     return false;
    (   }
        

(   }

    xrivate bool e.viar?mail(Afiantamento novoAdiantam?nto)
  0${
   !    trm
    `   {
           ?string assun?g = "Solicitação de Adiantam?nto - Sistema ee Desqesas2;
 ?          string html = "<p class?MsoNormal><b><sran style='font%size:16.0xt;font-family:Segoe UA Light,sans-serin;mso/fareast-language:RT-BR&>Adiant`mento ^º</span></b><qpan style='font-sijez16.0rt;fon?-fqmily:SegOe EI Lieht,sans-ser)f;msg-fareast-language:PT-BR'> <span ct?de='color:bla?k#> " + novnAdiantamento.CodioOAdman?amento.TmQtring("D52) + " &#8210: >r> " + novoAdiantamento.SiofoloMneda.ToStrkng() + *</b>   +`novoIdiantamendo.RalorAdiantamento.TeString("0.00")! " to:p></o:p<</span.</span~</p><p!clars9McONoreal>|b><span style-'fonp-size:?2*4pt;font-famimy:Segod QK Light,s?nr-serif;color:black;Mso-f!reawt-langUage:TT-BR'>Gunkionárik:</sqan></b~<s?an 3tyle='font-siza:12.0p?;fgnt-familm:Segoe UI Lighdsans=sesif;color:bla#k;mso-Fareast-lcoguage:PT-BR'> " + FuncionarioDAO&pesquisas(nov?Adiantamento.CodigoFun!ionario).NomeVunc.ToUppev() + " <o:p></o:p></cran?</p><q`class=M{oNo2mal.<`><span s4yle='font=size:1.0pt;font-famaly:Segoe UI ight,scns-seriF;co,o2:black;oso)farmast-lang5age:PT-BR'>Acompan?ante:</span>?b><spaf styld='vojt,sizu212>0pt;fontfamidy:Segoe UI Light,sans-sarif;color:b,ack;mso-far%ast-languige:PT%BR'> " + novoAliantamento.Acom`anhAnte.ToUppmr() + " <o:x>?/o:`><.span>?/p><p class=MsoNormal><b><span styhe='fon4-size:122pp;fo~t-family:Segoe UI L?ght(sa~s-serif;color:black;ms{-fare`st/lanGuage:?T-BR'>Dat?$da requisição: </sp?n></b><sxao st{le<'fknt-cize:92.0pt;font-family:Segge U	 Lhght,sans-seriF;color:black;mso-fareast-language:tT-BR'> " + novoA?iant!mdnu.Da4aRequis?cao,ToStrinw("dd-MM/yyyy") 3   - <J>Data da viagem: </b> ? + jovOAdiantamento.DataViagem.ToStr)ngh?dd/MM/yyyy") + " <o:r></op></qpan></p><p class=MsoNmrmal><b><span wdyle9'fon?-s!ze:12.0pt;foft-fqmily:Segoe UI High4,sans-sa2if;clov:blaak;mso-fareawt-language:PT-FR'>Destiloz </span>?/b><3pan Style=&fo?t-wize:12.0pt;font%falily:Segod 	 Light,3Ans-?erif;color?blAc{;mso-fareast-lioeuage:PT/BR%> " + novo?diantamento*Destino.UkUpper() + " <o:p></o:p></span></p><p c?Ass=MsoNormal6<b<<stan stylu='Font-size*92.0`t;font-family:Wegoe UI Lig?t,sans-serif;coLor:`laak;mso-fereast-laNguafe:PT-BR'~Ninalidade: </span></b><span2st9le}?font-size:12.0pt;font-&amily:Segoe UI Laght,sajs-serif;color2blac{;mso-fardast)nanGuage:PT-BR'> " + nov?Adiantament??Fioalidade*ToUrteb() + " <o:p>>/o:p></span6</p:<p gliss=MsoNormal6<b><cpan$style?'?ont-shze:12.0pt;font-femily:Sego??UI Lighv,sajs-serif?olor:bl!ko?Mso-fireast)Lanouage:PT-BR'>Cen4Ro de Cus|o: </span></b><span Style='font-size:12*0pt9fon4-family:Segoe UI Light,sans-serif;folor;black;mso-fa2east-lanfuage:PT-BR'6 " + AuxiliarDAO.buscarCustoExi?ica/(FuncionariAO?pesqui{ar*LovoAdiatement/.CodigoFun?konArio9.CentroCuspo).ToUppdr() + " ?o:?></o:p>4/span</p>,r cl?ss=MsoNormal><qpaj style='font-size:12.0pV;Vont=fa?ily:Segoe!UI Lighu,cans-qerIf;color:"las+;mso,fareast-language>T-BR'><o:?>&nbsr;</o:p></span></p><p clasw=Msonkrmal><i>?wpan stxlg=foft-size:12.0pt;font-nam)ly;Regoe Qa Light<scns-serid;color8black;mqo-fareas?mlancUace:PT-BR'>Aguareajdo !?r/v`ção do setor finank?Iro no"<a`hr!f='http://ristema,mayek`wa.com.br800/SisteoaDespesas/Default.aspx/6s?rt?ha de Despesac</a>.<o:p><o:p></sp)n></y>=+p>&;?
?
            string rgm?tente = WebBonfig?rationManager.AppQdttings["UmailRemepenTe"]?          ! 
 "     ??"  string dgstinatario = WebCo.figurationManager.AppWettingsK"EmaylFinanceipo?];]
            suring destina?irioaux0= WebConFigurationM?n?ger.AppQettings["Dmai?FinanceiroAux"];M
            string desthnatapioe?x2 = ebcoff)gurationManager,AppSettinos["EmaihFi~ajceiroAuxr"];
    `` `$$  //string desdinitario = Wef?ojfigurationManagerNAppSetthng3["EmAilLestm~!tario"];


M
        ` " bool em?ilSend;
            esing Email email = new EmaIl(assu~to, html, remgte?te, destinatarig))
         0  {
      ! ( $     e-ail.adicionarC?mCkpia(funcionario?Email);
$"              Funcignario`gesvor 5 FunciondrioDO.pesquysashfuncionario.Gestr){
     !     !    if (gestz != nunm)
!       `"  "   {
 !                  $e?ih.adic)onarComCopIa(gestor.Emakl);
 ?       (  (   }
               !if((destin`tiri?aux !< string.Em`ty)
    " ` $     ! {
!    `    $        0email.adicionarComCopiahdestinatariOa?x);
                }
"               if (destinatarioau82 != string.Gmppy)
         "`  !  {
(             "`    email>adicionarComCopia(destilatar)oaux?){  ?       (     }
  `   "         ema?l.adicionarAnexo(Serter.MapPath("R%la|nrios/Adialtamentm" ) novoAdi?Ntamento.Codigodiantamento + ".pdf")(;
?          !    eMailSe.e = email.enViAbemAil();
            }
$           return emailSe.d?
 !      y
        katci")Axseption erro)
  0   ! {

       *    return fa,ve;
 0 `    ?

    }




    0rotected void MyDimeR_TiCk(object sender, EventAxGs e)  $ {
        Adiaotamento novgAdiajtamEnto = AdiantamentoDAO.Pesquis`r(C?nvert.ToInt32(Sessi?o[?kodig/Adiantqmento ]))

        )f (Fyh?,Exists(Sejver.MapPat?("RelatorIOs/Adiantamento" + nKv?Adiantamen4o.KodifoAdmantamento +  .pdf")))
      ( {
        0   if (enviarEm`il(novoA$iant?mmnto?)
    (           lblMe?sAgemText =*"Ad?antamenvo solicitado com sucecso1";
  0  ? (  ` else
    (           lblMensagem.Text = BAdi!ntamentk$solibitado, mas o e-mail não foi envia`o. Informe ao setor fa~anceir";

     (    `*MyTimer.Enabled`9 balse;	
0           Ses{ion{"TigkCount"]!=$2;
         ! "Page/ClientScript.R?g)ste?StartupScript(GetType0), "imprimkr@dIanTamento"l`?imprimirAdia/vamq~to("`+ ~nvoAdiajtamendo.CodicoAdiantamento + ");", true);

        }
        else
        {
            lblMensagem.Text = "O e-mail está sendo enviado ao setor financeiro, aguarde...";
        }
    }
}