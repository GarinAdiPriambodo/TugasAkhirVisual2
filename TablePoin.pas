unit TablePoin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm7 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    e1: TEdit;
    e2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    b6: TButton;
    cbb1: TComboBox;
    cbb2: TComboBox;
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
    procedure dg1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  id : string;

implementation

{$R *.dfm}

procedure TForm7.bersih;
begin
e1.Clear;
e2.Clear;
cbb1.text:= '';
cbb2.text:= '';
end;

procedure TForm7.enable;
begin
e1.Enabled:= True;
e2.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
end;

procedure TForm7.setawal;
begin
bersih;

e1.Enabled:= false;
e2.Enabled:= false;
cbb1.Enabled:= false;
cbb2.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm7.b1Click(Sender: TObject);
begin
bersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

enable;
end;

procedure TForm7.b2Click(Sender: TObject);
begin
if (e1.Text= '')or (e2.Text ='')or(cbb1.Text= '')or (cbb2.Text= '') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nama_poin',e1.Text,[])) and (zqry1.Locate('bobot',e2.Text,[])) then
begin
ShowMessage('DATA POIN SUDAH DIGUNAKAN');
setawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_poin values (null,"'+e1.Text+'","'+e2.Text+'","'+cbb1.Text+'","'+cbb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
setawal;

end;
end;

procedure TForm7.b3Click(Sender: TObject);
begin
if (e1.Text= '')or (e2.Text ='')or(cbb1.Text= '')or (cbb2.Text= '') then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (e1.Text = zqry1.Fields[1].AsString) and (e2.Text = zqry1.Fields[2].AsString) and (cbb1.Text = zqry1.Fields[3].AsString) and (cbb2.Text = zqry1.Fields[4].AsString)  then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
setawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_poin').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_poin set nama_poin= "'+e1.Text+'",bobot="'+e2.Text+'",jenis="'+cbb1.Text+'",status="'+cbb2.Text+'" where id_poin="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_poin');
zqry1.Open;
setawal;
end;
end;

procedure TForm7.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_poin').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_poin where id_poin="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_poin');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
setawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
setawal;
end;
end;

procedure TForm7.b5Click(Sender: TObject);
begin
setawal;
end;

procedure TForm7.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm7.dg1CellClick(Column: TColumn);
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
cbb2.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
setawal;
end;

end.
