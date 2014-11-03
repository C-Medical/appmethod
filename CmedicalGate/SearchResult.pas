unit SearchResult;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.Layouts, FMX.ListBox, FMX.TabControl,
  DetailBase;

type
  TfrmSearchResults = class(TForm)
    toolbarMain: TToolBar;
    lblSearchResults: TLabel;
    btnShowMenu: TButton;
    tbcSearchResults: TTabControl;
    tbSRList: TTabItem;
    tbSRMap: TTabItem;
    ListBox1: TListBox;
    WebBrowser1: TWebBrowser;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    item1: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    CalloutPanel1: TCalloutPanel;
    Label1: TLabel;
    procedure btnShowMenuClick(Sender: TObject);
    procedure tbcSearchResultsChange(Sender: TObject);
    procedure ListBoxItemClick(const Sender: TCustomListBox;  const Item: TListBoxItem);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmSearchResults: TfrmSearchResults;

implementation

{$R *.fmx}

uses
  SearchHospital, Reservation;

const
  GooGleMapURL = 'https://maps.google.com/maps?q=%s,%s';
  //
  LLatitude = '35.667350';
  LLongitude= '139.740473';


procedure TfrmSearchResults.btnShowMenuClick(Sender: TObject);
begin
  if (Visible) and Assigned(frmSearchHospital) then
  begin
    frmSearchHospital.Show;
  end;
end;

// this event fired after tab changed asap.
procedure TfrmSearchResults.tbcSearchResultsChange(Sender: TObject);
begin
  if tbcSearchResults.ActiveTab = tbSRMap then
  begin
    // google map
    WebBrowser1.Navigate(Format(GooGleMapURL, [LLatitude, LLongitude]));
    Exit;
  end;
end;

procedure TfrmSearchResults.ListBoxItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if not Assigned(frmReservation) then
    frmReservation := TfrmReservation.Create(Application);

  frmReservation.SetHospitalProp(Item.Text);
  frmReservation.Show;

end;

end.
