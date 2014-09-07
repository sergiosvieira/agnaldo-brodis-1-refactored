program AgnaldoBrodis1;

{$MODE Delphi}

uses
  Forms, Interfaces,
  MainWindow in 'MainWindow.pas' {Form1},
  Map in 'Map.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
