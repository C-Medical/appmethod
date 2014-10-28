unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, System.Rtti, FMX.Grid, FMX.Effects, FMX.Ani,
  Data.Bind.Components, Data.Bind.ObjectScope,
  System.Generics.Collections, FMX.NumberBox, FMX.DateTimeCtrls;

type
  TForm1 = class(TForm)
    ScaledLayout1: TScaledLayout;
    StyleBook1: TStyleBook;
    FlowLayout1: TFlowLayout;
    btnAdd: TSpeedButton;
    btnDel: TSpeedButton;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure StringGrid1DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
    procedure btnDelClick(Sender: TObject);
  private
    { private êÈåæ }
    FDataList: TObjectList<TDictionary<String, String>>;
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

uses
  uDlg;

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDataList := TObjectList<TDictionary<String, String>>.Create;
  StringGrid1.DefaultDrawing := True;
  StringGrid1.RowCount := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDataList);
end;

procedure TForm1.btnAddClick(Sender: TObject);
var
  dlg: TForm2;
  data: TDictionary<String, String>;
  s: String;
begin
  dlg := TForm2.Create(Self);
  // Use anonymous function when call ShowModal!
  dlg.ShowModal(procedure(ModalResult: TModalResult)
    begin
      if ModalResult = mrOk then
      begin
        data := TDictionary<String, String>.Create;
        data.Add('Col1', dlg.Col1);
        data.Add('Col2', dlg.Col2);
        data.Add('Col3', dlg.Col3);

        FDataList.Add(data);

        StringGrid1.RowCount := FDataList.Count;

        // You can set value by Cells property.
        // data.TryGetValue('Col1', s);
        // StringGrid1.Cells[0, Pred(FDataList.Count)] := s;
      end;

      // Use DisposeOf instead of try~finally~dlg.Free;~end;
      dlg.DisposeOf;
    end);
end;

procedure TForm1.StringGrid1DrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
var
  data: TDictionary<String, String>;
  s: String;
begin
  // Custom draw cell.
  data := FDataList[Row];

  if Column.Name = 'StringColumn1' then
  begin
    data.TryGetValue('Col1', s);
    StringGrid1.DefaultDrawColumnCell(Canvas, Column, Bounds, Row, s, State);
  end else if Column.Name = 'StringColumn2' then
  begin
    data.TryGetValue('Col2', s);
    Canvas.FillText(Bounds, s, True, 1.0,
      [TFillTextFlag.RightToLeft], TTextAlign.Center);
  end else if Column.Name = 'StringColumn3' then
  begin
    data.TryGetValue('Col3', s);
    Canvas.FillText(Bounds, s, True, 0.75,
      [TFillTextFlag.RightToLeft], TTextAlign.Leading);
  end;
end;

procedure TForm1.btnDelClick(Sender: TObject);
var
  i: Integer;
begin
  i := StringGrid1.Selected;
  if i = -1 then Exit;

  FDataList.Delete(i);
  StringGrid1.RowCount := FDataList.Count;
end;


end.
