unit uList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.Objects, FMX.ListView;

type
  TfrmList = class(TFrame)
    Header: TToolBar;
    lblDir: TLabel;
    btnUp: TSpeedButton;
    lvMain: TListView;
    imgDir: TImage;
    imgPic: TImage;
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

implementation

{$R *.fmx}

end.
