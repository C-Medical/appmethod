unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.StdCtrls,
  FMX.Layouts, Data.Bind.Components, FMX.ListView, FMX.MultiView,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  FMX.Objects, Data.Bind.ObjectScope, Fmx.Bind.Navigator, System.Actions,
  FMX.ActnList, FMX.Ani, FMX.Colors, FMX.Memo;

type
  TForm1 = class(TForm)
    MultiView1: TMultiView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView1: TListView;
    BindingsList1: TBindingsList;
    ScaledLayout1: TScaledLayout;
    DetailToolbar: TToolBar;
    MasterButton: TSpeedButton;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    PrototypeBindSource1: TPrototypeBindSource;
    Layout2: TLayout;
    Layout3: TLayout;
    lblName: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    ActionList1: TActionList;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    ColorAnimation1: TColorAnimation;
    LinkListControlToField1: TLinkListControlToField;
    Label2: TLabel;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    ColorBox1: TColorBox;
    LinkPropertyToFieldColor2: TLinkPropertyToField;
    Memo1: TMemo;
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
