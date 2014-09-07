{
  PROGRAMANDO JOGOS - AGNALDO BRODIS 1.0 - REFACTORED
  OPEN SOURCE - PLEASE KEEP THE AUTHOR CREDITS
  AUTHOR: ANTONIO SÉRGIO DE SOUSA VIEIRA 2014
  ACKNOWLEDGEMENTS: FABRÍCIO CATAE
  BRASIL - FORTALEZA - CE
  http://sergiosvieira.wordpress.com
}
unit Map;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileUtil;

const
  kCOLS = 9;
  kROWS = 8;
  kTILE_SIZE = 16; { pixels }

type
{ Tile }
  RTile = Record
    m_rect: TRect;
    m_id: Smallint;
    m_solid: Boolean;
  end;
{ Map }
  TMap = class(TObject)
  public
    constructor Create;
    destructor Destroy;
    function loadMap(a_filename: String) : Boolean;
  private
    //m_tiles: array[1..kCOLS, 1..kROWS] of RTile;
    m_tiles: array of array of RTile;
  end;

implementation

{* Method used to load a map from a text file *}

constructor TMap.create();
begin
  SetLength(m_tiles, kROWS, kCOLS);
end;

destructor TMap.destroy();
begin
     SetLength(m_tiles, 0, 0);
     m_tiles:= nil;
end;

function TMap.loadMap(a_filename: String): Boolean;
var
  textfile: Text;
  auxChar: Char;
  auxSmallInt: Smallint;
  row, col, id: SmallInt;
  pos_x, pos_y: Integer;
begin
  if (FileExistsUTF8(a_filename) { *Converted from FileExists* }) then
  begin
    row := 0;
    col := 0;
    id := 0;
    AssignFile(textfile, a_filename);
    Reset(textfile);

    while not EOF(textfile) do
    begin
      Read(textfile, auxChar);

      Case auxChar of
        #10, #13:
        begin
          Break;
        end
        else begin
          auxSmallInt := StrToInt(auxChar);
          pos_x := col * kTILE_SIZE;
          pos_y := row * kTILE_SIZE;

          with Self.m_tiles[row, col] do
          begin
            m_rect := Rect(pos_x, pos_y, pos_x + KTILE_SIZE, pos_y + KTILE_SIZE);
            m_id := id;
            Inc(id);
            
            if (auxSmallInt = 0) then begin
              m_solid := False;
            end else begin
              m_solid := True;
            end;
          end;

          if (col = kCOLS - 1) then begin
            col := 0;
            Inc(row);
          end else begin
            Inc(col);
          end;
        end
      end;
    end;

    CloseFile(textfile);
    Result:= True;
  end
    else
  begin
    Result:= False;
  end
end;

end.

