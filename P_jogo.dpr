program P_jogo;

uses
  Forms,
  U_mapa in 'U_mapa.pas' {Form1},
  U_Mapa2 in 'U_Mapa2.pas' {frmtela2},
  U_mapa3 in 'U_mapa3.pas' {frmtela3},
  U_mapafinal in 'U_mapafinal.pas' {frmtela4},
  U_cred2 in 'Imagens\U_cred2.pas' {frmblack},
  U_black in 'Imagens\U_black.pas' {frmmenu},
  U_gameover in 'Imagens\U_gameover.pas' {frmgameover},
  U_win in 'Imagens\U_win.pas' {frmwin},
  U_cred in 'U_cred.pas' {frmcreditos};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KID';
  Application.CreateForm(Tfrmblack, frmblack);
  Application.CreateForm(Tfrmwin, frmwin);
  Application.CreateForm(Tfrmtela4, frmtela4);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrmtela2, frmtela2);
  Application.CreateForm(Tfrmtela3, frmtela3);
  Application.CreateForm(Tfrmmenu, frmmenu);
  Application.CreateForm(Tfrmgameover, frmgameover);
  Application.CreateForm(Tfrmcreditos, frmcreditos);
  Application.Run;
end.
