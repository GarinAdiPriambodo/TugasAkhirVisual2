program TugasAkhir;

uses
  Forms,
  MainMenu in 'MainMenu.pas' {Form1},
  TableSiswa in 'TableSiswa.pas' {Form2},
  TableOrtu in 'TableOrtu.pas' {Form3},
  TableWaliKelas in 'TableWaliKelas.pas' {Form4},
  TableKelas in 'TableKelas.pas' {Form5},
  TableHubungan in 'TableHubungan.pas' {Form6},
  TablePoin in 'TablePoin.pas' {Form7},
  TableSemester in 'TableSemester.pas' {Form8},
  TableUser in 'TableUser.pas' {Form9},
  FormLogin in 'FormLogin.pas' {Form10},
  FormDaftar in 'FormDaftar.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
