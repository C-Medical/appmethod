unit frmMain1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ExtCtrls, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit,
  FMX.ComboEdit, FMX.Objects, System.TypInfo, FMX.Ani;

type
  TfrmAlignTest = class(TForm)
    pnlSetting: TPanel;
    pnlBase: TPanel;
    lblAlign: TLabel;
    pnlTarget1: TPanel;
    rect1: TRectangle;
    cmbAlign: TComboBox;
    pnlTarget2: TPanel;
    rect2: TRectangle;
    lblSelection: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cmbAlignChange(Sender: TObject);
    procedure PnlClick(Sender: TObject);
  private
    { private 宣言 }
    FDefaultPos1: TPosition;
    FDefaultPos2: TPosition;
    FDefaultSize1: TControlSize;
    FDefaultSize2: TControlSize;
    FCurrentPnl: TPanel;
  public
    { public 宣言 }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
  end;

var
  frmAlignTest: TfrmAlignTest;

implementation

{$R *.fmx}
{$R *.iPad.fmx IOS}

constructor TfrmAlignTest.Create;
var
  po: TPointF;
begin
  inherited;
  FDefaultPos1 := TPosition.Create(pnlTarget1.Position.Point);
  FDefaultPos2 := TPosition.Create(pnlTarget2.Position.Point);
  FDefaultSize1 := TControlSize.Create(pnlTarget1.Size.Size);
  FDefaultSize2 := TControlSize.Create(pnlTarget2.Size.Size);
  FCurrentPnl := pnlTarget1;
end;

destructor TfrmAlignTest.Destroy;
begin
  if Assigned(FDefaultPos1) then FDefaultPos1.Free;
  if Assigned(FDefaultPos2) then FDefaultPos2.Free;
  if Assigned(FDefaultSize1) then FDefaultSize1.Free;
  if Assigned(FDefaultSize2) then FDefaultSize2.Free;
  inherited;
end;

procedure TfrmAlignTest.cmbAlignChange(Sender: TObject);
var
  al: TAlignLayout;
begin
  if not Assigned(FCurrentPnl) then Exit;

  FCurrentPnl.Align := TAlignLayout.None;
  if FCurrentPnl.Name = 'pnlTarget1' then
  begin
    FCurrentPnl.Size := FDefaultSize1;
    FCurrentPnl.Position := FDefaultPos1;
  end else if FCurrentPnl.Name = 'pnlTarget2' then
  begin
    FCurrentPnl.Size := FDefaultSize2;
    FCurrentPnl.Position := FDefaultPos2;
  end;

  al := TAlignLayout(GetEnumValue(TypeInfo(TAlignLayout), cmbAlign.Selected.Text));
  FCurrentPnl.Align := al;
end;

procedure TfrmAlignTest.FormShow(Sender: TObject);
var
  i: Integer;
  al: string;
begin
  //コンボボックス用意
  for i := 0 to 19 do
  begin
    cmbAlign.Items.Add(GetEnumName(TypeInfo(TAlignLayout), i));
  end;
  al := GetEnumName(TypeInfo(TAlignLayout), Integer(pnlTarget1.Align));
  cmbAlign.ItemIndex := cmbAlign.Items.IndexOf(al);
end;

procedure TfrmAlignTest.PnlClick(Sender: TObject);
begin
  FCurrentPnl := (Sender as TRectangle).Parent as TPanel;
  lblSelection.Text := (Sender as TRectangle).Parent.Name + ' is selected.';
end;

end.
