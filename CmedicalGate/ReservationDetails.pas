unit ReservationDetails;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  DetailBase, FMX.Layouts, FMX.Objects;

type
  TfrmReservationDetails = class(TfrmDetailBase)
    FlowLayout1: TFlowLayout;
    Label4: TLabel;
    lblReservationDate: TLabel;
    FlowLayoutBreak1: TFlowLayoutBreak;
    Label2: TLabel;
    Label3: TLabel;
    FlowLayoutBreak2: TFlowLayoutBreak;
    Label5: TLabel;
    Label6: TLabel;
    FlowLayoutBreak3: TFlowLayoutBreak;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FlowLayoutBreak4: TFlowLayoutBreak;
    FlowLayoutBreak5: TFlowLayoutBreak;
    FlowLayoutBreak6: TFlowLayoutBreak;
    FlowLayout2: TFlowLayout;
    Image1: TImage;
    FlowLayoutBreak7: TFlowLayoutBreak;
    btnConfirm: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure btnConfirmClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnShowMenuClick(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmReservationDetails: TfrmReservationDetails;

implementation

{$R *.fmx}

uses
  MainForm, ReservationList;

procedure TfrmReservationDetails.btnConfirmClick(Sender: TObject);
begin
  inherited;
  frmMain.Show;
end;

procedure TfrmReservationDetails.btnShowMenuClick(Sender: TObject);
begin
  inherited;
  //
  Self.Close;
  if not Assigned(frmReservationList) then
    frmReservationList := TfrmReservationList.Create(Application);
  frmReservationList.Show;
end;

procedure TfrmReservationDetails.FormActivate(Sender: TObject);
begin
  inherited;
  lblReservationDate.Text :=
    FormatDateTime('yyyy"îN"m"åé"d"ì˙"',Now);
end;

end.
