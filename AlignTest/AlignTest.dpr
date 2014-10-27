program AlignTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmMain1 in 'frmMain1.pas' {frmAlignTest};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAlignTest, frmAlignTest);
  Application.Run;
end.
