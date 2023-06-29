program TugasAkhir;

uses
  Forms,
  MainMenu in 'MainMenu.pas' {Form1},
  TableSiswa in 'TableSiswa.pas' {Form2},
  TableOrtu in 'TableOrtu.pas' {Form3},
  TableWaliKelas in 'TableWaliKelas.pas' {Form4},
  TableKelas in 'TableKelas.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
