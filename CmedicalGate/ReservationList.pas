unit ReservationList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MainFormBase, FMX.Layouts, FMX.MultiView, FMX.ListBox;

type
  TfrmReservationList = class(TfrmMainBase)
    lbxReservationList: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    item1: TListBoxItem;
    CalloutPanel1: TCalloutPanel;
    listItemHeaderHistory: TListBoxGroupHeader;
    procedure lbxReservationListItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure btnHideMultiViewClick(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmReservationList: TfrmReservationList;

implementation

{$R *.fmx}

uses
  MainForm, ReservationDetails;

procedure TfrmReservationList.btnHideMultiViewClick(Sender: TObject);
begin
  inherited;
  frmMain.Show();
end;

procedure TfrmReservationList.lbxReservationListItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  inherited;
  //
  if not Assigned(frmReservationDetails) then
    frmReservationDetails := TfrmReservationDetails.Create(Application);

  frmReservationDetails.Show;
end;

end.
