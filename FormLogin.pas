unit FormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls, frxpngimage, ExtCtrls;

type
  TForm10 = class(TForm)
    e1: TEdit;
    e2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    img1: TImage;
    l2: TLabel;
    l3: TLabel;
    l1: TLabel;
    procedure b1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses TableUser, MainMenu, FormDaftar;

{$R *.dfm}

procedure TForm10.b1Click(Sender: TObject);
begin
with zqry1 do begin
SQL.Clear;
SQL.Add('select * from table_user where username='+QuotedStr(e1.Text));
open;
end;
//end with
//jika tidak ditemukan data yang dicari
//maka tampilkan pesan

if zqry1.RecordCount=0
then
Application.MessageBox('Maaf User Name Tidak Ditemukan','Informasi',MB_OK or MB_ICONINFORMATION)
else
begin
if zqry1.FieldByName('password').AsString<>e2.Text
then
Application.MessageBox('Pastikan Password yang Anda Masukkan Benar','error',MB_OK or MB_ICONERROR)
else
begin
hide;
Form1.Show;
end;
end;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
e1.text:='';
e2.text:='';
end;

procedure TForm10.b2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm10.b3Click(Sender: TObject);
begin
Hide;
form11.ShowModal;
end;

end.
