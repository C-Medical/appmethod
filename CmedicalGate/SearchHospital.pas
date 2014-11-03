unit SearchHospital;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MainFormBase, FMX.Layouts, FMX.MultiView, FMX.ListBox;

type
  TfrmSearchHospital = class(TfrmMainBase)
    ToolBar2: TToolBar;
    btnSearch: TSpeedButton;
    lbxSearchConds: TListBox;
    ListBoxItem5: TListBoxItem;
    ComboBox1: TComboBox;
    ListBoxItem6: TListBoxItem;
    ComboBox2: TComboBox;
    procedure btnSearchClick(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmSearchHospital: TfrmSearchHospital;

implementation

{$R *.fmx}

uses
  SearchResult;

procedure TfrmSearchHospital.btnSearchClick(Sender: TObject);
begin
  inherited;
//
  if not Assigned(frmSearchResults) then
    frmSearchResults := TfrmSearchResults.Create(Application);
  frmSearchResults.Show;
end;

end.
