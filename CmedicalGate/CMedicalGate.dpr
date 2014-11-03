program CMedicalGate;

uses
  System.StartUpCopy,
  FMX.Forms,
  SearchResult in 'SearchResult.pas' {frmSearchResults},
  Reservation in 'Reservation.pas' {frmReservation},
  Menu in 'Menu.pas' {MenuBox},
  MainFormBase in 'MainFormBase.pas' {frmMainBase},
  SearchHospital in 'SearchHospital.pas' {frmSearchHospital},
  MainForm in 'MainForm.pas' {frmMain},
  DetailBase in 'DetailBase.pas' {frmDetailBase},
  ReservationDetails in 'ReservationDetails.pas' {frmReservationDetails},
  ReservationList in 'ReservationList.pas' {frmReservationList};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
