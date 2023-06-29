unit TableSemester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ComCtrls, StdCtrls, Grids,
  DBGrids;

type
  TForm8 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l8: TLabel;
    l9: TLabel;
    l7: TLabel;
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
    e3: TEdit;
    cbb3: TComboBox;
    cbb4: TComboBox;
    cbb5: TComboBox;
    dtp1: TDateTimePicker;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdDBfrxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    zqry3: TZQuery;
    zqry4: TZQuery;
    zqry5: TZQuery;
    zqry6: TZQuery;
    procedure bersih;
    procedure enable;
    procedure setawal;
    procedure FormCreate(Sender: TObject);
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
  Form8: TForm8;
  id : string;

implementation

{$R *.dfm}

procedure TForm8.bersih;
begin
cbb1.text:= '';
cbb2.text:= '';
cbb3.text:= '';
cbb4.text:= '';
cbb5.text:= '';
e1.Clear;
e2.Clear;
e3.Clear;
end;

procedure TForm8.enable;
begin
cbb1.Enabled:= True;
cbb2.Enabled:= True;
cbb3.Enabled:= True;
cbb4.Enabled:= True;
cbb5.Enabled:= True;
dtp1.Enabled:=True;
e1.Enabled:= True;
e2.Enabled:= True;
e3.Enabled:= True;
end;

procedure TForm8.setawal;
begin
bersih;

cbb1.Enabled:= false;
cbb2.Enabled:= false;
cbb3.Enabled:= false;
cbb4.Enabled:= false;
cbb5.Enabled:= false;
dtp1.Enabled:= False;
e1.Enabled:= false;
e2.Enabled:= false;
e3.Enabled:= false;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
zqry2.First;
while not zqry2.Eof do
begin
  cbb1.items.add(zqry2.fieldbyname('id_siswa').asstring);
  zqry2.Next;
end;
zqry3.First;
while not zqry3.Eof do
begin
  cbb2.items.add(zqry3.fieldbyname('id_poin').asstring);
  zqry3.Next;
end;
zqry4.First;
while not zqry4.Eof do
begin
  cbb3.items.add(zqry4.fieldbyname('id_wali').asstring);
  zqry4.Next;
end;
zqry5.First;
while not zqry5.Eof do
begin
  cbb4.items.add(zqry5.fieldbyname('id_ortu').asstring);
  zqry5.Next;
end;
zqry6.First;
while not zqry6.Eof do
begin
  cbb5.items.add(zqry6.fieldbyname('id_kelas').asstring);
  zqry6.Next;
end;
end;

procedure TForm8.b1Click(Sender: TObject);
begin
bersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

enable;
end;

procedure TForm8.b2Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text= '') or (cbb3.Text= '')or (cbb4.Text= '') or (cbb5.Text= '') or (e1.Text= '')or (e2.Text ='') or (e3.Text ='') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_semester values (null,"'+cbb1.Text+'","'+cbb2.Text+'","'+cbb3.Text+'","'+cbb4.Text+'","'+cbb5.Text+'","'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'","'+e1.Text+'","'+e2.Text+'","'+e3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_semester');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
setawal;

end;
end;

procedure TForm8.b3Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text= '') or (cbb3.Text= '') or(cbb4.Text= '') or(cbb5.Text= '') or (e1.Text= '')or (e2.Text ='') or (e3.Text ='')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (cbb1.Text = zqry1.Fields[1].AsString) and (cbb2.Text = zqry1.Fields[2].AsString)and (cbb3.Text = zqry1.Fields[3].AsString)and (cbb4.Text = zqry1.Fields[4].AsString)and (cbb5.Text = zqry1.Fields[5].AsString) and (e1.Text = zqry1.Fields[7].AsString) and (e2.Text = zqry1.Fields[8].AsString) and (e3.Text = zqry1.Fields[9].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
setawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_semester').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_semester set id_siswa="'+cbb1.Text+'",id_poin="'+cbb2.Text+'",id_wali="'+cbb3.Text+'",id_ortu="'+cbb4.Text+'",id_kelas="'+cbb5.Text+'",tanggal= "'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'",semester="'+e1.Text+'",status="'+e2.Text+'",tingkat_kelas="'+e3.Text+'" where id_semester="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_semester');
zqry1.Open;
setawal;
end;
end;

procedure TForm8.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_semester').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_semester where id_semester="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_semester');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
setawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
setawal;
end;
end;

procedure TForm8.b5Click(Sender: TObject);
begin
setawal;
end;

procedure TForm8.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm8.dg1CellClick(Column: TColumn);
begin
enable;
b1.Enabled:= False;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
cbb1.Text:= zqry1.FieldList[1].AsString;
cbb2.Text:= zqry1.FieldList[2].AsString;
cbb3.Text:= zqry1.FieldList[3].AsString;
cbb4.Text:= zqry1.FieldList[4].AsString;
cbb5.Text:= zqry1.FieldList[5].AsString;
dtp1.Date:=Form8.zqry1.Fields[6].AsDateTime;
e1.Text:= zqry1.FieldList[7].AsString;
e2.Text:= zqry1.FieldList[8].AsString;
e3.Text:= zqry1.FieldList[9].AsString;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
setawal;
end;

end.
