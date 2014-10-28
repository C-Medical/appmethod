unit frmListViewMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.ListView, Data.Bind.GenData,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope,
  Fmx.Bind.GenData;

type
  TfrmMain = class(TForm)
    pnlControl: TPanel;
    pnlList: TPanel;
    lstView: TListView;
    btnAddTextItem: TCornerButton;
    btnDelItem: TCornerButton;
    btnSearch: TSpeedButton;
    source: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure btnAddTextItemClick(Sender: TObject);
    procedure lstViewPullRefresh(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddComboBoxClick(Sender: TObject);
    procedure lstViewButtonClick(const Sender: TObject;
      const AItem: TListViewItem; const AObject: TListItemSimpleControl);
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

procedure TfrmMain.lstViewButtonClick(const Sender: TObject;
  const AItem: TListViewItem; const AObject: TListItemSimpleControl);
begin
  ShowMessage(AItem.Text + ' : ' + AItem.ButtonText);
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
