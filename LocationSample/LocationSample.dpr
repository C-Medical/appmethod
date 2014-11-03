program LocationSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainFrm in 'MainFrm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
