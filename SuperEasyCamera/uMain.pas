unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.ListView.Types, FMX.ListView,
  FMX.Controls.Presentation, FMX.Edit, FMX.MultiView, uList;

type
  TfrmMain = class(TForm)
    Footer: TToolBar;
    StyleBook1: TStyleBook;
    btnCamera: TButton;
    FlowLayout1: TFlowLayout;
    frmList: TfrmList;
    CalloutRectangle1: TCalloutRectangle;
    Text1: TText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmList.Initialize;
end;

end.
