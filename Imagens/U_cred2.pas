unit U_cred2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  Tfrmblack = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmblack: Tfrmblack;
  cont : integer;

implementation

uses U_black;



{$R *.dfm}

procedure Tfrmblack.Timer1Timer(Sender: TObject);
begin
 if (cont < 3) then
 begin
  cont := cont + 1;
 end
 else if (cont > 2) then
 begin
    Timer1.Enabled := false;
    frmmenu.Show();
    frmblack.Hide();
 end
end;

procedure Tfrmblack.FormShow(Sender: TObject);
begin
  cont := 0;
  Timer1.Enabled := true;
end;

end.
