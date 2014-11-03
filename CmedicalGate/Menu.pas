unit Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts;

type
  TMenuBox = class(TForm)
    lbxMenu: TListBox;
    listItemFindHotel: TListBoxItem;
    listItemReservaionList: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem18: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    SearchBox1: TSearchBox;
    listItemTopPage: TListBoxItem;
    procedure listItemFindHotelClick(Sender: TObject);
    procedure listItemReservaionListClick(Sender: TObject);
    procedure listItemTopPageClick(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
    procedure SetMyParent(objParent: TFmxObject);
  end;

var
  MenuBox: TMenuBox;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses
  MainForm, SearchHospital, ReservationList;

{ TMenuBox }

// 親セット
procedure TMenuBox.SetMyParent(objParent: TFmxObject);
begin
  lbxMenu.Parent := objParent;
  lbxMenu.Visible:= True;
end;

// find a hospital
procedure TMenuBox.listItemFindHotelClick(Sender: TObject);
begin
  if not Assigned(frmSearchHospital) then
    frmSearchHospital := TfrmSearchHospital.Create(Application);
  frmSearchHospital.Show;
end;

procedure TMenuBox.listItemReservaionListClick(Sender: TObject);
begin
  if not Assigned(frmReservationList) then
    frmReservationList := TfrmReservationList.Create(Application);
  frmReservationList.Show;
end;

// top page
procedure TMenuBox.listItemTopPageClick(Sender: TObject);
begin
  frmMain.Show;
end;

end.
