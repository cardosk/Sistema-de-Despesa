using System;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Web.UI;
using iTextSharp.text.html.simpleparser;
using System.Collections.Generic;
using System.Net;

/// <summary>
/// Comentário: Rubens Maroti Filho. 02/10/2017
/// Para impressão do relatório em PDF, foi utilizado a biblioteca do iTextSharp
/// Ela consiste em desenhar o PDF, linha por linha, do que será exibido.
/// 
/// Para manutenção: 
/// - Sempre que for editada ou criada uma nova categoria de despesa no banco, ir no método geraPDF() e ir na region "Categorias" para buscar pelo o que há de ser editado
/// - Se houver mudanças no cabeçalho do relatório, criar o objeto no aspx (ImprimirDespesa.aspx) e dele referenciar neste código
/// </summary>
public partial class ImprimirDespesa : System.Web.UI.Page
{
    List<string> listaDatas = new List<string>();
    List<Adicional> listaDespesa = new List<Adicional>();
    List<double> listaSubTotal = new List<double>();
    string nomePDF;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Verifica se está autenticado
        Funcionario func = (Funcionario)Session["funcionario"];
        if (func == null)
        {
            Response.Redirect("Default.aspx");
        }

        //Recupera o número da despesa
        int numeroDespesa = 0;
        try
        {
            numeroDespesa = Convert.ToInt32(Session["numeroDespesa"].ToString());
        }
        catch
        {
        }
        lblNumero.Text = numeroDespesa.ToString();

        //Dados da despesa
        Despesa despesa = new Despesa();
        Funcionario funcionario = new Funcionario();
        if (numeroDespesa > 0)
        {
            despesa = DespesaDAO.pesquisar(numeroDespesa);
            if (despesa != null)
            {
                lblAcompanhante.Text = despesa.Acompanhante;
                lblData.Text = despesa.Data.Substring(0, 10).ToString();
                lblDestino.Text = despesa.Destino;
                lblAcompanhante.Text = despesa.Acompanhante;
                lblFinalidade.Text = despesa.Finalidade;
                lblMB.Text = despesa.Mb;
                lblAdiantamento.Text = despesa.Adiantamento.ToString("N2");
                lblMoeda.Text = despesa.Moeda;

                //Dados do funcionário
                funcionario = FuncionarioDAO.pesquisar(despesa.RegistroFunc);
                if (funcionario != null)
                {
                    //lblEmpresa.Text = funcionario.Empresa;
                    lblEmpresa.Text = AuxiliarDAO.pesquisarEmpresa(funcionario.Empresa).ToUpper();

                    lblNome.Text = funcionario.NomeFunc;
                    lblCPF.Text = funcionario.CPF;
                    lblCentroCusto.Text = AuxiliarDAO.buscarCustoExibicao(funcionario.CentroCusto);
                    lblBanco.Text = AuxiliarDAO.pesquisarBanco(funcionario.Banco);
                    lblAgencia.Text = funcionario.Agencia;
                    lblContaCorrente.Text = funcionario.ContaCorrente;
                    lblTipoConta.Text = AuxiliarDAO.pesquisaTipoConta(funcionario.TipoConta.ToString());
                    lblCodAX.Text = func.Codax;
                    lblGrupo.Text = AuxiliarDAO.pesquisarGrupo(func.Grupo);
                    lblRegistro.Text = funcionario.RegistroFunc.ToString();
                }

                double totalDespesas = DespesaDAO.totalValorItensdeUmaDespesa(numeroDespesa);
                lblTotalDespesas.Text = String.Format("{0:N}", totalDespesas);

                double saldo = totalDespesas - despesa.Adiantamento;

                //Se saldo positivo, então receber
                if (saldo > 0)
                {
                    lblSaldoDevolver.Text = String.Format("{0:N}", "0,00");
                    lblSaldoReceber.Text = String.Format("{0:N}", saldo);
                }
                else if (saldo < 0)
                {
                    lblSaldoDevolver.Tmx? = Strang.GOrmat("{0:N}"< seldo *(-1);
    0 0             mblSeldoRec?ber.Text = String.Fo2mat("{0:N|", "0,00");?
    j( (        =
                elw%
0  ? !  ?     b {
     (  1         ? lbl?aldoDevo?var.Tex4 ="Stri?g.Fgrmat("{0?N|", "0,0p");
b      "   0        lblSaldoReceber.Text?= String.Format("{0:N}", "1,00"9?
 ! !       "    }
?        !  ?
     $  }

  !     geraPDFh);

    }0   protected v/id dlCategopicsDesxesas_ItemDauaBounf(object sdn$er, System>Web.UI?ebConprols.DatAListI4emEventArGs e)M
$   s
   )    acel lblcategopia =`(Label)e.ITem.FinlIontro,("CodigoLabel");

$       strhng codigwCatuGor)aDespeca = "0";
        co$ieoCategoriqDespesa = ,blCategoria.Tmxt?

        SqLDataSousce sql@ataSourceD?spesas = (Sql@aTaSourcq)e.Mtem.FindControl8"SqlDat`SourceDespesas");
    !   sqlD!?aSourceDespesaw.SelectRarame~e?s>Cleqr();
 0     `sqlDAtaSour#eDdspesas.SelectPAr!meters.Add(""$ codigoCategoriaDespe3a)+
        sqlData[ourkeDespesis.dataBind();
    ]
    protecve% vo)d dlDespesaDqtas_itemD?taound(nbject sender, DAtaLi3tItemEventArgs a)
    {
        af (e.Item.ItgeTyhe <=(LisuItemType.Atem || e.Item.KuemTy0e$== ListIteeType.AluernatangItEm)
   0!   {
          `$La"ul DataLabel = e?item.FiodControl("?Ata") as Label;
*    `       list!atas.Add(DapaLcbel.Text);
        }
  ( }
?($  protectud vid GridViewDesre{es_R?wadaBound(object sender, GridVi%wRowEvenvArgs e)
    {J        i? (?.Row.RwType"== DataControlRowType.DauaRow)
  (     {
         (0 Adicional(a = new dicional();

        ( 0 La"el"LafelOvdem = e.Ros.FindCo~tro,("LabelOrdmm") as LarEl;            Label LabeL = e/Row.FindContbon("LabeL") as"Label;J !!0        Lafel LabelDesre{a = e.Row.Fin?Control("lblDespesa"	 as Labeh;
      ( "   Label LabmlValor 5 e/Row.FindC?ntrol("lblValor") as Label??
 0       $  e.Ordem =!1;
            aDada ? Convert.?oDateTime(LabeL.Text);
   "      ` c.Despes`!= LabelDespesa.Pext;
      "     c.Valor =!Convert.T?Dgubl?(LqbglVano2,Text);M

        (   int con|role = 0;

            foRgakh (Adicional b in listaDespesa9
      ?     {
         `      i" (b.Despesa == a.Lespesa && b.Data == a.Data)
  (             {
 !         ?    `   b.ValOr = b.Valor + a.Valor;
           !        controne =?1;
   $    `           br%ak;
?   "     !  `  }`           }
       ! $  if@(controle"== 0-
 "              nistaDes?esa.Add(a(;
   0    }
    }-

    prouectgd void$dlDespesaSub\otaiq_ItemDA|aBou.d(objeCt"sender, DataListI4emEventAbgs E)
" ` ;
        if (e.Item.Ite?ype ?= LiStItemTyte.Item l| e.Item.ItemType == Li3titgitype.AlVernatingItem-
     `  {
  ` $     ( LAbel SubTtalLab%l = e.Ital.FyndControl,"?ubTotal") as0Label;
       ?  ( listaSuftotal.add(Convert.ToDoub,e(SubTotq|?cb%l.Teyt));
 !   "$ =
    }
0   private?voif0ge2?PdF()
    {E
     ?0 pRy
`       {
  " "   &"("List<ItemDespesa> listaHdEms = ?temDespusaD?O.pesqeIsap(Convert.ToInt32(lblNu-Ero.Text));

    ?    $  dd@espesadatas.Dcuaind();
  (?!       GridVi%wDerpesesF?nal.EataBind();
   "    0   dlDespesaSubTotais.DaTaBiod(); $          Folt arjamAssi.atura = FontFectory+GetFont( Arial", 34, 1, iTextSharp.dext
Ba{eCol?r'BLACK);
            Font !riALTmpo$= DontFectory?GetFont("Arial". 20);
            Font ariqlNegri?o = NontFac4ory.GetFont "Araal"- 7, 1 i?eptSharp.te?t.BaseColor.BLKCK-;
"           Fonu Arial = FondFactori.GetF/Nd("Arial", 10);
      ?     Font arial9 = GOntactoryoGetFo?t("Arial",09);
  (     `  Font arialxNewrmto = Font?ictory.Ge|Bont)"Arial", < 1, iTehtSharp.taxt.BaseColor?BLC)
           !Font Arial12 = FontFactnry.GetFolt("Arial, 12, 1,!iVextSharp.text.BeseColor.B\AcK);
   $        Font as?al8 = FontFactory.Ge4Font8&Asialb, 8, 0. iTextSharp.text.aseCglorBLACK);
0       ?   using (StrIngWriTer sw = new StringWridgp())
   $ " !    y
"(              using (HtmlTextWriter hw = new HtmlTgxtWriter(sw))
     "$      (  {	J    08       ("     Memorysuream ms = new MumoryStream();-

                    string jewFile ? Serwer.MapPath+/Relatoryos/" +  KmprimirDespesa" + lblNumero.\ext + #.pd?2);
 0   ? `      (   !~omepDN = newFide;
          `         QtsmngReader sr =(new StringReader(sw.ToString());
? ?(    0$          Dkcumant pdfDoc = neu Docqmen4(PAgeSkzE.A4*Rotate(), 10, 10, 10, 0);*         @  ?  $  ( HTMLWorker hdmlparser = new?@TMLWorker?pdfDoc);
                    usang (DileCtream strdam = new Filestream(newFile, FileMode.Cruate))
  0  !     $        {
               0        P?fWriter.GetInstanCe(pdfDok, stream);?
    0      (!           PdfWri4er.GetInstance(pdfLoc, ResponsE.OttputStrea-);  "             !      PdfWriter w = PlfWriter.EetInstAnca(rd&Doc- ms);
!                 00   !pdfDoc.Kpen();
 `      $    !    (     string imageURL =$SErver.MapPath("~/Im?'en?'cabgcalho.png");
 0  !        (          iTextSharp?text.Image jpg0=?iTextSharp.te8t.ImawenGetI?stance(imagwURL);       !           (    jpg.ScaheToFit(160f, 32v;
  0 ?"              $ ! Jtg.SpaCingBefore = ?2f;
    ?        0          jpg.Sp?kingCfter = 1f:J"           !  $ ($@    jpg.lignment = Element.AL	FN_VIGHT;
?                       pdfDoc.Ae$(jpg);
              $  !"     /?pefDoc.Add?new aragraph" *));
                  !     P?fPT?bhe tabela = new PdfPTable(3);
(` ?       "   `   ?    tabela.Horijonta?Al)gnmeft = Dleme.t.ALIGN_RIGXT;
  !        (           ?tabeda.T-Valieth = 250f;
     1    p   $  (      dafela.Wi`thPercunteg% = 1 0;
                 (      f,oat[]!widths = new floatC] { 2fl"<f`};
   #         $       $$ tAbela.SetWidths(widths){
              ( `  (0  !tabElA,HorizgntalAlignmend } 1;J
        (          0  $ #r?gion0Caveçalio PDF
         `             !Pdf?Cell cell1 = new PdfPCell(nmw PHbase(lblEmpre{a.Text, arial8Neerito9);-*     ?             "    celm0.BOr?er =!1#?
    (    `         ! !  cell0/FixedHekght = 10;
 !  ? ?    (       0$ $ celm0.bmrderWidth = 1;
           $$       $  (cehm0.Colspan?= 2;
           "          ? cell0.HorizonvalAligjment = 1;
                        tabela.EefAell(cell0);
   `      `         `   PdfPCell cell1`= new PdfCell(new Phrase(Label2.Tgxt, arial8Negrito));
 $!  h     *"   0    !  jell1.Border?= 14;
          !            Cell1.BorDerWidth =?1;
                        cell1.C?lspan = 23
 $    `?                gell1.?oR)zo~talClig?m?nt =!1;
   8       "     `      tabela>AldAEll(cell1I;
   "                    //Cell 2.$               (     ? Ph?ase p2 = new Phrasg();
  (      $$  $    ?    0Chunk NumeroNegrito = new ChunK("@esresa Nʺ: "? arial8Negrito(;                        ChunJ LabelNumero ? ~uw Chun+)lblNumero.text?+ "     ", ariqlx);-
         $`    "     ?  ChunK DataNegzitO 5 jew Chunj("Data: ", arial8Negritg);?"   `             $  !  Chunk LabelData = ne KhtnK(lblData.Text + "     2, arial9);
  0                     Chunk NomeNegrito = new Chunk("Nome: ", arm!l9Negri4o);
         !              Siunk La?elNome - new Chunc(lBlNome>Text$+ "     2, arial8);
  !              ?   "0 Chunc RegisproNegzi$o$= new Chunk("Registro: ",$ajial8NegzatK);?
           ? ` ( ?      ChuOk LabelRegi?tro = new Ch}nk(lrlRegiqtpo.Text + "     ", qrial:);
      ?           ?     Chunk CPFNecrato = new hunk)"CPF: ", ariad8Negrato);
                        Chun+ LabelCPF!= new Ciufj(lblCPF?Tmxt + "     ",`a?i!l8)3
           0            Khunk CentroNegvito = new Ch?nk("Centro de Custo: ", arial?Oegrytk);
              0         Chunk l`belCent2o = new chunk(lblCentroCusto.Text + "     ", arial8);
      (                 //hunk CodAXNegriTo =!nev Chunjh"C??d.(AX:&"? arhal8Nefrito(;
        (           0   Chunk labe?CodAX = ne? Chufk(lblCodA>text + " ^ "? Arial8-:
           ?            //Chunk Gru?mNegri|o 9 new Ghunk("Grupo: ", ariaL8Negpito);
   "!      `   $        Chunk LabelGrupo = ne7 Chunk(lblGrupo.TExt. azial8);?
  "  `              `   p2.Add(NumeroNegri}o);
 ?                   ` $p2.Aed(LabelNumerk	;
? `                    p:.A$D(TataNegrit?);
    ?    $ "   0  0     p2.AdD(L`belData);
           0            p2.Add(NoMeNegrito);
                        p2.Add(LabelNome);
                        p2.Add(RegistroNegrito);
                        p2.Add(LabelRegistro);
                        p2.Add(CPFNegrito);
                        p2.Add(LabelCPF);
                        p2.Add(CentroNegrito);
                        p2.Add(LabelCentro);
                        //p2.Add(CodAXNegrito);
                        p2.Add(LabelCodAX);
                        //p2.Add(GrupoNegrito);
                        p2.Add(LabelGrupo);
                        PdfPCell cell2 = new PdfPCell(p2);
                        cell2.Border = 15;
                        cell2.BorderWidth = 1;
                        cell2.Colspan = 2;
                        cell2.HorizontalAlignment = 1;
                        tabela.AddCell(cell2);
                        //Cell 3
                        Phrase p3 = new Phrase();
                        Chunk BancoNegrito = new Chunk("Banco: ", arial8Negrito);
                        Chunk LabelBanco = new Chunk(lblBanco.Text + "     ", arial8);
                        Chunk AgenciaNegrito = new Chunk("Agência: ", arial8Negrito);
                        Chunk LabelAgencia = new Chunk(lblAgencia.Text + "     ", arial8);
                        Chunk ContaNegrito = new Chunk("Conta corrente: ", arial8Negrito);
                        Chunk LabelConta = new Chunk(lblContaCorrente.Text + "     ", arial8);
                        Chunk TipoContaNegrito = new Chunk("Tipo de Conta: ", arial8Negrito);
                        Chunk LabelTipoConta = new Chunk(lblTipoConta.Text + "     ", arial8);
                        p3.Add(BancoNegrito);
                        p3.Add(LabelBanco);
                        p3.Add(AgenciaNegrito);
                        p3.Add(LabelAgencia);
                        p3.Add(ContaNegrito);
                        p3.Add(LabelConta);
                        p3.Add(TipoContaNegrito);
                        p3.Add(LabelTipoConta);
                        PdfPCell cell3 = new PdfPCell(p3);
                        cell3.Border = 15;
                        cell3.BorderWidth = 1;
                        cell3.Colspan = 2;
                        cell3.HorizontalAlignment = 1;
                        tabela.AddCell(cell3);
                        //Cell 4
                        Phrase p4 = new Phrase();
                        Chunk DestinoNegrito = new Chunk("Destino: ", arial8Negrito);
                        Chunk LabelDestino = new Chunk(lblDestino.Text + "     ", arial8);
                        Chunk AcompanhanteNegrito = new Chunk("Acompanhante: ", arial8Negrito);
                        Chunk LabelAcompanhante = new Chunk(lblAcompanhante.Text + "     ", arial8);
                        Chunk FinalidadeNegrito = new Chunk("Finalidade: ", arial8Negrito);
                        Chunk LabelFinalidade = new Chunk(lblFinalidade.Text + "     ", arial8);
                        Chunk MBNegrito = new Chunk("MB: ", arial8Negrito);
                        Chunk LabelMB = new Chunk(lblMB.Text + "     ", arial8);
                        Chunk MoedaNegrito = new Chunk("Moeda: ", arial8Negrito);
                        Chunk LabelMoeda = new Chunk(lblMoeda.Text + "     ", arial8);
                        p4.Add(DestinoNegrito);
                        p4.Add(LabelDestino);
                        p4.Add(AcompanhanteNegrito);
                        p4.Add(LabelAcompanhante);
                        p4.Add(FinalidadeNegrito);
                        p4.Add(LabelFinalidade);
                        p4.Add(MBNegrito);
                        p4.Add(LabelMB);
                        p4.Add(MoedaNegrito);
                        p4.Add(LabelMoeda);
                        
                        PdfPCell cell4 = new PdfPCell(p4);
                        cell4.Border = 15;
                        cell4.BorderWidth = 1;
                        cell4.Colspan = 2;
                        cell4.HorizontalAlignment = 1;
                        tabela.AddCell(cell4);
                        Phrase p5 = new Phrase();
                        Chunk discriminação = new Chunk("Descrição: ", arial8Negrito);
                        p5.Add(discriminação);
                        PdfPCell cell5 = new PdfPCell(p5);
                        cell5.Border = 15;
                        cell5.BorderWidth = 1;
                        cell5.Colspan = 1;
                        cell5.HorizontalAlignment = 1;
                        tabela.AddCell(cell5);
                        htmlparser.Parse(sr);
                        pdfDoc.Add(tabela);
                        #endregion

                        using (StringWriter sw2 = new StringWriter())
                        {
                            using (HtmlTextWriter hw2 = new HtmlTextWriter(sw2))
                            {
                                #region Tabela2
                                PdfPTable tabela2 = new PdfPTable(2);
                                tabela2.HorizontalAlignment = Element.ALIGN_CENTER;
                                tabela2.TotalWidth = 250f;
                                tabela2.WidthPercentage = 100;
                                float[] widths2 = new float[] { 2.4f, 4f };
                                tabela2.SetWidths(widths2);
                                PdfPCell cell6 = new PdfPCell(new Phrase("Descrição: ", arial8Negrito));
                                cell6.FixedHeight = 10;
                                //cell6.FixedHeight = 3;
                                cell6.HorizontalAlignment = 1;
                                cell6.BorderWidth = 1;
                                PdfPCell cell7 = new PdfPCell(new Phrase("", arial8));
                                cell7.BorderWidth = 1;
                                cell7.GrayFill = 0.65f;
                                //cell7.FixedHeight = 17;
                                // cell6.FixedHeight = 17;
                                tabela2.AddCell(cell6);
                                tabela2.AddCell(cell7);
                                //PdfPCell cell8 = new PdfPCell(new Phrase("Dia/Mês:"));
                                //cell8.Colspan = 1;
                                //cell8.BorderWidth = 1;
                                //cell8.HorizontalAlignment = 1;
                                //tabela2.AddCell(cell8);
                                pdfDoc.Add(tabela2);
                                //dlDespesaDatas.DataBind();
                                //dlDespesaDatas.RenderControl(hw2);  
                                //dlDespesaDatas.BorderWidth = 1;
                                StringReader sr2 = new StringReader(sw2.ToString());
                                htmlparser.Parse(sr2);
                                #endregion

                                #region Inseri Datas
                                PdfPTable tabela3 = new PdfPTable(12);
                                tabela3.HorizontalAlignment = Element.ALIGN_CENTER;
                                tabela3.TotalWidth = 250f;
                                tabela3.WidthPercentage = 100;
                                float[] widths3 = new float[] { 5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f };
                                tabela3.SetWidths(widths3);
                                int a = 0;
                                PdfPCell cell8 = new PdfPCell(new Phrase("Dia/Mês:", arial8Negrito));
                                cell8.Colspan = 2;
                                // cell8.BorderWidth = 1;
                                cell8.HorizontalAlignment = 1;
                                tabela3.AddCell(cell8);
                                do
                                {
                                    if (a < listaDatas.Count)
                                    {
                                        if (listaDatas[a].Equals(" "))
                                        {
                                            PdfPCell cell = new PdfPCell(new Phrase(" ", arial8));
                                            //cell.BorderWidth = 1;
                                            cell.HorizontalAlignment = 1;
                                            tabela3.AddCell(cell);
                                        }
                                        else
                                        {
                                            PdfPCell cell = new PdfPCell(new Phrase(listaDatas[a].ToString(), arial8Negrito));
                                            //cell.BorderWidth = 1;
                                            cell.HorizontalAlignment = 1;
                                            tabela3.AddCell(cell);
                                        }
                                    }
                                    if (a > listaDatas.Count)
                                    {
                                        PdfPCell celula = new PdfPCell(new Phrase(" ", arial8));
                                        //celula.BorderWidth = 1;
                                        celula.HorizontalAlignment = 1;
                                        tabela3.AddCell(celula);
                                    }
                                    a++;
                                }
                                while (a != 11);

                                pdfDoc.Add(tabela3);
                                #endregion

                                #region Categorias
                                PdfPTable tabela4 = new PdfPTable(12);
                                tabela4.HorizontalAlignment = Element.ALIGN_CENTER;
                                tabela4.TotalWidth = 250f;
                                tabela4.WidthPercentage = 100;
                                float[] widths4 = new float[] { 3f, 3f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f };
                                tabela4.SetWidths(widths4);
                                //Categorias e Tipos de Despesas

                                #region Combustivel e Lubrificante
                                //Combustivel e Lubrificante
                                PdfPCell Categoria1 = new PdfPCell(new Phrase("Combustível/Lubrificantes", arial8));
                                //Categoria1.BorderWidth = 1;
                                Categoria1.HorizontalAlignment = 1;
                                Categoria1.FixedHeight = 0;
                                Categoria1.VerticalAlignment = 1;
                                tabela4.AddCell(Categoria1);
                                PdfPCell Tipo1 = new PdfPCell(new Phrase("Combustível/Lubrificantes", arial8));
                                // Tipo1.BorderWidth = 1;
                                Tipo1.HorizontalAlignment = 1;
                                Categoria1.VerticalAlignment = 1;
                                tabela4.AddCell(Tipo1);
                                int contador = 0;
                                //Adicionar uma possivel despesa de Combustível/Lubrificante
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Combustível/Lubrificantes"))
                                    {
                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                decimal valor = Convert.ToDecimal(despesa.Valor);
                                                PdfPCell p = new PdfPCell(new Phrase(valor.ToString("F"), arial8));
                                                p.VerticalAlignment = 1;
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }


                                #endregion

                                #region Condução

                                //Condução

                                #region Taxi
                                PdfPCell Cat2Linha0 = new PdfPCell(new Phrase(" ", arial8));
                                Cat2Linha0.Border = 13;
                                // Cat2Linha0.BorderWidth = 1;
                                Cat2Linha0.HorizontalAlignment = 1;
                                Cat2Linha0.VerticalAlignment = 1;
                                Cat2Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat2Linha0);
                                PdfPCell Tipo2 = new PdfPCell(new Phrase("Táxi", arial8));
                                //  Tipo2.BorderWidth = 1;
                                Tipo2.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo2);
                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Táxi"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                decimal valor = Convert.ToDecimal(despesa.Valor);
                                                PdfPCell p = new PdfPCell(new Phrase(valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Onibus
                                PdfPCell Cat2Linha1 = new PdfPCell(new Phrase("Condução", arial8));
                                //Cat2Linha1.BorderWidth = 1;
                                Cat2Linha1.HorizontalAlignment = 1;
                                Cat2Linha1.Border = 12;
                                Cat2Linha1.FixedHeight = 0;
                                tabela4.AddCell(Cat2Linha1);
                                PdfPCell Tipo3 = new PdfPCell(new Phrase("Ônibus", arial8));
                                //Tipo3.BorderWidth = 1;
                                Tipo3.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo3);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Ônibus"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Aéreo
                                PdfPCell Cat2Linha3 = new PdfPCell(new Phrase(" ", arial8));
                                Cat2Linha3.Border = 14;
                                //Cat2Linha3.BorderWidth = 1;
                                Cat2Linha3.HorizontalAlignment = 1;
                                Cat2Linha3.FixedHeight = 0;
                                tabela4.AddCell(Cat2Linha3);
                                PdfPCell Tipo4 = new PdfPCell(new Phrase("Aéreo", arial8));
                                //Tipo4.BorderWidth = 1;
                                Tipo4.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo4);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Aéreo"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #endregion

                                #region Despesa com Veículo

                                #region Conserto/Reparação
                                //Categoria 3
                                //Despesas com Veiculo
                                PdfPCell Cat3Linha0 = new PdfPCell(new Phrase(" ", arial8));
                                Cat3Linha0.Border = 13;
                                //Cat3Linha0.BorderWidth = 1;
                                Cat3Linha0.HorizontalAlignment = 1;
                                Cat3Linha0.FixedHeight = 0;
                                //Cat3Linha0.BorderWidthTop = 10;
                                tabela4.AddCell(Cat2Linha0);
                                PdfPCell Tipo30 = new PdfPCell(new Phrase("Conserto/Reparação", arial8));
                                //Tipo30.BorderWidth = 1;
                                Tipo30.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo30);
                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Conserto/Reparação"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Pedágio
                                PdfPCell Cat3Linha1 = new PdfPCell(new Phrase("", arial8));
                                //Cat3Linha1.BorderWidth = 1;
                                Cat3Linha1.HorizontalAlignment = 1;
                                Cat3Linha1.Border = 12;
                                Cat3Linha1.FixedHeight = 0;
                                tabela4.AddCell(Cat3Linha1);
                                PdfPCell Tipo31 = new PdfPCell(new Phrase("Pedágio", arial8));
                                //Tipo31.BorderWidth = 1;
                                Tipo31.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo31);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Pedágio"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region IPVA/Outros
                                PdfPCell Cat3Linha2 = new PdfPCell(new Phrase("Despesas com Veículo", arial8));
                                Cat3Linha2.Border = 12;
                                //Cat3Linha2.BorderWidth = 1;
                                Cat3Linha2.HorizontalAlignment = 1;
                                Cat3Linha2.FixedHeight = 0;
                                tabela4.AddCell(Cat3Linha2);
                                PdfPCell Tipo32 = new PdfPCell(new Phrase("IPVA/Outros", arial8));
                                //Tipo32.BorderWidth = 1;
                                Tipo32.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo32);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("IPVA/Outros"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Lavagem
                                PdfPCell Cat3Linha3 = new PdfPCell(new Phrase(" ", arial8));
                                //Cat3Linha1.BorderWidth = 1;
                                Cat3Linha3.HorizontalAlignment = 1;
                                Cat3Linha3.Border = 12;
                                Cat3Linha3.FixedHeight = 0;
                                tabela4.AddCell(Cat3Linha3);
                                PdfPCell Tipo33 = new PdfPCell(new Phrase("Lavagem", arial8));
                                //Tipo30.BorderWidth = 1;
                                Tipo33.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo33);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Lavagem"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Estacionamento
                                PdfPCell Cat9Linha2 = new PdfPCell(new Phrase("", arial8));
                                Cat9Linha2.Border = 12;
                                Cat9Linha2.FixedHeight = 0;
                                // Cat9Linha2.BorderWidth = 1;
                                Cat9Linha2.HorizontalAlignment = 1;
                                tabela4.AddCell(Cat9Linha2);

                                PdfPCell Tipo92 = new PdfPCell(new Phrase("Estacionamento", arial8));
                                Tipo92.HorizontalAlignment = 1;
                                //  Tipo92.BorderWidth = 1;
                                tabela4.AddCell(Tipo92);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Estacionamento"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #endregion

                                #region Gastos Industriais

                                #region Compra Peças/Materiais
                                //Gastos Industriais
                                PdfPCell Cat4Linha0 = new PdfPCell(new Phrase(" ", arial8));
                                Cat4Linha0.Border = 13;
                                // Cat4Linha0.BorderWidth = 1;
                                Cat4Linha0.HorizontalAlignment = 1;
                                Cat4Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat4Linha0);
                                PdfPCell Tipo40 = new PdfPCell(new Phrase("Compra Peças/Materiais", arial8));
                                // Tipo40.BorderWidth = 1;
                                Tipo40.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo40);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Compra Peças/Materiais"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Usinados/Reparos para Compressor
                                PdfPCell Cat4Linha1 = new PdfPCell(new Phrase("Gastos Industriais", arial8));
                                Cat4Linha1.Border = 12;
                                //Cat4Linha1.BorderWidth = 1;
                                Cat4Linha1.HorizontalAlignment = 1;
                                Cat4Linha1.FixedHeight = 0;
                                tabela4.AddCell(Cat4Linha1);
                                PdfPCell tipo41 = new PdfPCell(new Phrase("Usinados/Reparos para Compressor", arial8));
                                // tipo41.BorderWidth = 1;
                                tipo41.HorizontalAlignment = 1;
                                tabela4.AddCell(tipo41);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Usinados/Reparos para Compressor"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Outros gastos Industriais
                                PdfPCell Cat4Linha2 = new PdfPCell(new Phrase(" ", arial8));
                                Cat4Linha2.Border = 14;
                                //Cat4Linha2.BorderWidth = 1;
                                Cat4Linha2.HorizontalAlignment = 1;
                                Cat4Linha2.FixedHeight = 0;
                                tabela4.AddCell(Cat4Linha2);
                                PdfPCell Tipo42 = new PdfPCell(new Phrase("Outros Gastos Industriais", arial8));
                                Tipo42.HorizontalAlignment = 1;
                                //Tipo42.BorderWidth = 1;
                                tabela4.AddCell(Tipo42);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Outros Gastos Industriais"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #endregion

                                #region Material de Escritorio

                                //Material de Escritório
                                PdfPCell Cat5Linha0 = new PdfPCell(new Phrase("Material de Escritório", arial8));
                                //Cat5Linha0.BorderWidth = 1;
                                Cat5Linha0.HorizontalAlignment = 1;
                                Cat5Linha0.Border = 15;
                                Cat5Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat5Linha0);
                                PdfPCell Tipo50 = new PdfPCell(new Phrase("Material de Escritório", arial8));
                                //Tipo50.BorderWidth = 1;
                                Tipo50.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo50);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Material de Escritório"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Material de Informática
                                //Material de Informática
                                PdfPCell Cat6Linha0 = new PdfPCell(new Phrase("Material de Informática", arial8));
                                // Cat6Linha0.BorderWidth = 1;
                                Cat6Linha0.HorizontalAlignment = 1;
                                Cat6Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat6Linha0);
                                PdfPCell Tipo60 = new PdfPCell(ne7 Phrase("Material le Ingobmáti#a", avia}8)(;
      0             ?(`     ?   Tkxo60>Border = 15;
                             `b //4ypo60.B/rderWidth = 1;
  (          "!?       "        Tipo60.HorizmnvalAlignment = 1;
     `                         `dabela4.A?dCell(Tip60);

  "  `                      !   cmntador"= 0;
     0   "       `         (    ?oreakh (AdiCional despesa in listaDes`eqak
   (                            {
  ?        !         ! $ 0   !      if (despesc.Desxesa == Bnnvert.ToString("Material de ??fgrmө|ica"))
                 $                  {
J    `            0     ?     0      ?$  do
     !   ?    !                   `    ?{
  (       $                                !if (tespesa.DatA.Tostring("dd/MM") == (listaDatas[contador^))
              "               ?    0    (   {
                              `   0     ($      Pd&PCell p = new$PdfPCell)lew$Txra?e(despesa.Velor.VoStr?ng("F"), arka,8));
                   4        "                   p.Horizonta|Alignmant = 1;
       $                    "  `     ` "    )   p.VerpicalAlignment = 1;
          (   `   0                         !   tabela4.AEdCall(0);  (                 0                `    !     cont?dop++?
  0   0"     0             (        0       ?   break;
 !      ` !$   0           !  (   (0$ (     }
 $ !    ?                   ! !      "      else-
             (    0        `     $          {
 ? $  $     ((      ?             (    0  !     PdfPCell p } new P`fPCell neW Phrare(" b? arial8));
0  ?   p       ? "                       $     0q.GrayFil|$= 0.0f9
        ! @               $ ! $                 tabela4.AddCell(p);
 (       `($  !      $   (     "?               gontadnr++;
   0      ` (               *               }
           (  " 0  ( 0               ?  }-
   !   0    `(?          "     ?        whilm (con|`dor!< lm?taDatas.Count);
           (  d          $        ? }
             ?              ?   }
  $         `   @               uhile (contaeoz < 10)
                  (    ?      ` {
 `$     "         ? `               Pd?PCell p = new PdfPCell(new"Phrase("$", arial8));
            $                  0    p.GrayFill = 0.90f;                             ( 0"   tabela4.Ad?Cell(p);"                            "   "  contadov)+;
  "  ?               0          =

 (           ??  0 ?            #eneregion
   "  0    !                    #segmon DespeSas Postais     ?               0          o/Despesas Postais
  ?                  "         `PdfPCmll Cat7Lioha0  new PdfPCell(.?w Phrase("Despesas Posta?s", arial8));
  "              ?       !      //Cad7Linha0.JordgrWidth } 1;
       $   "                    Cat7Linha0.HorizontadAlignment = 1;
  $      0        0      (h     Cat7Linha0.Nixedheight = 0;
             )    `             tabulq4.AddCell(Aat7Linha0);
            8       ?!          PdfPCell Ti0o78 ? n? PdfPCell(new Phrase("Despesa{?Postiis", arial8));
 (    ! !     `                 //Tipo70BorDerWidth = 9;?              $  "          &   Tipo7?.Horizmnt!lAliGnme.t = 1;
    !             0     0  `    tabela4.AddCell(Tipo70);

?                          ?    contadgr =  ;
    "          "               0foreach (Adiciknal despesa In listaDespesa)
            ?  (      $  "$ $   {
      !          !      " (      ?  id (despeSa.Despesa == Conrezp,ToString("DespusaS Postaks*))
`     ?        0       !?         ` {-

                        $     $         do
  ! ?  ?     ?    0           ( ?!   ?  
   ?    !       `$      !   `     $  ( `    in (despesa,Data.ToString "dd/MM") ?= (listaD?tas[contafor]))
  0     0`               `  "               {
           $        `          ? "        (0 ?  PdfPCenl p = new P$fPCell(nmw Phra3e(despesa.Vqhor.TOString("f"), irial8))9
   %         !                 !        ?    `  p.HoViz/ntalAlignmeNt = 1;
          1   !            ! `      (  !       !p.VerticalAlignmgnt ? 1;
   ?                        !    $       "      tare<a4.AddCell(p(;
?                    "  (               !      "contadop++;           ?         ?      $         ? (       freak;
   !     "            $              `?0    }
                          `                (else
 0   !            ?(?      0       0    $  0{?                        ?  $       $            PddPCell p = New PdfPCEll(nd Phzasd(" ", arian8))?
              !  " !                           0p?GraiFill = 0.90fk
   ?      ?      $    $              !          t?bela4.@ddCell(p);
 "              $ ?        !                    contador++;
     ?                $                 `  !}
             00                 2      !}
    0      (  "                     (   w(ile (contadjr < listeDatas.Count);
              0         0         a =
       (            !           }
       `   ?       `            while contador < 10)
  ?    `                       `{
      "                   "         PdfPCell p = new PdfPCell(new Phvasu(" ", abial8));
             `         (       "    p/Grayf)lL ? 0>90f:
         (  `0            "     ?   tabela4.AddKell(p);
           ! ?                      con4ador++;
 (                              }

                          "     #endrdgion

     "                    0     #re?ion R?fei??ões Externas

                        `  (    #regign Café
                 !      ?  `   `//Refeiç?5es Externas
        0                 `0    PdfPCell?Ce48Lin(a0 = new"PdfPCell(neu Plrase(" ", arial8));
 "                           ? 0//CAt8Linha0.BmrddrWidth = 1;
             $                  Cat8Lin(a0*Border = 13;
          ?      0              Cat8Nijha4&HOsi?ontalAhignmmlt  1;
             ? !                Cat8LinhaP.FixedHeight = 0;
                       0        tab?la4.Ad?Cell(Cet8Linha0);
   ?             "    0     (   QtFPCelH Tipo80 ="new PdfPCell(new`Ph2ase)"C?dé", arial<));
   $         !         "        Tip?80nHrizontalAlibNlent ="1;
  "? ?                          /oTipo8.borderWidpH = 1?
  (  "                0         dabeda4nAdeCell(Tipn80);

                  ( `("         contador = 0;
                     !       "  fgveach (Adicional despesa!in listaDes`esa+
            ""  "  $   $        {
$              0 1    $  ?      $   if?(desPusa.Despesa == Colvert.ToStrhng("Café"?)
             ??    " (      (     ( {
J $ !      `(                  0    (    Do
   $    `                   "           {
     $  `            `   0             !    if (de3pgra.Data.\oStringh"dD/MM2)(=? (listaDatar[cont!dor]))
   ?    !     `      " $   $                {
&    "               ? $       ?     (        ? P`fKe,l p"= new PdfPCell?new Threse(d?spesa.Valor.?oString("F")? arial?));
       `           ?    "   (                   p.HorizOntalAlignment = 19
        `   `  "             ?              0   x.VertiCqlEli/fmenp =!1;             $            $  0!  !       !      tabe,A4.AddCel?(p);
 `        !      "    !            !  "       0 condador++;
                         ?                      break;
                                            }
               "$0 0         0? !   ( ?!  ? else
                      (        !       (   "{
      !      `     $?     !                     PdfPCelL p = new PdfPCell(new PhraSe(" ",$arial8))?
 "                !         $ !   (      ?  !   p.Gra}Fil?(= 0.90&;M
   ?  $  (                     !    `       " " tgbmla4.AddCell(pi;
  (`                                     ?(`    contqdor++;
0                             (2            }
                        0    (      `  }
      !   ?      (               0! "   whil' (contAdoR | listaDatas.Count-;
   `   ?        $0    0 ?          `}
  0`    ?    !`    "            }
                     "  $    "  while0(contador < 10)
    $                      $    {
  (     !  0  !                     PgfPCell ` = new PdfPCell(new Phri3e(" ", !raal8));
  `       "  $            0         p.GrayFill = 4.90f;
                         `$  ? (  ! tabela4.EddC%ln8p(;
 #                      $           aontador++;
       $      ?    !     $      =
$                               #endregion

                                #region Almoço
                                PdfPCell Cat8Linha1 = new PdfPCell(new Phrase("Refeições", arial8));
                                // Cat8Linha1.BorderWidth = 1;
                                Cat8Linha1.Border = 12;
                                Cat8Linha1.HorizontalAlignment = 1;
                                Cat8Linha1.FixedHeight = 0;
                                tabela4.AddCell(Cat8Linha1);
                                PdfPCell Tipo81 = new PdfPCell(new Phrase("Almoço", arial8));
                                // Tipo81.BorderWidth = 1;
                                Tipo81.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo81);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Almoço"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Jantar
                                PdfPCell Cat8Linha2 = new PdfPCell(new Phrase("Externas", arial8));
                                // Cat8Linha2.BorderWidth = 1;
                                Cat8Linha2.HorizontalAlignment = 1;
                                Cat8Linha2.Border = 12;
                                Cat8Linha2.FixedHeight = 0;
                                tabela4.AddCell(Cat8Linha2);
                                PdfPCell Tipo82 = new PdfPCell(new Phrase("Jantar", arial8));
                                //  Tipo82.BorderWidth = 1;
                                Tipo82.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo82);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Jantar"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }
                                #endregion

                                #region Outras
                                PdfPCell Cat8Linha3 = new PdfPCell(new Phrase(" ", arial8));
                                // Cat8Linha1.BorderWidth = 1;
                                Cat8Linha3.Border = 12;
                                Cat8Linha3.HorizontalAlignment = 1;
                                Cat8Linha3.FixedHeight = 0;
                                tabela4.AddCell(Cat8Linha3);
                                PdfPCell Tipo83 = new PdfPCell(new Phrase("Outras", arial8));
                                // Tipo81.BorderWidth = 1;
                                Tipo83.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo83);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Outras"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                p.VerticalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #endregion

                                #region Despesas Com Viagens

                                #region Hospedagem/Hotéis
                                //Despesas com Viagens
                                PdfPCell Cat9Linha0 = new PdfPCell(new Phrase(" ", arial8));
                                Cat9Linha0.Border = 13;
                                Cat9Linha0.HorizontalAlignment = 1;
                                Cat9Linha0.FixedHeight = 0;
                                // Cat9Linha0.BorderWidth = 1;
                                tabela4.AddCell(Cat9Linha0);
                                PdfPCell Tipo90 = new PdfPCell(new Phrase("Hospedagem/Hotéis", arial8));
                                // Tipo90.BorderWidth = 1;
                                Tipo90.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo90);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Hospedagem/Hotéis"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Lavanderia
                                PdfPCell Cat9Linha3 = new PdfPCell(new Phrase("Despesas", arial8));
                                // Cat9Linha3.BorderWidth = 1;
                                Cat9Linha3.HorizontalAlignment = 1;
                                Cat9Linha3.Border = 12;
                                Cat9Linha3.FixedHeight = 0;
                                tabela4.AddCell(Cat9Linha3);


                                PdfPCell Tipo93 = new PdfPCell(new Phrase("Lavanderia", arial8));
                                //  Tipo93.BorderWidth = 1;
                                Tipo93.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo93);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Lavanderia"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Outras despesas com viagem
                                PdfPCell Cat9Linha4 = new PdfPCell(new Phrase("com Viagem", arial8));
                                Cat9Linha4.Border = 12;
                                Cat9Linha4.HorizontalAlignment = 1;
                                Cat9Linha4.FixedHeight = 0;
                                //  Cat9Linha4.BorderWidth = 1;
                                tabela4.AddCell(Cat9Linha4);

                                PdfPCell Tipo94 = new PdfPCell(new Phrase("Outras Despesas de Viagem", arial8));
                                //  Tipo94.BorderWidth = 1;
                                Tipo94.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo94);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Outras Despesas de Viagem"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Kilometragem
                                PdfPCell Cat9Linha5 = new PdfPCell(new Phrase(" ", arial8));
                                Cat9Linha5.Border = 14;
                                // Cat9Linha5.BorderWidth = 1;
                                Cat9Linha5.HorizontalAlignment = 1;
                                Cat9Linha5.FixedHeight = 0;
                                tabela4.AddCell(Cat9Linha5);
                                PdfPCell Tipo95 = new PdfPCell(new Phrase("Kilometragem", arial8));
                                //  Tipo95.BorderWidth = 1;
                                Tipo95.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo95);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Kilometragem"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion
                                #endregion

                                /*#region Serviços Telefonicos 
                                //Combustivel e Lubrificante
                                PdfPCell Categoria10 = new PdfPCell(new Phrase("Serviços Telefònicos", arial8));
                                //Categoria1.BorderWidth = 1;
                                Categoria10.HorizontalAlignment = 1;
                                Categoria10.FixedHeight = 0;
                                Categoria10.VerticalAlignment = 1;
                                tabela4.AddCell(Categoria10);
                                PdfPCell Tipo91 = new PdfPCell(new Phrase("Telefones/E-mail", arial8));
                                Tipo91.HorizontalAlignment = 1;
                                // Tipo91.BorderWidth = 1;
                                tabela4.AddCell(Tipo91);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Telefones/E-mail"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }


                                #endregion*/

                                #region Frete
                                PdfPCell Categoria10 = new PdfPCell(new Phrase("Frete", arial8));
                                //Categoria1.BorderWidth = 1;
                                Categoria10.HorizontalAlignment = 1;
                                Categoria10.FixedHeight = 0;
                                Categoria10.VerticalAlignment = 1;
                                tabela4.AddCell(Categoria10);
                                PdfPCell Tipo91 = new PdfPCell(new Phrase("Frete", arial8));
                                Tipo91.HorizontalAlignment = 1;
                                // Tipo91.BorderWidth = 1;
                                tabela4.AddCell(Tipo91);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Frete"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }


                                #endregion

                                #region Brindes
                                //Brindes
                                PdfPCell Cat10Linha0 = new PdfPCell(new Phrase("Brindes", arial8));
                                Cat10Linha0.HorizontalAlignment = 1;
                                //  Cat10Linha0.BorderWidth = 1;
                                Cat10Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat10Linha0);
                                PdfPCell Tipo10 = new PdfPCell(new Phrase("Presentes/Doações", arial8));
                                //  Tipo10.BorderWidth = 1;
                                Tipo10.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo10);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Presentes/Doações"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Despesas não Detutíveis
                                //Despesas não Detutíveis
                                PdfPCell Cat11Linha0 = new PdfPCell(new Phrase("Despesas não Dedutíveis", arial8));
                                //  Cat11Linha0.BorderWidth = 1;
                                Cat11Linha0.HorizontalAlignment = 1;
                                Cat11Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat11Linha0);
                                PdfPCell Tipo110 = new PdfPCell(new Phrase("Não Autorizado", arial8));
                                //  Tipo110.BorderWidth = 1;
                                Tipo110.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo110);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Não Autorizado"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Conservação e Manutenção

                                #region Limpeza
                                //Conservação e Manutenção

                                PdfPCell Cat12Linha0 = new PdfPCell(new Phrase("Conservação e", arial8));
                                //    Cat12Linha0.BorderWidth = 1;
                                Cat12Linha0.Border = 13;
                                Cat12Linha0.HorizontalAlignment = 1;
                                Cat12Linha0.FixedHeight = 0;
                                tabela4.AddCell(Cat12Linha0);
                                PdfPCell Tipo120 = new PdfPCell(new Phrase("Serviço de Limpeza", arial8));
                                //    Tipo120.BorderWidth = 1;
                                Tipo120.HorizontalAlignment = 1;
                                tabela4.AddCell(Tipo120);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Serviço de Limpeza"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToS4ring( F"), arial0));
                   0  0            `            p.H/ri~o?talAlign-e?t = 1;
` ? (            `"        "            "       tabela4.AddCell(p+;J    `                ?                 (!      0contad/r++;
        1$  !  (     `                 0    `   bru!k;                    $      ` !      ?       }?
   ?    (  `   (! `     0      $   "       `else?  "       $            0    `        $    ({      (                                      `  PdfPCell p = new PdfPCdlh(nEw Phrase(" ", ar?al0));
  ?           (                ?                p.GrayFall = 0.)0f;
$        0"        (      ?   "         !   ?   ?abela4.AddCell(p);
    $   $      ? (            "0                contadoR)+:
  $$     !   ?        $              !   0 }
 ?   "    (" (                 "        }?
              !         ??       `      wxide (contAfor 8 listaDatac.Count)/
   `  !     ?                       }
 ?d           "       !?     " $}
0    $             ( (          w`ile (contad?r < 30)
     0            "             {                 !                  PdfPCe,l!p = new TdfPCelL(nes Phrasa ", arial8));
    0                      "   `  $ p.OrayFill } 0.)0f;
       !  $       "    $"      ``?  taBela4.addCenl(p);
      "   0  ?                      contaDor++;
       0  $      $  !  ?      ? }

"     0                       0 #endregion

            $   0     "     ?   #rdgion Utensílios/Escritório
   `   $   " ?      $        "0 PdfPCell Cqt12LInha1?= jew PdfPCeld(new Qhrase(?Manutenããk", arial8));
            0                 " //  (CaT12Linh?1/BozderWidth`= 1;
      ?    ?                    Cat92Li?ha1.Bordes = 12;M   " "              $     `"    Sat12Linha1.Ho?izontalAlagnment = 1;
?   "       ` !  ` `     !  (   Cat16Linha1*Fixe?Height  0:
            "       !  ?     $  tabela4.Ad$Cell(Cat12Linhq1);
              $  `       ?      PdfPCell T?po#21 = new PdfPCell(nuw(Phrcse("Ut?fsílioS/Escritório", arial8)-;
          $ *   ?         (   ? Vmpo121.?orizontalAlign-ent = 1{
         & 0    ?         "     /?    TipO121.BorderWifth = 1;
          "           $  !      tab%la4.qddA%ll(Tipo121);

      "         0 (             cnndador =$p;                  (        ?    foreach (digionah de;pesa in$??staDespe{a)
"        `   $                  {?     (                      0p"     if?(despesc/Fespesa == Convmrt.ToStrk~g8"Ute.sílyowoEscritório"	)
  `         (   ?   `              [-

            !   !      " ( $ (`         ?
 ( (  !           $(            `$      {
!            0 ?     ?""  0          ! !  `?if (desqEsa.Data.ToString(?td/MM&) 5= (lisvaDatas[condador])9             `   ?                  "     ` {J  `  " $                                        PdfPCell p ? jaw PtfPCell(few(Phrase(despes?.Valor.To?tring("F"-, arial8))?
   $0                       `      1 * ?"   ?   p.HorIzontalA|igneent = 13
   "  `               !          `   !  (!   `  |pbela$.AddCell(p);
 "             8                 ?         0 p  contador+k;
          !  "     ( 0                `    "    ?rg`k3
      0             a           $"          }
 ?? ?    (      " ?   0"   `  0  "   ?    ( m,se
0      ?         0             (            [
 *   (           ?    !(          (     !       PdfPCelm p = new PdfCahL(new Phrase("  , arhAn8-);
                 0                     " 0  ?   p.G?ayFill = 0.94f?
    !      h          $     "     $            `tabudq4.AddCell(p);
  0            !   0                "           c?npqdkr?+
 `  "?   (                 0                ?
                           ` `        `"}
                   (  ?  "          $  ?while (coftadop <"listaada?.Cont	;
$      `       ( !  (               }	
   $                      `     }
 0              !            $  while (cgntador < 10)
  !              ( "          " {M
(     "   $     "               $   RdfRCelh p = new0PdfPCell(new Phvase(" ", arial8))?
$                   (           0   p.GrayFill = 4.=0f;
             ?   0    ?   "       ? tabela6.AddCe,l(p);
 ?     !     !               0  (  contador++;*       )     ?        (   !(  !`}
   "   ?             $       $  cendregion

            "                   #endreG)on

         (  "           ?       #region FornecedorM
     $                         //Fovnecedkr
            $  " "        !   ? PdfPCmll`Bat53Linha0 =`new PdfPCell(new?Phrdse("Fornecedor"-$arkaL8?)?
  !         !      $        ? ??//   Ci413Hinia2.bo2dmrVidtx = 3;
    `    ("      `         0    ?at13Linha8.HgrizontalAlignment = 1;
       `    `   `      *(       Ca|q3Linla0.FixedH?ight= 0:
    ?       ! 0        ( !!    at!bEl!4.AddCell(CaT13Linja0);
?   ?      0      ? 0     (     PdfPCell Tipo130 = new(PdfPCell(new Phra{e("rne#edor com NF"l ariql?));
            ?                ? //  Tiro130.BorderWidph = 1;
              ? "$      (       Thpo130.orizont?lAlignmen? =!1
                                tabelq4.AddCell8TyPo130?;

(?       `               $(     contadov = 0;
       ?"    $       $          fore!ch (Adicional tewxesa in listaDespgsa)
 "      !                     ? k
  (       1( !    $ $        `      if (despesa?LespesA == Cofvert.ToStr)ng("Forne3edor0com Nd"9)
 ?`(        `   # 0     `           {?
           `    "(`              `      do
             (       ` $0     `$       `{   ?                    " "   `        !0   if *despesa?Data.ToString("dd/OM")!?= (|istaDatas[contador]))
     !       ( `  !       "     ?         ? {-                        0        $ ! " " !      PdfPCell p = n?w PdfPmll(nuu Phrase(tespes!.Valor.ToStrIng("F"), arial));?
                    `        `   $    " ( ""    p.HorizontalAlig?mejt = 1?
                `       ?     "   !   ?    0    tab%la4.AddCell(p-;J             ?          `  "       !$ 0       ?(gmntador/*;
      0  `       0 $   (         "    0        nrdak;
   `    ?       @?     0(               0   }
"  0           "  (                  " #    else
            (           "   a     "         {
       $        !           !      $          $ PlfPCell p0=!new PdfPCell(new Phsaye(" "l `ria,x));
          %       "      ?        (  `   `     p?GrAyFmL? 9 0.90f;
           ?       "         $      p   0 0     tabe$a4.AddC%ll(x9;
   "                 ` "    ?      $           ?contador++;*?   ?       ??   0            `     ?(  (   |
0     (   ?      ! !       "            }
 !0   `  !         "       `  0       $ while (contador < listaDavas.CouNt	;                          ?         ?
        ?  (      (      !(  (  u
0               ?    "     ?    while (con?ador <`0)
     (                          {
   0          !                     PdfPCell p = n?w PdfQCell(few Phbaqe(" ", arial8));?                      "             p.GrayFill = 0.94fM
           `      "                 tabela4.Add el?(p?;*  0    ?               "   ?     `  contador++;
       !          0   `   0     ??   $                           (#gndzegion
o
        "      `?"       ( !"   'reg)on Dxterior
        !     0           0 0   //Exteraor
    0         `        ?     "  PdfPCell ?it14L?nha0 = ndw`PdfPCel,(new Phsase(bEhte??or", arial8();?  (     !           $0 ?       $//   Ca?14Li?ha?.BorderWi$th ? 1;
  0    0                  !     Ca?14Li?ha0ImrizonpalAlignment = 1;         $*             `       Cat14Linha0.Fixed@eight!= 2;
   "                            tab?la4&AddCell(Cat<Linha0(;*   `        `0  `   $    ! ?    PdfPCenl Tipo140 =!new PdfPCell(ne ?Hrase("Despesas no ?yterios"l ar)al8));?                          $  (! TI`o140nHozizontilAlignment"= 1;? $  0   $               0$      //  Tipo140.BorderWitth = 1;
   "     0        !       ?  p! tabela<*AddC?ll(Tixo040-3

        `    !      `   ``      coNtador = 0;
 `                             0formach (Adicinal despasa in listaEesp?sq)
  "   ?   !    !             ! ({
 !  b    $    !         !         "!if despesanDesperc == ConverpnToString("Despesr$no Exverigr*))
    ?        `            0       ( {

     "!       "  (                 `    do
 0                                      {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                #region Material de Limpeza
                                //Exterior
                                PdfPCell Categoria11 = new PdfPCell(new Phrase("Material de Limpeza", arial8));
                                //   Cat14Linha0.BorderWidth = 1;
                                Categoria11.HorizontalAlignment = 1;
                                Categoria11.FixedHeight = 0;
                                tabela4.AddCell(Categoria11);
                                //PdfPCell Tipo123 = new PdfPCell(new Phrase("Material de Limpeza", arial8));
                                PdfPCell Tipo123 = new PdfPCell(new Phrase("Mat. de limpeza/Higienização de Uniforme", arial8));
                                Tipo123.HorizontalAlignment = 1;
                                //    Tipo121.BorderWidth = 1;
                                tabela4.AddCell(Tipo123);

                                contador = 0;
                                foreach (Adicional despesa in listaDespesa)
                                {
                                    if (despesa.Despesa == Convert.ToString("Material de Limpeza") || despesa.Despesa == Convert.ToString("Higienização de Uniformes"))
                                    {

                                        do
                                        {
                                            if (despesa.Data.ToString("dd/MM") == (listaDatas[contador]))
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(despesa.Valor.ToString("F"), arial8));
                                                p.HorizontalAlignment = 1;
                                                tabela4.AddCell(p);
                                                contador++;
                                                break;
                                            }
                                            else
                                            {
                                                PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                                p.GrayFill = 0.90f;
                                                tabela4.AddCell(p);
                                                contador++;
                                            }
                                        }
                                        while (contador < listaDatas.Count);
                                    }
                                }
                                while (contador < 10)
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.GrayFill = 0.90f;
                                    tabela4.AddCell(p);
                                    contador++;
                                }

                                #endregion

                                PdfPCell SubTotal = new PdfPCell(new Phrase("Subtotal"));
                                // SubTotal.BorderWidth = 1;
                                SubTotal.HorizontalAlignment = 1;
                                SubTotal.Colspan = 2;
                                SubTotal.FixedHeight = 10;

                                tabela4.AddCell(SubTotal);

                                int sub = 0;
                                do
                                {
                                    if (sub < listaSubTotal.Count)
                                    {
                                        if (listaSubTotal[sub].Equals(" "))
                                        {
                                            PdfPCell cell = new PdfPCell(new Phrase(" "));
                                            //  cell.BorderWidth = 1;
                                            cell.HorizontalAlignment = 1;
                                            tabela4.AddCell(cell);
                                        }
                                        else
                                        {
                                            PdfPCell cell = new PdfPCell(new Phrase(listaSubTotal[sub].ToString("F"), arial8));
                                            // cell.BorderWidth = 1;
                                            cell.HorizontalAlignment = 1;
                                            tabela4.AddCell(cell);
                                        }
                                    }
                                    if (sub > listaSubTotal.Count)
                                    {
                                        PdfPCell celula = new PdfPCell(new Phrase(" "));
                                        //  celula.BorderWidth = 1;
                                        celula.HorizontalAlignment = 1;
                                        tabela4.AddCell(celula);
                                    }
                                    sub++;
                                }
                                while (sub != 11);
                                #endregion



                                PdfPTable tabela5 = new PdfPTable(5);
                                tabela5.HorizontalAlignment = Element.ALIGN_CENTER;
                                tabela5.TotalWidth = 250f;
                                tabela5.WidthPercentage = 100;
                                float[] widths5 = new float[] { 4f, 4f, 4f, 3f, 1f };
                                tabela5.SetWidths(widths5);
                                tabela5.HorizontalAlignment = 1;

                                pdfDoc.Add(tabela4);
                                int num = 0;
                                do
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.Border = 13;
                                    p.BorderWidth = 1;
                                    tabela5.AddCell(p);
                                    num++;
                                }
                                while (num < 3);

                                PdfPCell AdiantamentoCell = new PdfPCell(new Phrase("Adiantamento: ", arialNegrito));
                                AdiantamentoCell.FixedHeight = 0;
                                AdiantamentoCell.BorderWidth = 1;
                                AdiantamentoCell.Border = 3;
                                tabela5.AddCell(AdiantamentoCell);

                                PdfPCell LabelAdiantamento = new PdfPCell(new Phrase(lblAdiantamento.Text));
                                LabelAdiantamento.HorizontalAlignment = 2;
                                LabelAdiantamento.Border = 11;
                                LabelAdiantamento.BorderWidth = 1;
                                tabela5.AddCell(LabelAdiantamento);

                                PdfPCell AssFunc = new PdfPCell(new Phrase("Assinatura:", arialNegrito));
                                AssFunc.Border = 12;
                                AssFunc.FixedHeight = 0;
                                AssFunc.BorderWidth = 1;
                                AssFunc.HorizontalAlignment = 1;
                                tabela5.AddCell(AssFunc);

                                PdfPCell AssChefe = new PdfPCell(new Phrase("Visto Chefe: ", arialNegrito));
                                AssChefe.Border = 12;
                                AssChefe.BorderWidth = 1;
                                AssChefe.HorizontalAlignment = 1;
                                tabela5.AddCell(AssChefe);

                                PdfPCell Aprovado = new PdfPCell(new Phrase("Aprovado: ", arialNegrito));
                                Aprovado.Border = 12;
                                Aprovado.BorderWidth = 1;
                                Aprovado.HorizontalAlignment = 1;
                                tabela5.AddCell(Aprovado);

                                PdfPCell TotalDespesas = new PdfPCell(new Phrase("Total Despesas: ", arialNegrito));
                                TotalDespesas.BorderWidth = 1;
                                TotalDespesas.Border = 3;
                                tabela5.AddCell(TotalDespesas);

                                PdfPCell LabelTotalDespesas = new PdfPCell(new Phrase(lblTotalDespesas.Text));
                                LabelTotalDespesas.Border = 11;
                                LabelTotalDespesas.HorizontalAlignment = 2;
                                LabelTotalDespesas.BorderWidth = 1;
                                tabela5.AddCell(LabelTotalDespesas);

                                PdfPCell Func = new PdfPCell(new Phrase("_______________", arialNegrito));
                                Func.Border = 12;
                                Func.FixedHeight = 0;
                                Func.HorizontalAlignment = 1;
                                Func.BorderWidth = 1;
                                tabela5.AddCell(Func);

                                PdfPCell Chief = new PdfPCell(new Phrase("_______________", arialNegrito));
                                Chief.Border = 12;
                                Chief.HorizontalAlignment = 1;
                                Chief.BorderWidth = 1;
                                tabela5.AddCell(Chief);

                                PdfPCell Ok = new PdfPCell(new Phrase("_______________", arialNegrito));
                                Ok.Border = 12;
                                Ok.HorizontalAlignment = 1;
                                Ok.BorderWidth = 1;
                                tabela5.AddCell(Ok);

                                PdfPCell SaldoReceber = new PdfPCell(new Phrase("Saldo a Receber: ", arialNegrito));
                                SaldoReceber.Border = 3;

                                //SaldoReceber.HorizontalAlignment = 1;
                                SaldoReceber.BorderWidth = 1;
                                tabela5.AddCell(SaldoReceber);

                                PdfPCell LabelSaldoReceber = new PdfPCell(new Phrase(lblSaldoReceber.Text));
                                LabelSaldoReceber.Border = 11;
                                LabelSaldoReceber.HorizontalAlignment = 2;
                                LabelSaldoReceber.BorderWidth = 1;
                                tabela5.AddCell(LabelSaldoReceber);


                                num = 0;
                                do
                                {
                                    PdfPCell p = new PdfPCell(new Phrase(" ", arial8));
                                    p.Border = 14;
                                    p.BorderWidth = 1;
                                    tabela5.AddCell(p);
                                    num++;
                                }
                                while (num < 3);

                                PdfPCell SaldoDevolver = new PdfPCell(new Phrase("Saldo a Devolver: ", arialNegrito));
                                SaldoDevolver.BorderWidth = 1;
                                SaldoDevolver.FixedHeight = 0;
                                SaldoDevolver.Border = 3;
                                tabela5.AddCell(SaldoDevolver);

                                PdfPCell LabelSaldoDevolver = new PdfPCell(new Phrase(lblSaldoDevolver.Text));
                                LabelSaldoDevolver.Border = 11;
                                LabelSaldoDevolver.HorizontalAlignment = 2;
                                LabelSaldoDevolver.BorderWidth = 1;
                                tabela5.AddCell(LabelSaldoDevolver);


                                pdfDoc.Add(tabela5);

                            }
                        }
                        PdfAction js = PdfAction.JavaScript("this.print(true);\r", w);
                        w.AddJavaScript(js);
                        pdfDoc.Close();

                        WebClient User = new WebClient();
                        byte[] FileBuffer = ms.ToArray();
                        if (FileBuffer != null)
                        {
                            Response.ContentType = "application/pdf";
                            Response.AddHeader("content-lenght", FileBuffer.Length.ToString());
                            Response.AddHeader("content-disposition", "inline;filename=" + lblNumero.Text + ".pdf");
                            Response.BinaryWrite(FileBuffer);
                        }
                    }
                }
            }
        }
        finally
        {
            Dispose();
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        geraPDF();
    }

}