unit U_black;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, XPMan, MPlayer;

type
  Tfrmmenu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    XPManifest1: TXPManifest;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MediaPlayer1: TMediaPlayer;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmenu: Tfrmmenu;

implementation

uses U_mapa, U_cred2, U_cred;

{$R *.dfm}

procedure Tfrmmenu.Button1Click(Sender: TObject);
begin
  Form1.Show();
  MediaPlayer1.Stop();
  frmmenu.Close();
end;

procedure Tfrmmenu.Button3Click(Sender: TObject);
begin
  frmmenu.Close();
   frmblack.Close();
end;

procedure Tfrmmenu.FormShow(Sender: TObject);
begin
  MediaPlayer1.FileName := 'musicas\game.mp3';
  MediaPlayer1.Play();
end;

procedure Tfrmmenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Stop();
   ;
end;

procedure Tfrmmenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 18) and ( key = 115) then
  begin
    MediaPlayer1.Stop();
    Application.Terminate();
  end
end;

procedure Tfrmmenu.Button2Click(Sender: TObject);
begin
    frmcreditos.Show();
    MediaPlayer1.Stop();
    frmmenu.Close();
end;

end.
