unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ExtCtrls, FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    PopupBox1: TPopupBox;
    Label1: TLabel;
    Memo1: TMemo;
    PopupBox2: TPopupBox;
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
