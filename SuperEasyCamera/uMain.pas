unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.ListView.Types, FMX.ListView,
  FMX.Controls.Presentation, FMX.Edit, FMX.MultiView, uNameInput, uList;

type
  TfrmMain = class(TForm)
    Footer: TToolBar;
    StyleBook1: TStyleBook;
    btnCamera: TButton;
    btnAddDir: TButton;
    FlowLayout1: TFlowLayout;
    frmList: TfrmList;
    CalloutRectangle1: TCalloutRectangle;
    Text1: TText;
    procedure btnAddDirClick(Sender: TObject);
  private
    { Private declarations }
    FNameInputDlg: TfrmNameInput;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnAddDirClick(Sender: TObject);
begin
  InputQuery('ñºëOÇì¸óÕÇµÇƒÇ≠ÇæÇ≥Ç¢ÅB', [''], [''],
    procedure(const AResult: TModalResult; const AValues: array of string)
  begin
    frmList.lvMain.Items.Add.Text := AValues[0];
  end);
end;

end.
