unit Delivery.Controller.Forms;

interface

uses
  FMX.Types, FMX.Layouts;

type
  TControllerForms = class
    class procedure CreateForm(ClassName : String; aParent : TLayout = nil);
  end;

implementation

uses
  System.Classes, FMX.Forms, System.SysUtils;

{ TControllerForms }

class procedure TControllerForms.CreateForm(ClassName: String; aParent : TLayout = nil);
var
  ObjFMX : TFMXObjectClass;
  newForm : TCustomForm;
begin
  objFMX := TFMXObjectClass(GetClass(ClassName));
  try
    newForm := (objFMX.Create(nil) as TCustomForm);
    newForm.Position := TFormPosition.OwnerFormCenter;

    if aParent <> nil then begin


        newForm.Show;
        newForm.Width := StrToInt(aParent.Width.ToString);
        newForm.Height := StrToInt(aParent.Height.ToString);
        newForm.Left := StrToInt(aParent.Position.X.ToString);
        newForm.Top := StrToInt(aParent.Position.Y.ToString)+23;

        newForm.Parent := aParent;

       exit;
    end;

    try
      if aParent = nil then
      newForm.ShowModal;

    finally
      if Assigned(newForm) then
      newForm.Free;
    end;
  except
    raise Exception.Create('Objeto não existe '+ClassName);
  end;
end;
end.
