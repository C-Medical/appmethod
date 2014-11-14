unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Controls.Presentation,
  FMX.Edit;

type
  TForm1 = class(TForm)
    StyleBook1: TStyleBook;
    Button1: TButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    Switch1: TSwitch;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    DateEdit1: TDateEdit;
    ListBoxItem13: TListBoxItem;
    procedure Button1Click(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

uses
  FMX.Styles;

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TForm1.Button1Click(Sender: TObject);
var
  lbi: TListBoxItem;
  style: TFmxObject;
begin
  lbi := ListBox1.Selected;
  if lbi = nil then Exit;

  style := TStyleStreaming.LoadFromResource(HInstance, lbi.Text, RT_RCDATA);
  if Style<> nil then TStyleManager.SetStyle(Style);
end;

end.
