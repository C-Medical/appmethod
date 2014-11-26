unit uList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  System.IOUtils, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.Objects, FMX.ListView, System.Actions, FMX.ActnList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, uCommon, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FMX.Gestures;

type
  TfrmList = class(TFrame)
    Header: TToolBar;
    lblDir: TLabel;
    btnUp: TSpeedButton;
    lvMain: TListView;
    imgDir: TImage;
    imgPic: TImage;
    btnAdd: TSpeedButton;
    ActionList1: TActionList;
    actAdd: TAction;
    lblFirstMessage: TLabel;
    FDConnection1: TFDConnection;
    FDQueryCreateTableDir: TFDQuery;
    FDQueryInsertDir: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuerySelectDir: TFDQuery;
    FDQueryWk: TFDQuery;
    FDQueryDeleteDir: TFDQuery;
    GestureManager1: TGestureManager;
    procedure actAddExecute(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure lvMainGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FDQuerySelectDirAfterGetRecord(DataSet: TFDDataSet);
  private
    { private êÈåæ }
    FCurrentDirId: Int64;
  public
    { public êÈåæ }
    procedure Initialize;
  end;

implementation

{$R *.fmx}

procedure TfrmList.Initialize;
begin
  FCurrentDirId := 0;

  imgDir.Visible := False;
  imgPic.Visible := False;

  FDQueryCreateTableDir.ExecSQL;
  FDQuerySelectDir.ParamByName('ParentId').AsInteger := FCurrentDirId;
  FDQuerySelectDir.Open;
end;

procedure TfrmList.FDConnection1BeforeConnect(Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] :=
      System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, DB_NAME);
  {$ENDIF}
end;


procedure TfrmList.FDQuerySelectDirAfterGetRecord(DataSet: TFDDataSet);
begin
  ShowMessage(DataSet.FieldByName('Name').AsString);
end;

procedure TfrmList.actAddExecute(Sender: TObject);
begin
  InputQuery('ì¸óÕ', ['ÉtÉHÉãÉ_ñº'], [''], procedure(const AResult: TModalResult; const AValues: array of string)
  var
    s: String;
    dir: TDirData;
    li: TListViewItem;
  begin
    if AResult <> mrOk then Exit;
    s := Trim(AValues[0]);
    if Length(s) = 0 then Exit;

    dir := TDirData.Create;
    dir.Name := s;
    dir.ParentId := 0;
    dir.CreatedAt := FormatDateTime('yyyy/mm/dd hh:nn:ss', Now);

    FDQueryInsertDir.ParamByName('Name').AsString := dir.Name;
    FDQueryInsertDir.ParamByName('ParentId').AsInteger := dir.ParentId;
    FDQueryInsertDir.ParamByName('CreatedAt').AsString := dir.CreatedAt;
    FDQueryInsertDir.ExecSQL;

    dir.Id := FDConnection1.GetLastAutoGenValue('DirData');
    ShowMessage(IntToStr(dir.Id));

    lvMain.BeginUpdate;
    li := lvMain.Items.Add;
    li.Text := dir.Name;
    li.Detail := dir.CreatedAt;
    li.Bitmap.Assign(imgDir.Bitmap);
    lvMain.EndUpdate;
  end);
end;


procedure TfrmList.lvMainGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  li: TListViewItem;
begin
  if EventInfo.GestureID <> igiLongTap then Exit;

  li := lvMain.Selected;
  if li = nil then Exit;


  ShowMessage('Your choice ' + li.Text);

end;

end.
