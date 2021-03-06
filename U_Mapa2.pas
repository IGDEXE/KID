unit U_Mapa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  Tfrmtela2 = class(TForm)
    imgfield: TImage;
    imgbt1: TImage;
    imgbt4: TImage;
    imgbt3: TImage;
    imgbt2: TImage;
    imgp1: TImage;
    tmbt1: TTimer;
    tmarea: TTimer;
    tmbt4: TTimer;
    tmbt3: TTimer;
    tmbt2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tmbt1Timer(Sender: TObject);
    procedure tmbt2Timer(Sender: TObject);
    procedure tmbt3Timer(Sender: TObject);
    procedure tmbt4Timer(Sender: TObject);
    procedure tmareaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtela2: Tfrmtela2;
  //Variavel de controle das AIs
  TLbt1,gf1, TLbt2,gf2, TLbt3,gf3, TLbt4,gf4 : integer;

implementation

uses U_mapa, U_mapa3, U_gameover;

{$R *.dfm}

procedure Tfrmtela2.FormCreate(Sender: TObject);
begin
  DoubleBuffered := true;
end;

procedure Tfrmtela2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //Area de movimenta��o
  //Serie de regras que permitem ao jogador andar pelo cenario
//------------------------------------------------------------------------------
  if (imgp1.Top >= 1) and(imgp1.Top <= 800) and (imgp1.Left >= 0) and (imgp1.Left <= 1496) then
   begin
//------------------------------------------------------------------------------
    if (key = 40) then
    //Quando precionar a tecla direcional para cima, faz a imagem subir, desde
    // que ela esteja dentro da tela
      begin
        imgp1.Top:=imgp1.Top-15;
          if (imgp1.Top <= 0) then
             begin
                imgp1.Top := 1;
             end
      end
//------------------------------------------------------------------------------
      else if (key = 38) then
      //Quando precionar a tecla direcional para baixo, faz a imagem descer,
      // desde que ela esteja dentro da tela
      begin
        imgp1.Top:=imgp1.Top+15;
          if (imgp1.Top >= 800) then
            begin
              imgp1.Top := 799;
            end
       end
//------------------------------------------------------------------------------
      else  if (key = 39) then
    //Quando precionar a tecla direcional para esquerda, faz a imagem ir para a
    // esquerda, desde que ela esteja dentro da tela
      begin
        imgp1.left:=imgp1.left-15;
           if (imgp1.left <= 0 ) then
             begin
               imgp1.left := 1 ;
             end
      end
//------------------------------------------------------------------------------
      else if (key = 37) then
    //Quando precionar a tecla direcional para direita, faz a imagem ir para a
    // direita, desde que ela esteja dentro da tela
      begin
        imgp1.left:=imgp1.left+15;
           if (imgp1.left >= 1496 ) then
             begin
               imgp1.left := 1495 ;
             end
      end
//------------------------------------------------------------------------------
     else if (key = 18) and ( key = 115) then
  begin
    form1.mpgame.Stop();
    Application.Terminate();
  end
  end
end;

procedure Tfrmtela2.FormShow(Sender: TObject);
begin
    imgp1.top := 496;
    imgp1.left := 210;
    //Ponto inicial dos booths
//------------------------------------------------------------------------------
  gf2 := 1488;
  imgbt2.Left := gf2;
  TLbt2 := 768;
  imgbt2.Top := TLbt2;
//------------------------------------------------------------------------------
  gf4 := 216 ;
  imgbt4.Left := gf4;
  TLbt4 := 768;
  imgbt4.Top := TLbt4;
//------------------------------------------------------------------------------
 //Ligar timers
  tmbt1.Enabled := true;
  tmbt2.Enabled := true;
  tmbt3.Enabled := true;
  tmbt4.Enabled := true;
  tmarea.Enabled := true;
end;

procedure Tfrmtela2.tmbt1Timer(Sender: TObject);
begin
     //AI para o bt 1, movimento vertical ao longo da tela
//------------------------------------------------------------------------------
   if (TLbt1 < 776) and (gf1 < 1496)  then
   begin
      TLbt1 := TLbt1 + 30;
      imgbt1.top := TLbt1;
   end
//------------------------------------------------------------------------------
   else if (TLbt1 > 776) and (gf1 < 1496) then
   begin
       gf1 := gf1 + 50;
       imgbt1.Left := gf1;
       TLbt1 := 0;
   end
//------------------------------------------------------------------------------
   else if (gf1 >  1496)  then
   begin
      gf1 := 0;
      imgbt1.Left := gf1;
      TLbt1 := 0;
   end
//------------------------------------------------------------------------------

end;

procedure Tfrmtela2.tmbt2Timer(Sender: TObject);
begin
    //AI para o bt 2, movimento vertical ao longo da tela
//------------------------------------------------------------------------------
   if (TLbt2 <= 768) and (TLbt2 > 0) and (gf2 >0)  then
   begin
      TLbt2 := TLbt2 - 30;
      imgbt2.top := TLbt2;
   end
//------------------------------------------------------------------------------
   else if (TLbt2 < 0) and (gf2 >0) then
   begin
       gf2 := gf2 - 50;
       imgbt2.Left := gf2;
       TLbt2 := 767;
   end
//------------------------------------------------------------------------------
   else if (gf2 <0)  then
   begin
      gf2 := 1488;
      imgbt2.Left := gf2;
      TLbt2 := 767;
   end
//------------------------------------------------------------------------------

end;

procedure Tfrmtela2.tmbt3Timer(Sender: TObject);
begin
    //AI para o bt 3, movimento horizontal ao longo da tela
//------------------------------------------------------------------------------
   if  (gf3 <= 1352) and (gf3 >= 216) and (TLbt3 < 768)  then
   begin
       gf3 := gf3 - 30;
       imgbt3.Left := gf3;
   end
//------------------------------------------------------------------------------
   else if  (gf3 < 216) and (TLbt3 < 768) then
   begin
       gf3 :=  1352;
       imgbt3.Left := gf3;
       TLbt3 := TLbt3 + 50;
       imgbt3.Top := TLbt3;
   end
//------------------------------------------------------------------------------
   else if (TLbt3 > 768)  then
   begin
      TLbt3 := 0;
   end
//------------------------------------------------------------------------------

end;

procedure Tfrmtela2.tmbt4Timer(Sender: TObject);
begin
    //AI para o bt 4, movimento horizontal ao longo da tela, e o grande boss
//------------------------------------------------------------------------------
   if  (gf4 <= 1352) and (gf4 >= 216) and (TLbt4 > 0)  then
   begin
       gf4 := gf4 + 60;
       imgbt4.Left := gf4;
   end
//------------------------------------------------------------------------------
   else if  (gf4 > 1352) and (TLbt4 > 0) then
   begin
       gf4 :=  216;
       imgbt4.Left := gf4;
       TLbt4 := TLbt4 - 60;
       imgbt4.Top := TLbt4;
   end
//------------------------------------------------------------------------------
   else if (TLbt4 <0)  then
   begin
      TLbt4 := 768;
   end
//------------------------------------------------------------------------------

end;

procedure Tfrmtela2.tmareaTimer(Sender: TObject);
begin
    //Area onde fica os portais
//------------------------------------------------------------------------------
  if (imgp1.Top > 719 ) and (imgp1.top < 817) and (imgp1.Left >= 888 ) and (imgp1.left < 1032) then
  begin
    tmarea.enabled := false;
    tmbt1.Enabled := false;
    tmbt2.Enabled := false;
    tmbt3.Enabled := false;
    tmbt4.Enabled := false;
    frmtela2.close();
    frmtela3.Show();
  end
  //Colis�o das AIs
//------------------------------------------------------------------------------
  //Booth 1
  else if (imgp1.top >= imgbt1.top - 104) and (imgp1.top <= imgbt1.top + 104) and (imgp1.left >= imgbt1.left - 104) and (imgp1.left <= imgbt1.left + 104) then
  begin
    frmgameover.Show();
    tmarea.enabled := false;
    tmbt1.Enabled := false;
    tmbt2.Enabled := false;
    tmbt3.Enabled := false;
    tmbt4.Enabled := false;
    Form1.mpgame.Stop();
    frmtela2.Close();
  end
//------------------------------------------------------------------------------
  //Booth 2
  else if (imgp1.top >= imgbt2.top - 104) and (imgp1.top <= imgbt2.top + 104) and (imgp1.left >= imgbt2.left - 104) and (imgp1.left <= imgbt2.left + 104) then
  begin
    frmgameover.Show();
    tmarea.enabled := false;
    tmbt1.Enabled := false;
    tmbt2.Enabled := false;
    tmbt3.Enabled := false;
    tmbt4.Enabled := false;
    Form1.mpgame.Stop();
    frmtela2.Close();
  end
//------------------------------------------------------------------------------
  //Booth 3
  else if (imgp1.top >= imgbt3.top - 104) and (imgp1.top <= imgbt3.top + 104) and (imgp1.left >= imgbt3.left - 104) and (imgp1.left <= imgbt3.left + 104) then
  begin
    frmgameover.Show();
    tmarea.enabled := false;
    tmbt1.Enabled := false;
    tmbt2.Enabled := false;
    tmbt3.Enabled := false;
    tmbt4.Enabled := false;
    Form1.mpgame.Stop();
    frmtela2.Close();
  end
//------------------------------------------------------------------------------
  //Booth 4
  else if (imgp1.top >= imgbt4.top - 104) and (imgp1.top <= imgbt4.top + 104) and (imgp1.left >= imgbt4.left - 104) and (imgp1.left <= imgbt4.left + 104) then
  begin
    frmgameover.Show();
    tmarea.enabled := false;
    tmbt1.Enabled := false;
    tmbt2.Enabled := false;
    tmbt3.Enabled := false;
    tmbt4.Enabled := false;
    Form1.mpgame.Stop();
    frmtela2.Close();
  end
//------------------------------------------------------------------------------


end;

end.
