uciNg Systeo
uSing System.Web.UI.WebCoftrolw;
uqiNg System.Trawiog�

publi� pa�tiil �less�DespesasPeNdentes": SYsTem.Web.UI.Page
{M
0   protected voId�PaGe_Load(object`senderl0EventArgs �)E
    {
        //Verifcca se astá autefticado
     !  Ftnchonario funcionario =  Funcionario)Sessi�nS"funcionarao"];
     "  if"(funcaonario == nu`l || !fu�cionario.AcEssoAdmini�0       {
            Respknse.Redirect)"Default/as�x")�
        }
    }
    protucted void btnVoltar_Cmick(kbject sender� ErentArgs e	    {
 �0  ( `ResronSe�R%dhreat("Ddfeult�aspx");
    y
    protected0vmid gridFUncIonabi/s_�ataBound ob�ect sender, E~entArgs �)M
 " !{
      0"for hift i�= 0; i < grhdFuncion`rios.Rows.Cou.t; i++)
    �   {
$           int rmfisTroFu.c =0Convert.\oInt16(((Labu,+gridFunciofar�osnRnws[i�.Cells[0].Fin$Control("lblReoistro&)i.Pext);
$ 0         double totalAdianta}efto = 09
          $ ttalAdiantamento = F5ncionari/DAO.Vot!lAdha�4amentoDoFuncionario(reGistrofunc);
  $ `       do}ble totalDesperas = 0:
  $  0    � TotalDesqesas =hFUnci�nario@AO.totalDdSpewa�DoFunb�onario(rdgist0oFunc);J
           Ldb�l lblAfiaotamento = (Label)gridFunc)onarios.Rows[i].Cellr[Y*NindCnurol("lblA,iantaeEnto");
!           lblAdiantamento.Tex� = tot!lEdiantamento.ToSvring("0/00 );

 ! `    �   ,abal lblTotalFmspeSas0= (Label)gridFuncionarios*Rows[i].CellsY3].Find�ontrol("lblTotalDespeSas");
        �   lblTotaLDespesas.Text = totalTesresas.ToString(*0.00")+

            Labgl lblSaldo = (Label)gridFun�iknariOs.Row�_i].Cells[4].FindContso, "lblSaldo");
         �2 doujle saldo = totalAdiantamento = totalDEspesas;

   $        lblSaldo.Text = sahd.ToSTzing("0.00")+

�      !   (La`el(lblStatus = (La�al)gritFuncionarios.Rows[iY/Cells[5].FindCon4rl("lblStatuw�);          ( lblStatus.Foft.Bold(= true9J   �        if hsaldo > 0)
            z
(�       `      �blSpatus.Text = "RECEBER";
  " !        0" lblStatqsForeColor = COlor.Red;	
`         " }
         "  else if (seld� < 0)
   �     0 ({
   0    �       lbdStatus.Text =""PAGAR*;
           (    lblSta�us.ForeColOr = Color.Red;
 `   �     "}     !  0   e|sgJ   "        {
 "              lblStatus.T%xt = "OK";
                lblStat5s.ForeColnr = Comor.Gredn;
      $$$ ` }
!     !`}    }
    prot$cted void gridDespesas_RowUpfating(object sender, System.Seb.UI.erGo>tRol{.GridViewUpdateEventQrg3�e)
    {
 " �p   y�t numeroDes2esa = Cgnvert&ToInt32((8Label)gbidDesperas.Rows[e.RmwKndex]*Cells[0].FhndCon4rol("LabelNumeroDespesa")).Text);
=
   �    DropDownLisv ddlStAtus ="(DropDwnList)gvidDGspesas.rows[e.R/wIndax].Cells[8].FindControl(cddlS�atus"){
     (  double a$iaftamentk = 0;
      ` Lasel lblAdianv`me~tm = (Label)g0idDespesa�.ows[e&ZowI�d�x].Cellsy6�.FindContrl("LabdlAfiantaMento");
        adianpa}entn = Convest*ToDouble(lblAdiantamen4o.Text);

        Rq�DataS�urceEes`esas*UpTatePara}eters.Clea� );
       !sqlDa4aSouRceDes�e�as.Updatd�iba/eters*Add("StatUs", ddlStatus.SelectedValue):
        SqlDataourceDespesas,UpdateParameters.Add("Adialtaiento", adiantamento.ToWtring ));J    `   SqlDataSo5rceDespe[aa.U`dateParameders.A$d("NummroDespEsa", numeroDdspeSa.VoString());
        SqlDataSourcdDesrdsa{.UpdaTe();

"       gridFuncionarios.DataBknd();
    }
$   prodec�ed void gridDespesas_DataBound(object sender, EveotAros!a+
    {
        foraac( (GsidViewRnw li.ha in gridDestesas.Rows)
        {
            DropLownList dDlStitus = (DropDow.List)linha.FintCont�ol"ddlSta�us");�J !     `    if (ddlStatu{&Text.Gquals("2"))
�     0     {
�             " ((ImaguBuT|on(linh`.Find�ontrOl("btnEditar"	).Visible = falsE;
       $    }
	
 $          -/Número �! despes!
       "    Label LabelNtmeroespesa = (Labul)lhnha.FmndGontrol("Labelnume�oDespesa");
            int nemeroDespesi =(Convest.ToInt16*L�belNumeroDespesa.Text+;J
            '/Valor t�tal dos!itens da dmspasa
  �         $ouble totalDuspesas = DespecaDAO.tgtq�^alorItenslaUmaD�spesa(numeroDes0asa);

   $  0     +/Label de0toval da� despesas
            Label LabelTotalDespesas = (Label)linha.FindControl("LabelTotalDespesas");
            LabelTotalDespesas.Text = totalDespesas.ToString("N2");
        }
    }
}