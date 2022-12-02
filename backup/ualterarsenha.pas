unit uAlterarSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uDataModule;

type

  { TFAlterarSenha }

  TFAlterarSenha = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EdtConfirmarSenha: TEdit;
    EdtSenhaNova: TEdit;
    EdtNomeUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  FAlterarSenha: TFAlterarSenha;

implementation
uses uLogin;

{$R *.lfm}

{ TFAlterarSenha }

procedure TFAlterarSenha.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFAlterarSenha.Button1Click(Sender: TObject);
begin
  if (EdtSenhaNova.Text <> '') and (EdtConfirmarSenha.Text <> '') and (EdtSenhaNova.Text = EdtConfirmarSenha.Text) then
  begin
    DataModuleF.QRYUsuarios.SQL.Clear;
    DataModuleF.QRYUsuarios.SQL.Add('UPDATE USUARIO_APP SET ' + 'SENHA_USUARIO = '+ QuotedStr(EdtSenhaNova.Text)
    +' '+ 'WHERE NOME_USUARIO = ' + QuotedStr(EdtNomeUsuario.Text));
    DataModuleF.QRYUsuarios.ExecSQL;
    Close;
    ShowMessage('Nova senha criada com sucesso');
    FEntrar.EdtUsuario.SetFocus;
  end
  else
  begin
    ShowMessage('Erro ao criar uma nova senha, Por favor verifique se os campos estão corretos');
    EdtNomeUsuario.SetFocus;
  end;
end;

end.

