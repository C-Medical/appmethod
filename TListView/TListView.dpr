program TListView;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmListViewMain in 'frmListViewMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
