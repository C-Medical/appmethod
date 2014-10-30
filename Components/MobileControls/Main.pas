unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  FMX.ComboEdit, FMX.DateTimeCtrls, FMX.Layouts, FMX.SearchBox;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Edit1: TEdit;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    FloatAnimation1: TFloatAnimation;
    GridLayout1: TGridLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Label1: TLabel;
    Edit5: TEdit;
    ClearEditButton2: TClearEditButton;
    DateEdit1: TDateEdit;
    CalloutPanel1: TCalloutPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SearchBox1: TSearchBox;
    procedure Edit1Enter(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  CalloutPanel1.Visible := true;
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
  CalloutPanel1.Visible := false;
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  edit1.ReadOnly := RadioButton1.ischecked;

end;

end.
