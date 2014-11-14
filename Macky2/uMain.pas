unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.ListBox, FMX.Layouts, FMX.MultiView;

  type

  TMainForm = class(TForm)
    StyleBook: TStyleBook;
    Panel: TPanel;
    WebBrowser: TWebBrowser;
    ToolBar: TToolBar;
    FlowLayout: TFlowLayout;
    btnReload: TSpeedButton;
    lblURL: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure WebBrowserDidFinishLoad(ASender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  WebBrowser.URL := 'https://mail.worksap.co.jp/webmail2';
  WebBrowser.EnableCaching := False;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  WebBrowser.Navigate;
end;

procedure TMainForm.WebBrowserDidFinishLoad(ASender: TObject);
begin
  lblURL.Text := WebBrowser.URL;
end;

procedure TMainForm.btnReloadClick(Sender: TObject);
begin
  WebBrowser.Reload;
end;


end.
