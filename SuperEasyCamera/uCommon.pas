unit uCommon;

interface

uses
  System.Classes;

const
  DB_NAME = 'SuperEasyCamera.s3db';

type
  TDirData = class
  private
    FName: String;
    FId: Int64;
    FCreatedAt: String;
    FParentId: Int64;
  public
    property Id: Int64 read FId write FId;
    property Name: String read FName write FName;
    property ParentId: Int64 read FParentId write FParentId;
    property CreatedAt: String read FCreatedAt write FCreatedAt;
  end;

  TPicData = class
  private
    FName: String;
    FId: Int64;
    FDirId: Int64;
    FCreatedAt: String;
  public
    property Id: Int64 read FId write FId;
    property Name: String read FName write FName;
    property DirId: Int64 read FDirId write FDirId;
    property CreatedAt: String read FCreatedAt write FCreatedAt;
  end;

implementation

end.
