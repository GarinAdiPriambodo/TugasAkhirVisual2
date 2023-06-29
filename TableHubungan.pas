unit TableHubungan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm6 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
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
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdDBfrxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    zqry3: TZQuery;
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
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  id : string;

implementation

{$R *.dfm}

procedure TForm6.bersih;
begin
cbb1.text:= '';
cbb2.text:= '';
e1.Clear;
e2.Clear;
e3.Clear;
end;

procedure TForm6.enable;
begin
cbb1.Enabled:= True;
cbb2.Enabled:= True;
e1.Enabled:= True;
e2.Enabled:= True;
e3.Enabled:= True;
end;

procedure TForm6.setawal;
begin
bersih;

cbb1.Enabled:= false;
cbb2.Enabled:= false;
e1.Enabled:= false;
e2.Enabled:= false;
e3.Enabled:= false;


b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm6.b1Click(Sender: TObject);
begin
bersih;

b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

enable;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text= '') or (e1.Text= '')or (e2.Text ='') or (e3.Text ='') then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into table_hubungan values (null,"'+cbb1.Text+'","'+cbb2.Text+'","'+e1.Text+'","'+e2.Text+'","'+e3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!');
setawal;

end;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if (cbb1.Text= '')or (cbb2.Text= '') or (e1.Text= '')or (e2.Text ='') or (e3.Text ='')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (cbb1.Text = zqry1.Fields[1].AsString) and (cbb2.Text = zqry1.Fields[2].AsString) and (e1.Text = zqry1.Fields[3].AsString) and (e2.Text = zqry1.Fields[4].AsString) and (e3.Text = zqry1.Fields[5].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
setawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_hub').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update table_hubungan set id_siswa="'+cbb1.Text+'",id_ortu="'+cbb2.Text+'",status_hubungan= "'+e1.Text+'",keterangan="'+e2.Text+'" ,status_ortu="'+e3.Text+'" where id_hub="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_hubungan');
zqry1.Open;
setawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_hub').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from table_hubungan where id_hub="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from table_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
setawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
setawal;
end;
end;

procedure TForm6.b5Click(Sender: TObject);
begin
setawal;
end;

procedure TForm6.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm6.dg1CellClick(Column: TColumn);
begin
enable;
b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
cbb1.Text:= zqry1.FieldList[1].AsString;
cbb2.Text:= zqry1.FieldList[2].AsString;
e1.Text:= zqry1.FieldList[3].AsString;
e2.Text:= zqry1.FieldList[4].AsString;
e3.Text:= zqry1.FieldList[5].AsString;
end;

procedure TForm6.FormCreate(Sender: TObject);
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
  cbb2.items.add(zqry3.fieldbyname('id_ortu').asstring);
  zqry3.Next;
end;
end;

end.
