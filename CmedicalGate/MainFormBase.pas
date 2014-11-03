unit MainFormBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.MultiView;

type
  TfrmMainBase = class(TForm)
    mlvMenu: TMultiView;
    ToolBar1: TToolBar;
    btnHideMultiView: TSpeedButton;
    MainLayout: TLayout;
    toolbarMain: TToolBar;
    lblTitle: TLabel;
    btnShowMenu: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnHideMultiViewClick(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  frmMainBase: TfrmMainBase;

implementation

{$R *.fmx}

uses
  Menu;

(* constructor *)
procedure TfrmMainBase.FormCreate(Sender: TObject);
var menu: TMenuBox;
begin
  menu := TMenuBox.Create(Self);
  menu.SetMyParent(mlvMenu);
end;

procedure TfrmMainBase.btnHideMultiViewClick(Sender: TObject);
begin
  mlvMenu.HideMaster;
end;


end.
