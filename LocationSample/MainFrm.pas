unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.MultiView, FMX.ListView.Types, FMX.ListView, System.Sensors,
  System.Sensors.Components, FMX.ListBox, FMX.Layouts, FMX.WebBrowser;

type
  TMainForm = class(TForm)
    mvMenu: TMultiView;
    ToolBar1: TToolBar;
    btnHideMultiView: TSpeedButton;
    lbxMenu: TListBox;
    ListBoxItem1: TListBoxItem;
    swLocationSensor: TSwitch;
    LocationSensorMain: TLocationSensor;
    Layout1: TLayout;
    toolbarMain: TToolBar;
    Label1: TLabel;
    WebBrowser1: TWebBrowser;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItemLatitude: TListBoxItem;
    Button1: TButton;
    ListBoxItemLongitude: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItemAdminArea: TListBoxItem;
    ListBoxItemLocality: TListBoxItem;
    ListBoxItemSubLocality: TListBoxItem;
    ListBoxItemSubThoroughfare: TListBoxItem;
    ListBoxItemThoroughfare: TListBoxItem;
    procedure btnHideMultiViewClick(Sender: TObject);
    procedure swLocationSensorSwitch(Sender: TObject);
    procedure LocationSensorMainLocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
    procedure FormCreate(Sender: TObject);
  private
    { private �錾 }
    FGeocoder: TGeocoder;
    procedure OnGeocodeReverseEvent(const Address: TCivicAddress);
  public
    { public �錾 }
  end;

var
  MainForm: TMainForm;

implementation

const
  GooGleMapURL = 'https://maps.google.com/maps?q=%s,%s';
//  GooGleMapURL = 'https://maps.google.com/maps?q=%s,%s&output=embed';

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FGeocoder := nil;
end;


//-----------------------------------------------------
// preview GoogleMap when changing the location
//-----------------------------------------------------
procedure TMainForm.LocationSensorMainLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  separator : Char;
  LLongitude, URLString: String;
begin
	// Show current location
  ListBoxItemLatitude.ItemData.Detail := Format('%2.6f',[NewLocation.Latitude]);
  ListBoxItemLongitude.ItemData.Detail:= Format('%2.6f',[NewLocation.Longitude]);


	URLString := Format(GooGleMapURL,
		[Format('%2.6f', [NewLocation.Latitude]), Format('%2.6f',[NewLocation.Longitude])]);

	WebBrowser1.Navigate(URLString);

  // set up instance of GeoCorder
  if not Assigned(FGeocoder) then
  begin
    if Assigned(TGeocoder.Current) then
      FGeocoder := TGeocoder.Current.Create;
    if Assigned(FGeocoder) then
      FGeocoder.OnGeocodeReverse := OnGeocodeReverseEvent;
  end;
  // Convert current location to address
  if Assigned(FGeocoder) and not FGeocoder.Geocoding then
    FGeocoder.GeocodeReverse(NewLocation);

end;

procedure TMainForm.OnGeocodeReverseEvent(const Address: TCivicAddress);
begin
  ListBoxItemAdminArea.ItemData.Detail       := Address.AdminArea;    //�Ǘ��̈�
  ListBoxItemLocality.ItemData.Detail        := Address.Locality;     //��於
  ListBoxItemSubLocality.ItemData.Detail     := Address.SubLocality;  //�T�u��於
  ListBoxItemSubThoroughfare.ItemData.Detail := Address.SubThoroughfare;//�T�u�ʂ�
  ListBoxItemThoroughfare.ItemData.Detail    := Address.Thoroughfare; //�ʂ�

//  ListBoxItemCountryCode.ItemData.Detail     := Address.CountryCode;//���R�[�h
//  ListBoxItemCountryName.ItemData.Detail     := Address.CountryName;//����
//  ListBoxItemFeatureName.ItemData.Detail     := Address.FeatureName;//�@�\��
//  ListBoxItemPostalCode.ItemData.Detail      := Address.PostalCode; //�X�֔ԍ�
//  ListBoxItemSubAdminArea.ItemData.Detail    := Address.SubAdminArea;//�T�u�Ǘ��̈�
end;
//-----------------------------------------------------
// Switch of Location Sensor
//-----------------------------------------------------
procedure TMainForm.swLocationSensorSwitch(Sender: TObject);
begin
  LocationSensorMain.Active := swLocationSensor.IsChecked;
end;

//-----------------------------------------------------
// Hide MultiView
//-----------------------------------------------------
procedure TMainForm.btnHideMultiViewClick(Sender: TObject);
begin
  mvMenu.HideMaster;
end;

end.
