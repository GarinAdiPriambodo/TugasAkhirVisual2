unit TableOrtu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm3 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    l9: TLabel;
    e1: TEdit;
    e2: TEdit;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dg1: TDBGrid;
    b6: TButton;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    cbb1: TComboBox;
    e7: TEdit;
    e8: TEdit;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdDBfrxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    procedure bersih;
    procedure enable;
    procedure setawal;
    procedure FormShow(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  id : string;

implementation

{$R *.dfm}

procedure TForm3.bersih;
begin
e1.Clear;
e2.Clear;
e3.Clear;
e4.Clear;
e5.Clear;
e6.Clear;
cbb1.text:= '';
e7.Clear;
e8.Clear;
end;

procedure TForm3.enable;
begin
e1.Enabled:= True;
e2.Enabled:= True;
e3.Enabled:= True;
e4.Enabled:= True;
e5.Enabled:= True;
e6.Enabled:= True;
cbb1.Enabled:= True;
e7.Enabled:= True;
e8.Enabled:= True;
end;

procedure TForm3.setawal;
begin
bersih;

e1.Enabled:= false;
e2.Enabled:= false;
e3.Enabled:= false;
e4.Enabled:= false;
e5.Enabled:= false;
e6.Enabled:= false;
cbb1.Enabled:= false;
e7.Enabled:= false;
e8.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
setawal;
end;

procedure TForm3.b1Click(Sender: TObject);
begin
bersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

enable;
end;

procedure TForm3.b2Click(Sender: TObject);
begin
if (e1.Text= '')or (e2.Text ='') or (e3.Text= '')or (e4.Text ='') or (e5.Text= '')or (e6.Text ='') or (cbb1.Text= '') or (e7.Text= '') or (e8.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nik',e1.Text,[])) and (zqry1.Locate('nama',e2.Text,[])) then
begin
ShowMessage('DATA ORANG TUA SUDAH DIGUNAKAN');
setawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_ortu values (null,"'+e1.Text+'","'+e2.Text+'","'+e3.Text+'","'+e4.Text+'","'+e5.Text+'","'+e6.Text+'","'+cbb1.Text+'","'+e7.Text+'","'+e8.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
setawal;

end;
end;

procedure TForm3.b3Click(Sender: TObject);
begin
if (e1.Text= '')or (e2.Text ='') or (e3.Text= '')or (e4.Text ='') or (e5.Text= '')or (e6.Text ='') or (cbb1.Text= '')or (e7.Text= '')or (e8.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (e1.Text = zqry1.Fields[1].AsString) and (e2.Text = zqry1.Fields[2].AsString) and (e3.Text = zqry1.Fields[3].AsString) and (e4.Text = zqry1.Fields[4].AsString) and (e5.Text = zqry1.Fields[5].AsString) and (e6.Text = zqry1.Fields[6].AsString)and (cbb1.Text = zqry1.Fields[7].AsString) and (e7.Text = zqry1.Fields[8].AsString) and (e8.Text = zqry1.Fields[9].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
setawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_ortu').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_ortu set nik= "'+e1.Text+'",nama="'+e2.Text+'",pendidikan="'+e3.Text+'",pekerjaan="'+e4.Text+'",telp="'+e5.Text+'",alamat="'+e6.Text+'",jenis_kelamin="'+cbb1.Text+'",agama="'+e7.Text+'",status="'+e8.Text+'" where id_ortu="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_ortu');
zqry1.Open;
setawal;
end;
end;

procedure TForm3.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_ortu').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_ortu where id_ortu="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_ortu');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
setawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
setawal;
end;
end;

procedure TForm3.b5Click(Sender: TObject);
begin
setawal;
end;

procedure TForm3.dg1CellClick(Column: TColumn);
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
e3.Text:= zqry1.FieldList[3].AsString;
e4.Text:= zqry1.FieldList[4].AsString;
e5.Text:= zqry1.FieldList[5].AsString;
e6.Text:= zqry1.FieldList[6].AsString;
cbb1.Text:= zqry1.FieldList[7].AsString;
e7.Text:= zqry1.FieldList[8].AsString;
e8.Text:= zqry1.FieldList[9].AsString;
end;

procedure TForm3.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
