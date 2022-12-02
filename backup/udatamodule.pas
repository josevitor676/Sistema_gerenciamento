unit uDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModuleF }

  TDataModuleF = class(TDataModule)
    QRYAparelhodt_reparo: TDateTimeField;
    QRYAparelhoid_aparelho: TLongintField;
    QRYAparelhoid_cliente: TLongintField;
    QRYAparelhomarca: TStringField;
    QRYAparelhonome_aparelho: TStringField;
    QRYAparelhopeca_trocada: TStringField;
    QRYAparelhovalor_conserto: TFloatField;
    QRYCientesdt_cadastro: TDateTimeField;
    QRYCientesid_cliente: TLongintField;
    QRYCientesnome_cliente: TStringField;
    QRYCientestelefone_cliente: TStringField;
    ZConnection1: TZConnection;
    QRYCientes: TZQuery;
    UpdateClientes: TZUpdateSQL;
    QRYAparelho: TZQuery;
    UpdateaAparelho: TZUpdateSQL;
    QRYUsuarios: TZQuery;
    UpdateUsuarios: TZUpdateSQL;
  private

  public

  end;

var
  DataModuleF: TDataModuleF;

implementation

{$R *.lfm}

end.

