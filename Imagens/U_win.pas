unit U_win;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, MPlayer;

type
  Tfrmwin = class(TForm)
    Image1: TImage;
    mpwin: TMediaPlayer;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwin: Tfrmwin;

implementation

uses U_black, U_cred2, U_cred;

{$R *.dfm}

procedure Tfrmwin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    frmcreditos.Show();
    mpwin.Stop();
    frmwin.Close();

  end
  else if (key = 18) and ( key = 115) then
  begin
    mpwin.Stop();
    Application.Terminate();
  end
end;

procedure Tfrmwin.FormShow(Sender: TObject);
begin
  mpwin.Play();
end;

end.
