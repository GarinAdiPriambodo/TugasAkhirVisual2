unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    FORMS1: TMenuItem;
    ABLESISWA1: TMenuItem;
    ABLEORTU1: TMenuItem;
    ABLEWALIKELAS1: TMenuItem;
    ABLEKELAS1: TMenuItem;
    procedure ABLESISWA1Click(Sender: TObject);
    procedure ABLEORTU1Click(Sender: TObject);
    procedure ABLEWALIKELAS1Click(Sender: TObject);
    procedure ABLEKELAS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses TableSiswa, TableOrtu, TableWaliKelas, TableKelas;

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

end.
