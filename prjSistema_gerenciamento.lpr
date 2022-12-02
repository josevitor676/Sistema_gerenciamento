program prjSistema_gerenciamento;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uPrincipal, uDataModule, uAparelhos, uLogin, uAlterarSenha;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Sistema_gerenciamento';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFEntrar, FEntrar);
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.CreateForm(TDataModuleF, DataModuleF);
  Application.Run;
end.

