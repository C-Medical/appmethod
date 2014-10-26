unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    ScaledLayout1: TScaledLayout;
    FlowLayout1: TFlowLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    FlowLayoutBreak1: TFlowLayoutBreak;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    FlowLayoutBreak2: TFlowLayoutBreak;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { private éŒ¾ }
  public
    { public éŒ¾ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  list: TList;
begin
  // Components line up on TFlowLayout.
  // TFlowLayoutBreak will break line and can chenge the rule.

  list := TList.Create;
  try
    while FlowLayout1.ControlsCount > 0 do
    begin
      list.Add(FlowLayout1.Controls[0]);
      FlowLayout1.Controls[0].Parent := nil;
    end;

    for i := Pred(list.Count) downto 0 do
    begin
      TControl(list[i]).Parent := FlowLayout1;
    end;

  finally
    list.Free;
  end;

end;

end.
