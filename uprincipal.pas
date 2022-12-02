unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, DBGrids, DBCtrls, LR_Class, LR_DBSet, uDataModule, uAparelhos, LR_DSet;

type

  { TFprincipal }

  TFprincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DSClientes: TDataSource;
    DBGrid1: TDBGrid;
    EditPesquisar: TEdit;
    frDBDataSetAparelhoRel: TfrDBDataSet;
    frReportAparelhoRel: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure frDBDataSetAparelhoCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frDBDataSetAparelhoRelCheckEOF(Sender: TObject; var Eof: Boolean);
  private

  public

  end;

var
  Fprincipal: TFprincipal;
  FAparelho: TFAparelho;

implementation

{$R *.lfm}

{ TFprincipal }

procedure TFprincipal.Button1Click(Sender: TObject);
begin

  if DataModuleF.QRYCientes.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYCientes.Post;
       DataModuleF.QRYCientes.ApplyUpdates;
  end;
end;

procedure TFprincipal.Button2Click(Sender: TObject);
begin
  DSClientes.DataSet.Insert;
  DataModuleF.QRYCientesdt_cadastro.AsDateTime:= StrToDate(FormatDateTime('dd/mm/yyyy', now));
  DBEdit1.SetFocus;
end;

procedure TFprincipal.Button3Click(Sender: TObject);
begin
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSClientes.DataSet.Delete;
  end;
end;

procedure TFprincipal.Button4Click(Sender: TObject);
begin
  DataModuleF.QRYCientes.Close;
  DataModuleF.QRYCientes.SQL.Clear;
  DataModuleF.QRYCientes.SQL.Add('SELECT * FROM CLIENTES_APP WHERE LOWER(NOME_CLIENTE) LIKE :pCliente');
  DataModuleF.QRYCientes.ParamByName('pCliente').AsString:= AnsiLowerCase('%'+EditPesquisar.Text+'%');
  DataModuleF.QRYCientes.Open;
end;

procedure TFprincipal.Button5Click(Sender: TObject);
begin
    frReportAparelhoRel.LoadFromFile('AparelhoRel.lrf');
    frReportAparelhoRel.PrepareReport;
    frReportAparelhoRel.ShowReport;
end;

procedure TFprincipal.DBGrid1DblClick(Sender: TObject);
begin
  DataModuleF.QRYAparelho.Close;
  DataModuleF.QRYAparelho.Params.ParamByName('CLIENTE_ID').AsString:= IntToStr(DataModuleF.QRYCientesid_cliente.AsInteger);
  DataModuleF.QRYAparelho.Open;
  FAparelho := TFAparelho.Create(self);
  FAparelho.ShowModal;

end;

procedure TFprincipal.frDBDataSetAparelhoCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;

procedure TFprincipal.frDBDataSetAparelhoRelCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;



end.

