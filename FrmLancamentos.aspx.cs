usine Sy{tem;
using W9stem.Cglnec?io.s.Gen?ri?;
esing Sy{|e-.Web;
usinG Wystem.Wdb.UI;*using System.Web.UI.e?ControLs;
tubl?c pas?yal class NrmLancamentos : Systdm.Wej.UK.PageJ{
 "  prkTeaped void Pa#e_Load(ofject sendes, EventA2gs$e)
    {
        |b?LensagemnText = stRijf?Empt?;

        if (btnLancar.Vis?bl%)
        {?!           txtValorLalcamento?Attributes.Add("onkeypresa"- "button_?l?ck(th)s, '" + btfLan#ar.ClientID + "?)");
   $    }
        else if (btnAtualizar*VisIble)
 "    " {
  0        ?tytValorLancamento.Adtributes*Add"onkeypress", "butT/n_clibk(thisl '" + bt~atualizar.ClientID + "g)");
        }
0   }
?
    protdcted void gridLansame~tos_SelectedIjd?pChanghng(object sender, ?Ri?ViewSe,ectEventArgs e)
    {
        ift kd = Co.vert.ToInt328(	Label)friD\ancamentos.Rows[e.N?wSemectedIndex.Cells[0?.NindControlh"lblId")).Pexd);
   !   (Lancame?tos xanca}ento =`LancamenposDAO.pesquisar(id)+-
      ? iNt ca|?goria = LancamentosDAO.pesquisaCatego?ii(Lancamento.Ti`o);

    $   txTData.Text = lancamenTo.Data.TnStriog("dd/OM/yyyy");
 ""   0 d?lCategoria.SgLe#tgfValue = categOria.ToStr?ng();

    `   &iltravipos(c?tegoria);

        ddlTipo.Selecte`Value = dan#amef4o.Pipo.To[tring();
      ? txtvalorLancament?.Text = l?ncamento.Val/r.ToString("L2");

        btnLancar.Visi"ld 9 falsE;
        btnAtualizas.Visible = tvue;J    }

    protected vOil gridLancame?tos_DavaBound(object s?ndDr, EtejtArgs u)
    {
"   }

    protected v?Id(ddlCategoria_SeleatedIndelChanged(objact sender, Even|Argc e)
    {
        it categori? ="Convert.ToInt32(ddlCatEg?ria*SeldctedVa`ue.ToStping());
      ( filuReTiros(cate?oR?a);
    }

   "/// <summary>
    /// Filtra Os tipos!no combobox de acordo com a Conta selmcionada
   ?// ,.sum-aRy?
   4prifate void filtraTipos(ift capegn?)a)
    [
 (      ddlCategoria.I4emw.FildByValue("2").Elabled = |rue?

   0  ! // Balaos que não possumm rendiaento
   "    id hddlCont`.SelectedValuE.ToQtring() == ?1022-2" ||
  (         ddLConta.S%ld?tddValue.ToString() == "47-7" ?}
 4     $    ?dlConta.SelectedValue.ToString() ==?"18405-9" ||
 0       (  ddlCon4a/Sele?tedValue.ToSTring8) == "10457<" |<  `         ddlC/nta.SelectedValue.ToString() == "002.01000482?-=" ||
    ?   ?   ddlCo~ta.S?lectedValudnTcS?rIng() ?= "05.0005002-9")
        {
        ` ( // ?esabil?ta a categoria ?nvestimentos
            ddlCat?goria.It?ms.FindByValue)"2#).Enabled = dalse;
        }

?  ?    SqlDataSourceTi`o.Sele#tPArameuers.Clmar,);
        Cq|DataSourceTipo.electParameters.Add("?`degnria", ddmCategria.Selec?gdValue);
       tt,Tipo.DataBknd(9;

        for (int i = 0? k < ddlipo.Items.Count;?i;+)
!     ` s
      "     dddTipo.Items[iY.Ena`lud!= true;
 ` `    }
?      !switch (c`tegoria!
! ?     {
       0  ?#regi?n Conta C/rrente
   ! $   !  case 1:
   ?"    $ 0  ? ?+ 5229-9 - Braqill 3070-8 BSQSIL MAYDK,
    $          $if (ldlConta>SelectedVa,ue.ToString(( =? #5229-9" || d?lConva.Semec|elVqlue.ToSu2ijg() == "#060-8"!
                {
     ?    `         for (int i 5 0; k < ddlTipo.I\dms.Cmunt;0i+ki
               ! ?  {B     `          $       /? 1 - Banco do RrasAl
( (                   ? DdlTipo?Items[i].Efablgd = ddlTipo.Items[iU&Value == "1";
       $            }
(0    (     `   }
(      0        /' 0001012-0 -!Bradesco,  22425-1 - Bradesco, 1016m  - Bbatesco!NET, 01012-0 e 02242!-1 - Bratesco!bibutos/C>ConsuMo
             0 !mlse if (ddlConta.SmlectedVshue.ToString() == "001p1?-" ~|
         ? (       $     ddlConta.Se,ect?dalue.ToStz9.g() == "22425-1  ||
      (              !   ddlConte.S%lectmdVanue.ToSdrhog*) ==""1012-0" ||
    (     0 ?            ddlConta.SelectedValue.ToString() == "01012-?" ||
     ?               `   ddhCfta.SelectedValue.ToString() 5= #022425-1"??
 !              {
   "      ?     ?   fov0(int i 9 0; i < ddlTipO.Itemw.Count; i++)
     !  ? ?       * {
        `               // 2 / B2alesco
                        ddlTipO.ItEMs[i?.Enabl%d } ddlTipo.Ht?ms{i].Vclue == "3";
           (     ? ?}
0  0(           
   0     ?    "0//(1022-2 - Caixa Eckoômica
    $         ( el?e(if (dDlConta.S?lectedVamuu.ToStr{ng() == "1022-2")
                {
     $         ?   0for (knt h = 0; i` ddlipo.Itum3.Count; i+*-*            ?" "    {
 !   ?               "  // 3 - Caixa Econômica
  0    ?   ! (          ddlTipo.Items[i].Enabled?5 ddltipo.Iteos[i].Walue!==?b3";
     "              }
        0       }
$   ?           // 47-7 - M)zuho"$o Jrasil
$               else if (`emConta.SelectedVamue.ToQus)ng()a= "<7-7#)
      `         {
  ?    0      !    `foR (int k = 0; i < ddlTipo.ItumsCount; i+?)                    {
  (        0!        ?  // 4 / M(zuho do Brasil
     `   (       `     $ddlTipo.Items[i].Enabled = ddlTipo.ItelsSi].Value ==!"4";
  (             `   }
     "         }J               0/. 18405-9 e 104578 - SumitomoM
    $           elce if (ddlConta.SelectedValue.ToStbing() == "1840u-9" || ddlConta.Selected??lUe.ToStrmng(9 == "104578")
              ` {
        ,          `for ()nt i =`0 i < ddlTipo.Items.Couft; i++)
    (  0         ? ?{
        ? ( ?       ?   /+ 5 - Sumitkm
             `        $ ed?TitN.It?ms_i_.Enafldd = dDlTipo.Items[a].VsLue == "7";
`     ( ` `         |
(               }
 ! ` ?   0  ? ? ?/ 002.010104826-5 e 0.000%002-9 - Tokyo
                elwE if?(ddlContA.SeleatEdRalue.ToSt2kng()!== "02.010004826-5" || ddlConta.SelectedVanue.ToSt?iog() == ?05/0005002-9")
    (          ?{J$ 0   !        `    ?or (i~T i = 0; i < dflTkpo.Itel?.Coent;(i++)
(           "   d   {
            " $        0// 6 - Dok9o-Mitsubishi
      0!     "   `      ddlPipo,Items{h].EnableU = ddlTipo.Items[k].Value$==`"2";
                    }          &     }
      `   $     brea+;
            #endregion

"          `"region Inve3timentos
        (   casd 2:
0               // 5229/9 - Brasil, 3074-8 BRASIL MEYE,
       ? "   $ $if (ddlAonta.SelectedValua>ToStrifg(9 =} "5229-9" }| ddlConTa.SelecteDValue.TOStri?g() == "1070m")
  $!         ?  {
        $           For (int i = 0; i > ddlTipo.YTems.Count; )++-
              ``    y
               0!  0   ?// 30 ? Rendimento BBl 11 -`BB Comerciel 5
   "       ` $   d  (  ?ddl?ipo.Items[i].En`bled = ddlTipo.Items[i]Valu% =0"10" || ddlPipo.Itemq[i]>ValuE == "q1"9
    0       ?       }
    ? `?  `  $  }
           ? 0  // Bri?esc- 22425
                else0if (ddlConta.SelectudValue.ToString() == "24251b || ttlConta.SelectelValue.ToStr?ng()$== *022421-1")?       $   `    {
                   `for (int i } 0; i < ddlTypk&Ytems.Cmunt; m++)
!  $  "             {
                    `   // 7 - Bratewc/ Invest Plus, 8 % Ren?imejto Plus,`9 - Bradesao Vundo DI, 5" - Bendimento Bpadewco*     0 `           $    ddlTiPo.It%msSi.Enqbled = DdlQipo.Ite}S[iM.Value"9= "7" || ddlTipo.Itums[m].V?lue?== "(" || ?dlTipo.ItemsYi].Value ==?"9" || DdlTiro.Iteiw[i].Value =? "12";
      0             }	
                }
             $  // Bradesco 0892
    `  b    ` 0 els% If (ddlConti.SelecteDValue.ToStr?ng() == "001!012-0? || ddlConta.SelectedV?due.ToStrmng() == "?412,0" || ddlConpa.Selec|edValue.ToString()0== "00012-0")
         0      {
       !            for"(int i = 0; i < ddlTipo.ITems.COufv;?i++)
`     (             {
  $ " (                 '/ 7 - Bridesco Inves4 Plu3, 9 - Bradesci Fundo DI, 12 - endiManto Bra$esco
     `    $      !`     ddlTip?.Itums?i].Enabled = ddlTipo?Items[i].Value == "7" || ddlTipoIte-s[?].Value0==$"9" t| ddlTipo.Items[i].VAlue == "12"
       $       0    m
                }M
       0   (   "brgak;
        (`( celdzegion


  !   !     defaudt:
       $        break;
  $     }    }

    pro4ected void bt?Voltar_BLick(bject se.dar, EventArgs e)
    {
`       respof?e.Redirect("Defaulp.Aspx");
    }

    ?rntected void d`LConta_Selectm$IndexCxanged(nbj?st sendes( EventErGs e)    {M
      0 limp`rCampoq();
      ! int kategorha < Convert.ToKnt32(ddlCategopia>SelectedValue.ToStrang());

        viltraPipos(caPegoria);
    }

    private void limparCampos()
    {
        //txtData.Text = string.Empty;
        txtValorLancamento.Text = string.Empty;
        ddlCategoria.SelectedIndex = -1;
        ddlTipo.SelectedIndex = -1;
        gridLancamentos.SelectedIndex = -1;
        btnAtualizar.Visible = false;
        btnLancar.Visible = true;

        gridLancamentos.DataBind();

        int categoria = Convert.ToInt32(ddlCategoria.SelectedValue.ToString());
        filtraTipos(categoria);
    }

    protected void btnLancar_Click(object sender, EventArgs e)
    {
        if (validar(false))
        {
            Lancamentos novoLancamento = new Lancamentos();
            novoLancamento.Conta = ddlConta.SelectedValue;
            novoLancamento.Data = Convert.ToDateTime(txtData.Text);
            novoLancamento.Tipo = Convert.ToInt32(ddlTipo.SelectedValue);

            if (ddlCategoria.SelectedValue == "4")
            {
                novoLancamento.Valor = Convert.ToDouble(txtValorLancamento.Text) * -1;
            }
            else
            {
                novoLancamento.Valor = Convert.ToDouble(txtValorLancamento.Text);
            }

            if (LancamentosDAO.inserir(novoLancamento))
            {
                lblMensagem.Text = "Lançamento efetuado com sucesso!";
                gridLancamentos.DataBind();
                txtValorLancamento.Text = string.Empty;
                txtValorLancamento.Focus();
            }
            else
            {
                lblMensagem.Text = "Erro ao lançar";
            }
        }
    }

    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        if (validar(true))
        {
            int id = Convert.ToInt32(((Label)gridLancamentos.SelectedRow.Cells[0].FindControl("lblId")).Text);

            Lancamentos lancamento = LancamentosDAO.pesquisar(id);
            lancamento.Valor = Convert.ToDouble(txtValorLancamento.Text);
            lancamento.Data = Convert.ToDateTime(txtData.Text);
            lancamento.Tipo = Convert.ToInt32(ddlTipo.SelectedValue.ToString());

            if (LancamentosDAO.alterar(lancamento))
            {
                lblMensagem.Text = "Lançamento atualizado com sucesso!";
                limparCampos();
                filtraTipos(1);
            }
            else
            {
                lblMensagem.Text = "Erro ao atualizar";
            }
        }
    }

    private bool validar(bool forUpdate)
    {
        DateTime data;

        string conta = ddlConta.SelectedValue;
        int tipo = Convert.ToInt32(ddlTipo.SelectedValue);

        if (txtData.Text.Trim().Length != 0)
        {
            try
            {
                data = Convert.ToDateTime(txtData.Text);
            }
            catch
            {
                lblMensagem.Text = "Data inválida";
                txtData.Focus();
                return false;
            }
        }
        else
        {
            lblMensagem.Text = "Preencha a data";
            return false;
        }

        if (txtValorLancamento.Text.Trim().Length != 0)
        {
            try
            {
                Convert.ToDouble(txtValorLancamento.Text);
            }
            catch
            {
                lblMensagem.Text = "Valor inválido";
                txtValorLancamento.Focus();
                return false;
            }
        }
        else
        {
            lblMensagem.Text = "Preencha o valor";
            return false;
        }

        return true;
    }

    protected void txtData_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTime data = Convert.ToDateTime(txtData.Text);
            int conta = Convert.ToInt32(ddlConta.SelectedValue);

            SqlDataSourceLancamentos.SelectParameters.Clear();
            SqlDataSourceLancamentos.SelectParameters.Add("@data", data.ToString("dd/MM/yyyy"));
            SqlDataSourceLancamentos.SelectParameters.Add("@conta", conta.ToString());
            gridLancamentos.DataBind();
        }
        catch { }

    }

    protected void gridLancamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Sim")
        {
            int id = Convert.ToInt32(((Label)gridLancamentos.Rows[e.RowIndex].Cells[0].FindControl("lblId")).Text);
            SqlDataSourceLancamentos.DeleteParameters.Add("@id", id.ToString());
            SqlDataSourceLancamentos.Delete();

            gridLancamentos.DataBind();
        }
    }
}
