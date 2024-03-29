unit TableKelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm5 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    e1: TEdit;
    e2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    cbb1: TComboBox;
    b6: TButton;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdDBfrxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    procedure bersih;
    procedure enable;
    procedure setawal;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  id : string;

implementation

{$R *.dfm}

procedure TForm5.bersih;
begin
e1.Clear;
e2.Clear;
cbb1.text := '';
end;

procedure TForm5.enable;
begin
e1.Enabled:= True;
e2.Enabled:= True;
cbb1.Enabled:= True;
end;

procedure TForm5.setawal;
begin
bersih;

e1.Enabled:= False;
e2.Enabled:= False;
cbb1.Enabled:= False;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm5.b1Click(Sender: TObject);
begin
bersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

enable;
end;

procedure TForm5.b2Click(Sender: TObject);
begin
  if (e1.Text= '')or (e2.Text ='')or(cbb1.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nama',e1.Text,[])) and (zqry1.Locate('jenis',e2.Text,[])) then
begin
ShowMessage('DATA KELAS SUDAH DIGUNAKAN');
setawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_kelas values (null,"'+e1.Text+'","'+e2.Text+'","'+cbb1.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_kelas');
zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
setawal;

end;
end;

procedure TForm5.b3Click(Sender: TObject);
begin
if (e1.Text= '')or (e2.Text ='')or(cbb1.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (e1.Text = zqry1.Fields[1].AsString) and (e2.Text = zqry1.Fields[2].AsString) and (cbb1.Text = zqry1.Fields[3].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
setawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_kelas').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_kelas set nama= "'+e1.Text+'",jenis="'+e2.Text+'" where id_kelas="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_kelas');
zqry1.Open;
setawal;
end;
end;

procedure TForm5.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_kelas').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_kelas where id_kelas="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
setawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
setawal;
end;
end;

procedure TForm5.b5Click(Sender: TObject);
begin
setawal;
end;

procedure TForm5.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm5.FormShow(Sender: TObject);
begin
setawal;
end;

procedure TForm5.dg1CellClick(Column: TColumn);
begin
enable;
b1.Enabled:= False;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
e1.Text:= zqry1.FieldList[1].AsString;
e2.Text:= zqry1.FieldList[2].AsString;
cbb1.Text:= zqry1.FieldList[3].AsString;
end;

end.
