unit frmListViewMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.ListView;

type
  TfrmMain = class(TForm)
    pnlControl: TPanel;
    pnlList: TPanel;
    lstView: TListView;
    btnAddTextItem: TCornerButton;
    btnDelItem: TCornerButton;
    btnSearch: TSpeedButton;
    btnAddComboBox: TCornerButton;
    procedure btnAddTextItemClick(Sender: TObject);
    procedure lstViewPullRefresh(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddComboBoxClick(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnAddComboBoxClick(Sender: TObject);
var
  item: TListViewItem;
begin
  item := lstView.Items.Add;
  item.ButtonText := 'button text';
end;

procedure TfrmMain.btnAddTextItemClick(Sender: TObject);
begin
  lstView.Items.Add.Text := 'ITEM_' + IntToStr(lstView.ItemCount);
end;

procedure TfrmMain.btnDelItemClick(Sender: TObject);
begin
  if lstView.Selected = nil then Exit;
  lstView.Items.Delete(lstView.Selected.Index);
end;

procedure TfrmMain.lstViewPullRefresh(Sender: TObject);
begin
  lstView.ClearItems;
  lstView.Items.Add.Text := 'èâä˙èÛë‘Ç…ÉäÉtÉåÉbÉVÉÖ?';
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  lstView.SearchVisible := btnSearch.IsPressed;
end;

end.
