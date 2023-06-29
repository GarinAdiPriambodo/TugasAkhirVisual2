object Form1: TForm1
  Left = 273
  Top = 207
  Width = 1044
  Height = 536
  Caption = 'Main Menu'
  Color = clMoneyGreen
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
      object ABLEWALIKELAS1: TMenuItem
        Caption = 'TABLE WALI KELAS'
        OnClick = ABLEWALIKELAS1Click
      end
      object ABLEKELAS1: TMenuItem
        Caption = 'TABLE KELAS'
        OnClick = ABLEKELAS1Click
      end
    end
  end
end
