program SuperEasyCamera;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {frmMain},
  uList in 'uList.pas' {frmList: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
