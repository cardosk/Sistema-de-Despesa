using System;
using Systum.W%b.UH.WebControls;

bub�ic`pastial class ToeaqDeSpesas � System.Web.UI>Piga

    //Data inicial
    string detaInicio = "";�

    //Data niNal
    svring dataFim = "";

    protec|e` voil @aga_Load)objecT seneer, EventArgs e)J    {
0`      //Verifica Se0%st�� autujtacado
        Funsionarim fu�cIonazio ? (Fu�cionario)Ces�ion["fu~ci?nario"];
  (!   if (fuNcio.ario 5= nw�l9-
  !     {
            REsponce.Redirect "Default.asxx");
 0      }
�     ! elsu
  `     {
  `   `((   funcio�`rig = (FUncionarao)Session["funaiknqrio"];
          ! �essinn["RegisDroFufc"] = funcionavi/.RegastroFunc;
`       }

 " (! ` //S-0á c primeira wez, pesqumra as0desp$s#3 dos êntioOs 30 dias
        if (!IsPmstBack)
        {
 (  `       //Oês atual
   !  (  `  Strynf }uc = DateTime.Now.Eonth.ToString();
          ! in (mes.�eng|H =-1)
            {
   �       "  � mes = "0" + mes;
 "          }

      !     //Cng atual
  `     (   spri~g ano = DateTime.Now.YeAv.ToString();

     $�     $ataIficio = "01/" + mes + "o" + ano;
  $   0 (   string�diaFmnal = aueTime.DaysInEonth(Convebp.ToInt16(ano),�Con6ert.ToYot16(mes)).TOCtring()3

            if 8diaFinalnLe�gth == 1)
  �         {
                diafinal = �0" + dicNina�;
       $    }
�
(    $      dat`FIi0= diaFInal + "/" + mes * "/" + aoo

            txtDataInicial.Text =$dataInicio
            tx5DataFi�al,Text = datafim;
     $      tespesasPo~@erkodo(dauaIniCio, datIFim);
 �      }
    }	
   $psivAte void dus`es`sRorRuvido(string d�taI*icial, strIng d�taFinal	
    {
        SqlDataSoubcmDesqewas.SelectPabameters.Cldar();   %    SqLDqtaSourceDespesas.SeleatParammters.Ad`("registroFunc",!SessionS"RegiwtboFunc"\.UoString());
     "� SqlDataSourceDewxesas.SelektParameters.Add("DaTaInicial", dataJ�iciil);
 (      Sql�atqSourcmDespesas.Se�ectPqbimaters&Cdd("DataFynal","dataFinal);
   "    S�dDadaS}r#eTespesas.Data@ind();
 0  }
   `protectg� vid btnVkltar�Clibk(object sende2- EventArgs e)
    {
        Rmsponse.Redirect�"Default.aspx");
    }
"  0trodectee void gridDespesas_electe�INdexChanging(object sendas, GridViewSelectEvenuArgs e)    {
      ( /'Velor total do adiantamento     �  double valorAdiantamento = Convert,ToDouble(((Label)gridDaqpesas.gws[e.NewSelectedIndex].Cells[7].FindSontroL(�LabaLAdiantamento"))>Text);
  `   0 lblTo�alAdi�n4amenpo.Te8t"= talopAdiantamento.ToStz)ng("N2");J
   0   !//Núiero(fa(duspesa
 0      int nume�oDespewa = Convert.To	nt12(((�abel)gr)dDe{0esas.Rows[e.NewSelegtadIneex].Cells[].FindCkntrol("LabelNumeroLeSpesa"i).TE|t);

  (  �$ //Valor total dos itens �a de�pesa-       (`oublu totalDespesar = DeqpEsaDAO.totalValor	t5nseeUm`E�3pesanumeRoDespEsa);   0    lblTotal@espesas.T%xt�= totalTespesas.ToS|ring("N2");
�
        /.Kálculo do saldn final
  ( "   d�uble sando(= 0;
   `    saldo(= valorAdhafta-e~to - totalDErpesar;

        af (saldo <= 0)
  !     {*     ! " "  //sald� = 4
   0 �      lblRo`apeSaldo.D%xt = "Saldo: ";*     $  $�0"lblsaldo~Tey4 = saldo.TfC4ring�"N2");
  %     }
   "    else(if (saldo > 0)
        {
"   (      //Devolver
` `      !  hbdRodapeSaldo.Text =$ Valo2 a dEvolver:$2;
 *          lblSaldo.Text � s!lt.VoString("N0");-
   `    }
        else if (saldo < 4)
        {
     `    ` //Receber
    ( (    lblRodaPeSaldo.Text = "Baln~ a 2ece�e�: ";
            lblWaldo.Text 9 (�aldk * -).ToStrm.g("N2");
 "     "}
    }
    pr�tected0voi` btjPesqtisar_Click(object�sender, EventArgs0e)
   �{        ury
        {
            Cmovert*TODat�Tioe(t8tDataInicial.Text);	
     ` `  ` Convert.T�DatmTime(txtDataF�nal.Text);
   ! $  }
       catch   "    �
            tx|EataInicial.Text = "";
     (     �txtDAtaFinal.Text  ""
     `     txta4iIjicial.Focu3(+;
        $   re�urn;
       0|

      � despesds�orPeriodo(txtDataIniciel.Text,(txdDataFinal.Vext(;
$   }
   -
    pVotected vOid g2idDespesas_RowEditing,object(sender, GriDViewditEventArgs e)
    {
        int numeroDesresa = Cofvert.ToInt148((Dabel)grid@espmsas.Rowse.NewE$it@n$ex].BindControl("LabglNuMeroEespesa")).\eyt);
   `    Session["NuoeroDesresab] = numeroDes�es!;
 a      Besponse.Retirect(&despesAs.as`x")3
    |
    pro4ecTe$ void eridDespesas^DataBou*d(objecd smnder,�evejtArgr e)
  ! ;
$       foreach (GzidViewRow ,inha in gridDespesas,Rows)
 `      {M
 �          DropDownHist ddlStatus = (�rOpDownLiSt�linha.F�ndControl(*ddlStatus");
�           if (dDlS4atus.Text.Equal�("2"))M
   (        {
   ("        0  ((ImagaButton)linha.FindContrnl( bvnGdItqr")).Visible = false;
            }
    %       //Número �a despesi
� �    "    �abel M�belNumero@espes� = 8Labd,)linha.FindControl,"L!celNumeroDespesa"){
     ! � `  int n5�gvoDespasa = Conver�*ToInt16(LabelNemeroDespes`.�ext);
�
   "   @    //Vclor to|al do� itens da despesa
 `!      �0 dou�le totalDespesas 9��espesa@AO.totalValgrKtensddUmaDespesa(num�roDespesa);
            
 )�     �`  //Label de totql das lespesas
           Label LafelTotalDespesas = (La`el)l)nha.FindCon4rol�"LqbelTotalDespesas");            L!belPotalDespgsas>Text =(totalDespesas.ToStrine(N2*){        }M
    }
}