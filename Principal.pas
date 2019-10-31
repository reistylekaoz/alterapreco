unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TdrmPrincipal = class(TForm)
    btnListar: TSpeedButton;
    btnSalvar: TSpeedButton;
    cmbConsulta: TComboBox;
    RadioGroup1: TRadioGroup;
    edtNome: TEdit;
    grid: TDBGrid;
    DS: TDataSource;
    Panel1: TPanel;
    lblValor: TLabel;
    btnPerc: TSpeedButton;
    RadioGroup2: TRadioGroup;
    rdgFormaAjuste: TRadioGroup;
    RadioGroup4: TRadioGroup;
    edtPerc: TEdit;
    procedure listafabricante;
    procedure listarprodutos;
    procedure ajustarpercentual;
    procedure btnListarClick(Sender: TObject);
    procedure btnPercClick(Sender: TObject);
    procedure rdgFormaAjusteClick(Sender: TObject);
    procedure edtPercKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  drmPrincipal: TdrmPrincipal;

implementation

{$R *.dfm}

uses Modulo;

procedure TdrmPrincipal.ajustarpercentual;
VAR
perc: Float64;
valoratual: Float64;
begin
  dmod.Qry.First;
  while not dmod.Qry.Eof do
  begin
     valoratual := dmod.Qry.FieldByName('VALOR_PRO').Value;
     perc := (valoratual * StrToFloat(edtPerc.Text)) / 100;

     dmod.Qry.edit;
     dmod.Qry.FieldValues['VALOR_PRO'] := valoratual + perc;
     dmod.Qry.Post;
     dmod.Qry.Next;
     perc := 0;
  end;

end;

procedure TdrmPrincipal.btnListarClick(Sender: TObject);
begin
   listarprodutos;
end;

procedure TdrmPrincipal.btnPercClick(Sender: TObject);
begin
if MessageDlg('Deseja mosmo efetuar o ajuste?', mtConfirmation,
  [mbYes, mbNo], 0) = mrYes then
begin
ajustarpercentual;
listarprodutos;
end;




end;

procedure TdrmPrincipal.edtPercKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8]) then key :=#0;
end;

procedure TdrmPrincipal.listafabricante;
begin
  DMod.Qry.SQL.Clear;
  DMod.Qry.SQL.Add
    ('select p.cod_pro, p.nome_pro, p.valor_pro from produto p');
  DMod.Qry.SQL.Add(' where p.cod_sec = :pesquisa');
  DMod.Qry.ParamByName('pesquisa').Value := edtID.Text;
  DMod.Qry.Open;
  grid.Columns[0].FieldName := 'COD_PRO';
  grid.Columns[1].FieldName := 'NOME_PRO';
  grid.Columns[2].FieldName := 'VALOR_PRO';
  GRID.Columns[0].Width := 60;
  GRID.Columns[1].Width := 460;
  GRID.Columns[2].Width := 60;
end;

procedure TdrmPrincipal.listarprodutos;
begin
  DMod.Qry.SQL.Clear;
  DMod.Qry.SQL.Add
    ('select p.cod_pro, p.nome_pro, p.valor_pro from produto p');
  DMod.Qry.SQL.Add(' where p.cod_sec = :pesquisa');
  DMod.Qry.ParamByName('pesquisa').Value := edtID.Text;
  DMod.Qry.Open;
  grid.Columns[0].FieldName := 'COD_PRO';
  grid.Columns[1].FieldName := 'NOME_PRO';
  grid.Columns[2].FieldName := 'VALOR_PRO';
  GRID.Columns[0].Width := 60;
  GRID.Columns[1].Width := 460;
  GRID.Columns[2].Width := 60;


end;

procedure TdrmPrincipal.rdgFormaAjusteClick(Sender: TObject);
begin
if rdgFormaAjuste.ItemIndex = 0 then
      begin
        lblValor.Caption := '%';

      end
      else
      begin
        lblValor.Caption := 'R$';
      end;
end;

end.
