unit uAparelhos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, DBCtrls, LR_Class, LR_DBSet, DB, uDataModule;

type

  { TFAparelho }

  TFAparelho = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    DSAparelho: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FAparelho: TFAparelho;
  id: Integer;

implementation

{$R *.lfm}

{ TFAparelho }

procedure TFAparelho.Button2Click(Sender: TObject);
begin
  DSAparelho.DataSet.Insert;
  DataModuleF.QRYAparelhoid_cliente.AsInteger:= DataModuleF.QRYCientesid_cliente.AsInteger;
  DBEdit2.SetFocus;
end;

procedure TFAparelho.Button3Click(Sender: TObject);
begin
  if  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    DSAparelho.DataSet.Delete;
  end;
end;

procedure TFAparelho.Button4Click(Sender: TObject);
begin
  id:= DataModuleF.QRYAparelhoid_cliente.AsInteger;
  DataModuleF.QRYAparelho.Close;
  DataModuleF.QRYAparelho.SQL.Clear;
  DataModuleF.QRYAparelho.SQL.Add('SELECT * FROM APARELHO WHERE LOWER(nome_aparelho) LIKE :pAparelho AND id_cliente  = :CLIENTE_ID');
  DataModuleF.QRYAparelho.Params.ParamByName('CLIENTE_ID').AsString:= IntToStr(DataModuleF.QRYCientesid_cliente.AsInteger);
  DataModuleF.QRYAparelho.ParamByName('pAparelho').AsString:= AnsiLowerCase('%'+Edit1.Text+'%');
  DataModuleF.QRYAparelho.Open;
end;


procedure TFAparelho.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSAparelho.DataSet.Close;
  CloseAction:= caFree;
end;

procedure TFAparelho.FormShow(Sender: TObject);
begin
  DSAparelho.DataSet.Open;
end;



procedure TFAparelho.Button1Click(Sender: TObject);
begin
  if DataModuleF.QRYAparelho.State in [dsEdit, dsInsert] then
  begin
       DataModuleF.QRYAparelho.Post;
       DataModuleF.QRYAparelho.ApplyUpdates;
  end;
end;

end.

