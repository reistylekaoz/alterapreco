object drmPrincipal: TdrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 559
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnListar: TSpeedButton
    Left = 619
    Top = 20
    Width = 97
    Height = 32
    Caption = 'Listar'
    OnClick = btnListarClick
  end
  object btnSalvar: TSpeedButton
    Left = 722
    Top = 20
    Width = 98
    Height = 32
    Caption = 'Salvar'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 217
    Height = 49
    Caption = 'Consultar Por:'
    TabOrder = 1
  end
  object cmbConsulta: TComboBox
    Left = 16
    Top = 26
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'Fabricante'
    Items.Strings = (
      'Fabricante'
      'Se'#231#227'o'
      'Grupo de ICMS'
      'Produtos Pesados na Balan'#231'a')
  end
  object edtNome: TEdit
    Left = 328
    Top = 26
    Width = 285
    Height = 21
    TabOrder = 2
  end
  object grid: TDBGrid
    Left = 8
    Top = 63
    Width = 812
    Height = 418
    DataSource = DS
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        ReadOnly = True
        Title.Caption = 'C'#243'digo'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        ReadOnly = True
        Title.Caption = 'Nome do Produto'
        Width = 460
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Pre'#231'o de Venda'
        Width = 86
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 631
    Top = 487
    Width = 189
    Height = 64
    Caption = 'Ajustar'
    TabOrder = 4
    VerticalAlignment = taAlignTop
    object lblValor: TLabel
      Left = 6
      Top = 31
      Width = 32
      Height = 19
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPerc: TSpeedButton
      Left = 121
      Top = 19
      Width = 63
      Height = 41
      Caption = 'Ajustar'
      OnClick = btnPercClick
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 487
    Width = 209
    Height = 64
    Caption = 'Ajustar valores'
    Items.Strings = (
      'Pre'#231'o de Custo'
      'Pre'#231'o de Venda'
      'Ambos')
    TabOrder = 5
  end
  object rdgFormaAjuste: TRadioGroup
    Left = 223
    Top = 487
    Width = 210
    Height = 64
    Caption = 'Forma de Ajuste'
    ItemIndex = 1
    Items.Strings = (
      'Percentual'
      'Valor')
    TabOrder = 6
    OnClick = rdgFormaAjusteClick
  end
  object RadioGroup4: TRadioGroup
    Left = 439
    Top = 487
    Width = 186
    Height = 64
    Caption = 'Tipo de ajuste'
    Items.Strings = (
      'Aumentar'
      'Diminuir')
    TabOrder = 7
  end
  object edtPerc: TEdit
    Left = 664
    Top = 510
    Width = 82
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnKeyPress = edtPercKeyPress
  end
  object DS: TDataSource
    DataSet = dmod.Qry
    Left = 608
  end
end
