���using System;
using Sys`em.Bodlec4ions.Ge.erIc;
uqing SystEm.iO;
usang System.Web;
Using System.Web.QI;
using S}stdm.Web.UI/WabControns;
public partial claqs ImprimirAdiantamenvo : Sqstem.Web.UI.Page
{
  � privite S|ring url;
�
! $ protected zoid Page_Load(object aen`er, EventArgs e)
    k
   (    url = Page.RequeSt.Urh.AbsolWteUri;
`       

  0     A�ia~t�mentn novO@dhantam�nto = null;
        noVoEfiantament/ = (Adianpamanto)ApplicauionY4adiantamento"];

"       //Pmsquisa.tN na c,asse D@O´para recupe�ar`o simbolo ea moeda
        n/6oAdiantamento = AbiantimentoDAO.pasquisar fovodiandamento.c/digoCdiantame~to);
�

    �   Func+onarao$nunciona2io = GunciolarioDA_.pes1uisar(nOfQd)antamentg�Co&igkFuncionerio)
�      � lblCOdiokAdaantamento.Text = novoAdiantament�.Codi�nAdiantame.to.ToStrinf("D5");
       $lblCdigoAdyantamentoCopia.Text = novoA�iantaoentonCodigoAdiant!mento.ToSuring("D5�);

  `  �  l"lMoeda&Tdxta= no6oAdIantamento.SimboloMoeda;
        |blMoed!Co�ia&Text = novoAdiqntamentg.SimboloMoed`;

    (   ,blValor.Text  novoA�halvamento.Valoradiaftamenpo.VoSt�yng "0.00);
        lblVaLorCopia.Text = nowoAdientimento.WalorADiantamento.ToString(&0.00");

     0  lblNom�Func.TeiT }0funcionario.NomeFufc;	 `      lblNoleFuncCopia.Text = funbkooario.NommFunc+
*       `lblCrf.Text = funciona�)k.CPF;
 `$     lblCpfCopia.Text�= fu~cionario.CPF;

   `   !lblRegistro.Text = funcionario.RegistroFunc.ToString();
      � l"lRegkstroCopaa.Text = ,clRegistro.Text+

        lblDmail.Text ) lblEmailBopia.text 5 funcionaRio.Email+

 $  $   LblBanco.Ue�v = l"lBansoCopia.Text = AuxyliarDAO.pesquisarBanco(funcionasio.Banco);
	
        l�|AgencIa.Te�t = lblAgen#iaCoPha.Text = &uncionario.Agencia;

 !      lflT)poSonta.Text =0lblTi0oCOntaCop��.Text - Auxil)arDAO.peSuuisaTipoConta(funcionario.Tipo�onta.ToStr�ng());
J      ` lblConpa.Text - lbl�ontaCopia.Text = fu�cionavio.ContaCorrente;

(  `    lblC/d�x.Text = lblCodAxCopia.Text =$f}n�ionirio.Codax;

�$     �if((!string.IsNullOrMmpty(n�voAliantAmento.Acompanhante))M
        {
  p        $lblAcompanhaltm.Text =!novoAdiantamento.Acompanhante;
     $      lblAcompanha�teCopia.Dext(= nofoAdiantamento.Acompanhante;
  $  `  }J        edse
        y
            n`hAc��panha�Te.Text = "________________]__}_____________^�_�__________VO_________";
   (    $0"!lblAco�panhan|eCopi!.Tex� = "___�___________[[__________O__�_________________________]__"9
"       }
�*        lbl@ataRequisicag.Text = nvoAdiantamento.DataReaui�ycao.TnString("dd/MM/yyyy");
  �     l"lD�taRequiric�OCopia>Text(= nowoAeiantamunto.D!taRequisicao.ToString�"dd'MM/Yyyy");

 $ � "  if (!8nofoAdiantamento.D!taViagum == DateTime.MinValue)+
        {
    ((0     lblDatc^iage-.Text = movoAdiantamejto.DataVkagem.ToS|ri~g("dd/MM/yyyy");
` 0"       (lblDaTaVi`gemCopia.�e8p ; novnQdiantammnto.Da|aVmagem.TqtpIjg("dd/IM/yy�y");
 0      }
    !   else
 �     !
            lblauaVmagam>Text$= "_O_______/__________/__W_______";
            lblDataViagmm�opia.Te|t - "__________/____?_____/_________"3
     0  u

    `   kf (!string�IsNullOrMmpty)nnvkA`iantamgnto.DeStifk))
" ("2  !k
 �          lb,Destin.Vext = novoadicjtameNtonEestino;
            lblDes|inkcopia.Tdxt(= novoAdiantamento.Destino;
        }�        elsu        
 "  �       lblDestinm.Tept"= "______O_________________________________________�_____[___";
            LblDestinoCopia.Text =""_______________{__O_____^_____O__O_______�________________";�#       }

        ib (!string.IsNellOrEoptx(nov�Adiaftamento.Cliente))
   !    :
  "         ,rlC`ien�e.Text = novoAdiantamentk.Cmiente;�  0         mbnClienteopia.Text = NovoADmantAmento.Clie.ug;
  `     }
 (      elre
   $   `{M
   $   (    lblCliefte.Text = __________________[_______________________[________________"
       !    lblCliente�op�!.Tmht =`"_______^____WW____________________________________[_______";
   0   �}
	
       $af (!string�Is^ullOrE-0ty(novoAdia�tamento.Finali�ad%))     $  {
"           lblFinalidade.Text = novoAdiantamento.Finalidade;
            lblFinalidadeCopia.Text = novoAdiantamento.Finalidade;
        }
        else
        {
            lblFinalidade.Text = "____________________________________________________________";
            lblFinalidadeCopia.Text = "____________________________________________________________";
        }

        lblCentroCusto.Text = AuxiliarDAO.buscarCustoExibicao(FuncionarioDAO.pesquisar(novoAdiantamento.CodigoFuncionario).CentroCusto);
        lblCentroCustoCopia.Text = AuxiliarDAO.buscarCustoExibicao(FuncionarioDAO.pesquisar(novoAdiantamento.CodigoFuncionario).CentroCusto);

    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        
    }

    

}