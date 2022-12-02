unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uAlterarSenha, uDataModule, uPrincipal;

type

  { TFEntrar }

  TFEntrar = class(TForm)
    BtnEntrar: TButton;
    BtnAlterarSenha: TButton;
    EdtSenha: TEdit;
    EdtUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnAlterarSenhaClick(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
  private

  public

  end;

var
  FEntrar: TFEntrar;

implementation

{$R *.lfm}

{ TFEntrar }

procedure TFEntrar.BtnAlterarSenhaClick(Sender: TObject);
begin
  FAlterarSenha := TFAlterarSenha.Create(Self);
  FAlterarSenha.ShowModal;
end;

procedure TFEntrar.BtnEntrarClick(Sender: TObject);
begin
  DataModuleF.QRYUsuarios.Close;
  DataModuleF.QRYUsuarios.SQL.Text :=
              'SELECT ' +
              'ID, ' +
              'NOME_USUARIO, ' +
              'SENHA_USUARIO  ' +
              'FROM USUARIO_APP ' +
              'WHERE NOME_USUARIO = '+ QuotedStr(EdtUsuario.Text)+' '+
              'AND SENHA_USUARIO = ' + QuotedStr(EdtSenha.Text);

  DataModuleF.QRYUsuarios.Open;
  if DataModuleF.QRYUsuarios.IsEmpty then
  begin
    ShowMessage('Login ou senha não conferem!');
    EdtUsuario.SetFocus;
    abort;
  end
  else
  begin
      //MenuPrincipalF := TMenuPrincipalF.create(Self);
      //MenuPrincipalF.Show;
      Fprincipal.ShowModal;
      Hide;
  end;
end;

end.

