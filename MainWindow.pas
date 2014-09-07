unit MainWindow;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Map, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  map: TMap;

implementation

{$R *.lfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  map := TMap.Create;

  if (not map.loadMap('levels\level002.txt')) then begin
    ShowMessage('Error on loading level file.');
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if (map <> nil) then begin
    map.Destroy;
  end;
end;

end.
