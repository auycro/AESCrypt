unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtText1: TEdit;
    edtPAss: TEdit;
    Button3: TButton;
    Button4: TButton;
    edtCipher: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   TestMethod = function(input:String) : integer; stdcall;
   R5InitCryptConf = function(input:String) : Boolean; stdcall;
   R5CryptEncrypt = function(input:String;var output:String) : Boolean; stdcall;
   R5CryptDecrypt = function(input:String;var output:String) : Boolean; stdcall;
   R5FinalCryptConf = function() : Boolean; stdcall;
var
  Form1: TForm1;

  //function MyDllMethod:integer; stdcall; external 'PDFManipulate.dll';

implementation

{$R *.dfm}

procedure Test1;
var
   dllHandle : cardinal;
   dllMethod : TestMethod;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'TestMethod') ;
        if Assigned (dllMethod) then
        begin
          ShowMessage(IntToStr(dllMethod('aaa')));
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
       Test1;
end;

procedure Test2;
var
   dllHandle : cardinal;
   dllMethod : R5InitCryptConf;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'R5InitCryptConf') ;
        if Assigned (dllMethod) then
        begin
          if dllMethod('1234') then ShowMessage('TRUE');
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Test2;
end;

procedure Test3(tmp1,tmp2:String);
var
   dllHandle : cardinal;
   dllMethod : R5CryptEncrypt;
   tmp:String;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'R5CryptEncrypt') ;
        if Assigned (dllMethod) then
        begin
          if dllMethod(tmp1,tmp2) then ShowMessage('TRUE');
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   dllHandle : cardinal;
   dllMethod : R5CryptEncrypt;
   tmp:String;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'R5CryptEncrypt') ;
        if Assigned (dllMethod) then
        begin
          if dllMethod(edtText1.Text , tmp) then edtCipher.text:= tmp;
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
   dllHandle : cardinal;
   dllMethod : R5CryptDecrypt;
   tmp:String;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'R5CryptDecrypt') ;
        if Assigned (dllMethod) then
        begin
          if dllMethod(edtCipher.text , tmp) then edtText1.text:= tmp;
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
   dllHandle : cardinal;
   dllMethod : R5FinalCryptConf;
begin
    dllHandle := LoadLibrary('R5Crypt64.dll') ;
     if dllHandle <> 0 then
     begin
        @dllMethod := GetProcAddress(dllHandle, 'R5FinalCryptConf') ;
        if Assigned (dllMethod) then
        begin
          if dllMethod() then ShowMessage('TRUE');
        end
        else  ShowMessage('function not found') ;
        FreeLibrary(dllHandle) ;
     end
     else
     begin
       ShowMessage('R5Crypt64.dll not found / not loaded') ;
     end;
end;

end.
