unit XMLConfigManager;

interface

uses
  System.SysUtils, System.Classes, Xml.XMLDoc, Xml.XMLIntf;

type
  TXMLConfigManager = class
  private
    FXMLDocument: TXMLDocument;
    FXMLFileName: string;

  public
    constructor Create(const FileName: string);
    destructor Destroy; override;

    function GetValue(const Section, Key: string; Default: string = ''): string;
    procedure SetValue(const Section, Key, Value: string);

    procedure SaveToFile;
  end;

implementation

constructor TXMLConfigManager.Create(const FileName: string);
begin
  inherited Create;
  FXMLFileName := FileName;
  FXMLDocument := TXMLDocument.Create(nil);
  FXMLDocument.Active := True;

  if FileExists(FXMLFileName) then
    FXMLDocument.LoadFromFile(FXMLFileName)
  else
  begin
    // Create a new XML structure
    FXMLDocument.XML.Text := '<config></config>';
    SaveToFile;
  end;
end;

destructor TXMLConfigManager.Destroy;
begin
  SaveToFile;
  FXMLDocument.Free;
  inherited Destroy;
end;

function TXMLConfigManager.GetValue(const Section, Key: string; Default: string): string;
var
  Node: IXMLNode;
begin
  Result := Default;
  Node := FXMLDocument.DocumentElement.ChildNodes.FindNode(Section);
  if Assigned(Node) then
  begin
    Node := Node.ChildNodes.FindNode(Key);
    if Assigned(Node) then
      Result := Node.Text;
  end;
end;

procedure TXMLConfigManager.SetValue(const Section, Key, Value: string);
var
  RootNode, SectionNode, KeyNode: IXMLNode;
begin
  RootNode := FXMLDocument.DocumentElement;

  SectionNode := RootNode.ChildNodes.FindNode(Section);
  if not Assigned(SectionNode) then
    SectionNode := RootNode.AddChild(Section);

  KeyNode := SectionNode.ChildNodes.FindNode(Key);
  if not Assigned(KeyNode) then
    KeyNode := SectionNode.AddChild(Key);

  KeyNode.Text := Value;
end;

procedure TXMLConfigManager.SaveToFile;
begin
  FXMLDocument.SaveToFile(FXMLFileName);
end;

end.
