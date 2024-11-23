Unit MainWM;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Web.Stencils, FireDAC.Stan.StorageJSON,
  System.Generics.Collections;

type

  TMainWebModule = class(TWebModule)
    WebFileDispatcher: TWebFileDispatcher;
    FDMemTable: TFDMemTable;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    WebStencilsEngine: TWebStencilsEngine;
  private
  
  public

  end;

var
  WebModuleClass: TComponentClass = TMainWebModule;

implementation

{$R *.DFM}


end.
