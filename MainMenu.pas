unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    FORMS1: TMenuItem;
    ABLESISWA1: TMenuItem;
    ABLEORTU1: TMenuItem;
    ABLEWALIKELAS1: TMenuItem;
    ABLEKELAS1: TMenuItem;
    ABLESEMESTER1: TMenuItem;
    ABLE1: TMenuItem;
    ABLESEMESTER2: TMenuItem;
    ABLEUSER1: TMenuItem;
    LOGOUT1: TMenuItem;
    EXIT1: TMenuItem;
    img1: TImage;
    procedure ABLESISWA1Click(Sender: TObject);
    procedure ABLEORTU1Click(Sender: TObject);
    procedure ABLEWALIKELAS1Click(Sender: TObject);
    procedure ABLEKELAS1Click(Sender: TObject);
    procedure ABLESEMESTER1Click(Sender: TObject);
    procedure ABLE1Click(Sender: TObject);
    procedure ABLESEMESTER2Click(Sender: TObject);
    procedure ABLEUSER1Click(Sender: TObject);
    procedure LOGOUT1Click(Sender: TObject);
    procedure EXIT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses TableSiswa, TableOrtu, TableWaliKelas, TableKelas, TableHubungan,
  TablePoin, TableSemester, TableUser, FormLogin;

{$R *.dfm}

procedure TForm1.ABLESISWA1Click(Sender: TObject);
begin
form2.showmodal;
end;

procedure TForm1.ABLEORTU1Click(Sender: TObject);
begin
form3.showmodal;
end;

procedure TForm1.ABLEWALIKELAS1Click(Sender: TObject);
begin
form4.showmodal;
end;

procedure TForm1.ABLEKELAS1Click(Sender: TObject);
begin
form5.showmodal;
end;

procedure TForm1.ABLESEMESTER1Click(Sender: TObject);
begin
form6.showmodal;
end;

procedure TForm1.ABLE1Click(Sender: TObject);
begin
form7.showmodal;
end;

procedure TForm1.ABLESEMESTER2Click(Sender: TObject);
begin
form8.showmodal;
end;

procedure TForm1.ABLEUSER1Click(Sender: TObject);
begin
form9.showmodal;
end;

procedure TForm1.LOGOUT1Click(Sender: TObject);
begin
hide;
form10.Show;
end;

procedure TForm1.EXIT1Click(Sender: TObject);
begin
if MessageDlg('APAKAH INGIN MENUTUP APLIKASI INI ?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
Application.Terminate;
end else
begin
hide;
form1.ShowModal;
end;

end;

end.
