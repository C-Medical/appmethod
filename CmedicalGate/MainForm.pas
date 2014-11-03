unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MainFormBase, FMX.Layouts, FMX.MultiView, FMX.ListBox, FMX.Objects;

type
  TfrmMain = class(TfrmMainBase)
    Image1: TImage;
    lbxTopMain: TListBox;
    listItemQueryReservation: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    listItemReservation: TListBoxItem;
    procedure lbxTopMainItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  SearchHospital, ReservationDetails;

procedure TfrmMain.lbxTopMainItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  inherited;

  if (item = listItemQueryReservation) then
  begin
   if not Assigned(frmReservationDetails) then
      frmReservationDetails := TfrmReservationDetails.Create(Application);
    frmReservationDetails.Show;
  end;

  if (item = listItemReservation) then
  begin
    if not Assigned(frmSearchHospital) then
      frmSearchHospital := TfrmSearchHospital.Create(Application);
    frmSearchHospital.Show;
  end;

end;

end.
