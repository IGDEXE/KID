unit U_gameover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, MPlayer;

type
  Tfrmgameover = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Timer3: TTimer;
    mpgameover: TMediaPlayer;
    procedure Timer3Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgameover: Tfrmgameover;
  cr : integer;

implementation

uses U_black, U_cred2;

{$R *.dfm}

procedure Tfrmgameover.Timer3Timer(Sender: TObject);
begin
   if (cr > 0) then
   begin
     cr := cr - 1;
     Label1.Caption := inttostr(cr);
   end
   else if (cr = 0) then
   begin
      frmgameover.Close();
   end
end;

procedure Tfrmgameover.FormShow(Sender: TObject);
begin
  mpgameover.Play();
  cr := 10;
  Label1.Caption:= inttostr(cr);
  Timer3.Enabled := true;
end;

procedure Tfrmgameover.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    Timer3.Enabled := false;
    mpgameover.stop();
    frmblack.Show();
    frmgameover.Close();

  end

end;

procedure Tfrmgameover.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  mpgameover.stop();
  
end;

end.
