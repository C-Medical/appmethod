unit uDlg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.EditBox, FMX.NumberBox, FMX.DateTimeCtrls, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Edit;

type
  TForm2 = class(TForm)
    ScaledLayout1: TScaledLayout;
    FlowLayout1: TFlowLayout;
    Label1: TLabel;
    Edit1: TEdit;
    FlowLayoutBreak1: TFlowLayoutBreak;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    FlowLayoutBreak2: TFlowLayoutBreak;
    Label3: TLabel;
    NumberBox1: TNumberBox;
    FlowLayoutBreak3: TFlowLayoutBreak;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function GetCol1: String;
    function GetCol2: String;
    function GetCol3: String;
    { private êÈåæ }
  public
    { public êÈåæ }
    property Col1: String read GetCol1;
    property Col2: String read GetCol2;
    property Col3: String read GetCol3;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TForm2.GetCol1: String;
begin
  Result := Edit1.Text;
end;

function TForm2.GetCol2: String;
begin
  Result := DateEdit1.Text;
end;

function TForm2.GetCol3: String;
begin
  Result := NumberBox1.Text;
end;

end.
