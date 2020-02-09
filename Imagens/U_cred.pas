unit U_cred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  Tfrmlogo = class(TForm)
    Image1: TImage;
    Timer2: TTimer;
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogo: Tfrmlogo;
  cont2 : integer;

implementation

uses U_black, U_cred2;

{$R *.dfm}

procedure Tfrmlogo.Timer2Timer(Sender: TObject);
begin
   if (cont2 < 3) then
 begin
  cont2 := cont2 + 1;
 end
 else if (cont2 > 2) then
 begin
    Timer2.Enabled := false;
    frmmenu.Show();
    frmlogo.Close();
 end
end;

procedure Tfrmlogo.FormShow(Sender: TObject);
begin
  Timer2.Enabled := true;
end;

end.
