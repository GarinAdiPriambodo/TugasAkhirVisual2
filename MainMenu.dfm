object Form1: TForm1
  Left = 231
  Top = 188
  Width = 1044
  Height = 540
  Caption = 'Main Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 56
    Top = 64
    object FORMS1: TMenuItem
      Caption = 'FORMS'
      object ABLESISWA1: TMenuItem
        Caption = 'TABLE SISWA'
        OnClick = ABLESISWA1Click
      end
      object ABLEORTU1: TMenuItem
        Caption = 'TABLE ORTU'
        OnClick = ABLEORTU1Click
      end
    end
  end
end
